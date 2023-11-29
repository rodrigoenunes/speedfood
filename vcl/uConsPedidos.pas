unit uConsPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  IniFiles, ShellAPI;
  Procedure ConsultarPedidos;

type
  TFuConsPedidos = class(TForm)
    Panel1: TPanel;
    PanCtle: TPanel;
    GridPed: TDBGrid;
    NavPed: TDBNavigator;
    btImprimirPedido: TBitBtn;
    btEmitirNFCe: TBitBtn;
    btSair: TBitBtn;
    btImprimirEtiquetas: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btImprimirPedidoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btEmitirNFCeClick(Sender: TObject);
    procedure btImprimirEtiquetasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuConsPedidos: TFuConsPedidos;
  wArqXML,wArqSai: String;

implementation

{$R *.dfm}

uses uDados, uImpressoes, uGenericas, SFEuPrintFortes;

Procedure ConsultarPedidos;
var xEmissoes: String;
    lDisp: Boolean;
begin
  lDisp := False;
  xEmissoes := ObtemParametro('NFCe_Reais') +     // Pagto em Reais (dinheiro)
               ObtemParametro('NFCe_CDebito') +   // Pagto Cartao de débito
               ObtemParametro('NFCe_CCredito') +  // Pagto Cartao de crédito
               ObtemParametro('NFCe_PIX') +       // Pagto PIX
               ObtemParametro('NFCe_Outros') +    // Pagto Outros
               ObtemParametro('NFCe_Misto');      // Pagto Misto
  if (Pos('S',xEmissoes) > 0) or (Pos('Q',xEmissoes) > 0) then
    lDisp := True;

  FuConsPedidos := TFuConsPedidos.Create(nil);
  FuConsPedidos.Height := Screen.Height - 60;
  FuConsPedidos.Top := 10;
  FuConsPedidos.Width := Trunc(Screen.Width * 0.60);
  FuConsPedidos.Left := 40;
  FuConsPedidos.btEmitirNFCe.Enabled := lDisp;
  FuConsPedidos.ShowModal;
  FuConsPedidos.Free;

end;

procedure TFuConsPedidos.btImprimirEtiquetasClick(Sender: TObject);
begin
  if MessageDlg('Emissão de etiquetas' + #13 +
                'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                'Confirme a emissão das etiquetas do pedido',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
    EmiteEtiquetas(uDM.PedidosNumero.AsInteger, 0);   // Imprime TODAS as etiquetas do pedido

end;


procedure TFuConsPedidos.btEmitirNFCeClick(Sender: TObject);
var wExec,wParam: String;
    wIniName,wAbrir,wImprimir,wPDF,wTrans: String;
    wIniFile: TIniFile;
begin
  if uDM.Pedidos.RecordCount = 0 then Exit;
  if uDM.PedidosNrNFCe.AsInteger > 0
  then begin
  //  ShowMessage('Re-impressão da NFCe' + #13 + 'XML=' + uDM.PedidosArqXML.AsString);
    wArqXML := ExtractFilePath(Application.ExeName) + 'wNFe.XML';
    wArqSai := ExtractFilePath(Application.ExeName) + 'wNFe.Txt';
    DeleteFile(wArqXML);
    DeleteFile(wArqSai);
    uDM.PedidosArqXML.SaveToFile(wArqXML);
    wExec := ObtemParametro('ACNFE_EXE');
    if not FileExists(wExec)
    then begin
      wExec := ExtractFilePath(Application.ExeName) + wExec;
      if not FileExists(wExec) then
      begin
        wExec := ObtemParametro('ACNFE_EXE');
        MessageDlg(wExec + ' não encontrado, processo abortado',mtInformation,[mbOk],0);
        Exit;
      end;
    end;
    wIniName := ChangeFileExt(wExec,'.Ini');
    wIniFile := TIniFile.Create(wIniName);
    wAbrir := wIniFile.ReadString('NFC','AbrirDANFE','');
    wImprimir := wIniFile.ReadString('NFC','ImprimirAuto','');
    wPDF := wIniFile.ReadString('NFC','PathSalvarPDF','');
    wTrans := wIniFile.ReadString('NFC','PathSalvar','');
    //
    wIniFile.WriteString('NFC','AbrirDANFE','S');
    wIniFile.WriteString('NFC','ImprimirAuto','S');
    wIniFile.WriteString('NFC','PathSalvarPDF',wTrans);
    //
    wParam := '/GERARDANFE ' + wArqXML + ' -as ' + wArqSai;   // + ' -nroimp 1';
    ShellExecute(0,'open',pChar(wExec),pChar(wParam),'',1);
    sleep(2500);
    //
    wIniFile.WriteString('NFC','AbrirDANFE',wAbrir);
    wIniFile.WriteString('NFC','ImprimirAuto',wImprimir);
    wIniFile.WriteString('NFC','PathSalvarPDF',wPDF);
    wIniFile.WriteString('NFC','PathSalvar',wTrans);
    wIniFile.Free;
    Exit;
  end;
  if MessageDlg('Geração / Emissão de NFCe' + #13 +
                'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                'Valor: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,15,2) + #13 +
                'Meio pagamento: ' + uDM.PedidosZC_MPExtenso.AsString,
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
  then EmiteNFCe(uDM.PedidosNumero.AsInteger, True);

end;

procedure TFuConsPedidos.btImprimirPedidoClick(Sender: TObject);
begin
  if uDM.Pedidos.RecordCount = 0 then Exit;
  ImprimePedido(uDM.PedidosNumero.AsInteger);  //, False);

end;

procedure TFuConsPedidos.btSairClick(Sender: TObject);
begin
  FuConsPedidos.Close;

end;

procedure TFuConsPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DeleteFile(wArqXML);

end;

procedure TFuConsPedidos.FormResize(Sender: TObject);
begin
  if FuConsPedidos.Width < 670 then FuConsPedidos.Width := 670;
  if FuConsPedidos.Height < 480 then FuConsPedidos.Height := 480;
  GridPed := DefineGrid(GridPed,[0.08,0.15,0.06,0.10,0.33,0.05,0.06,0.08,0.04],4,0);

end;

procedure TFuConsPedidos.FormShow(Sender: TObject);
begin
  uDM.Pedidos.Last;

end;

end.
