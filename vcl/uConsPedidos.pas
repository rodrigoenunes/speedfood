unit uConsPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, IniFiles, ShellAPI;
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
    btCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btImprimirPedidoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btEmitirNFCeClick(Sender: TObject);
    procedure btImprimirEtiquetasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuConsPedidos: TFuConsPedidos;
  wArqXML,wArqSai: String;
  wExec: String;

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
  //
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
  //
  FuConsPedidos := TFuConsPedidos.Create(nil);
  FuConsPedidos.Height := Screen.Height - 60;
  FuConsPedidos.Top := 10;
  FuConsPedidos.Width := Trunc(Screen.Width * 0.60);
  FuConsPedidos.Left := 40;
  FuConsPedidos.btEmitirNFCe.Enabled := lDisp;
  FuConsPedidos.ShowModal;
  FuConsPedidos.Free;

end;

Procedure RetornoACNFe(pArqSai:String; pTempo:Integer; var pRetorno:String; pTmpExtra:Integer = 0);
var wTempo,i: Integer;
    wRetorno: TStringList;
begin
  // Sleep(pTmpExtra * 1000);
  pRetorno := '';
  wTempo := 0;               // Tempo decorrido
  pTempo := pTempo * 1000;   // Tempo a decorrer em milisegundos
  //FuConsPedidos.Memo1.Lines.Add('Antes While: ' + wTempo.ToString + '/' + pTempo.ToString);
  while wTempo < pTempo do
  begin
    //FuConsPedidos.Memo1.Lines.Add('Dentro while: ' + wTempo.ToString + '/' + pTempo.ToString);
    sleep(500);
    if FileExists(pArqSai) then
    begin
      //FuConsPedidos.Memo1.Lines.Add('Arquivo existe!');
      wRetorno := TStringList.Create;
      wRetorno.LoadFromFile(pArqSai);
      //FuConsPedidos.Memo1.Lines.Add('Conteudo Arquivo:');
      //FuConsPedidos.Memo1.Lines.Add(wRetorno.Text);
      for i := 0 to wRetorno.Count-1 do
        pRetorno := pRetorno + wRetorno[i];
      wRetorno.Free;
      wTempo := pTempo + 500;
    end
    else
    Begin
      wTempo := wTempo + 500;
      //FuConsPedidos.Memo1.Lines.Add('Arquivo NAO existe!');
    End;
  end;
  //FuConsPedidos.Memo1.Lines.Add('Fora While: ' + wTempo.ToString + '/' + pTempo.ToString);
  //FuConsPedidos.Memo1.Lines.Add('pRetorno:');
  //FuConsPedidos.Memo1.Lines.Add(pRetorno);



end;


Function CancelaCartao(pExec:String): Boolean;
var wVlrPago,wData,wTpCard: String;
    wCmdo,wParm,wRetorno: String;
    codRetorno: Integer;
    wVlr: Currency;
begin
{                                    cAut                    NrDoc
  ACNFe6 /tef /cancelar CIELO 316,30 273337 13/10/23 CREDITO 23208 arq-nfe.xml -as C:\saida\padrao.txt
        Valor com 2 decimais !!!!!!!    }
  Result := False;
  if uDM.PedDetpag.RecordCount = 0 then
    Exit;
  //
  wArqSai := ExtractFilePath(Application.ExeName) + 'wTEF.Txt';
  wArqXML := uDM.PedidosIdArqXML.AsString;
  if not FileExists(wArqXML) then
  begin
    MessageDlg('Arquivo XML não encontrado' + #13 + wArqXML + #13 +
               'Processo interrompido',mtError,[mbOk],0);
    Exit;
  end;

  uDM.PedDetpag.First;
  while not uDM.PedDetpag.Eof do
  begin
    if uDM.PedDetpagSit.AsInteger = 0 then
    begin
      wTpCard := '';
      if uDM.PedDetpagtPag.AsString = '03' then
        wTpCard := 'CREDITO'
      else
        wTpCard := 'DEBITO';
      wData    := Copy(uDM.PedidosData.AsString,1,10);
      wData    := Copy(wData,1,6) + Copy(wData,9,2);
      wVlrPago := FloatToStrF(uDM.PedDetpagValor.AsCurrency,ffFixed,15,2);
      wCmdo    := pExec;                                     // Executável
      wParm    := '/tef /cancelar ' +                        // Parametros iniciais
                  'PAGSEGURO ' +    //uDM.PedDetpagAfiliacao.AsString + ' ' +             // Afiliação
                  wVlrPago + ' ' +                                    // Valor do cartão
                  uDM.PedDetpagcAut.AsString + ' ' +                  // Autorização da operação
                  wData + ' ' +                                       // Data do ocorrido   (dd/mm/aa)
                  wTpCard + ' ' +                                     // CREDITO ou DEBITO
                  uDM.PedDetpagnrDocto.AsString + ' ' +               // Nro do documento (da transação do cartão)
                  wArqXML +                                           // Arquivo XML da NFCe
                ' -as ' + wArqSai;                                     // Arquivo saída específico de cancelamento de cartão
      if MessageDlg('Cancelamento de transação com cartão de crédito/débito' + #13#13 +
                    'Pedido: ' + uDM.PedidosNumero.AsString + '   Seq: ' + uDM.PedDetpagSeq.AsString + #13 +
                    'Nr.docto: ' + uDM.PedDetpagnrDocto.AsString +
                    '   Cód.venda: ' + uDM.PedDetpagcodVenda.AsString + #13 +
                    'Cartão: ' + uDM.PedDetpagZC_nrCartao.AsString + #13 +
                    'Valor: ' + FloatToStrF(uDM.PedDetpagValor.AsCurrency,ffNumber,15,2) + #13#13 + 'Confirme',
                    mtConfirmation,[mbYes,mbNo],0,mbNo) = mrYes
      then begin
        DeleteFile(wArqSai);

        // InputQuery('', 'wCmdo', wCmdo);
        // InputQuery('', 'wParm', wParm);

        ShellExecute(0,'open',pChar(wCmdo),pChar(wParm),'',1);

        RetornoACNFe(wArqSai,90,wRetorno,5);
        ShowMessage('TEF ' + wRetorno);
        uDM.PedDetpag.Edit;
        uDM.PedDetpagSit.AsInteger := 1;
        uDM.peddetpag.Post;
      end;
    end;
    uDM.PedDetpag.Next;
  end;
  Result := True;

end;

Function CancelaNFCe(pExec:String): Boolean;
var wChave,wJustif,wCmdo,wParm,wRetorno: String;
begin
{
/CANCELARNF <chave_nfe> <just> [<-email email@xyz.com>] [<-as arq_saida>] [<-arqxml arq_xml>] [<-seq num_seq>] [<nroimp> N]
<chave_nfe>            Chave de 44 dígitos do NFe
<just>                 Justificativa do cancelamento do NFe
<-email email@xyz.com> Parâmetro opcional.
<-as arq_saida>        Arquivo de saída alternativo ao do ini
<-arqxml arq_xml>      Arquivo de entrada XML para a geração do DANFe.
<-seq num_seq>         Sequência do evento. Se não informado, será considerado 1\
<-nroimp N>            Nro de vezes que o documento será enviado para impressora
<-rav arqRAV>          Arquivo RAV do DANFe modelo para gerar o PDF
}
  Result := False;
  wArqXML := uDM.PedidosIdArqXML.AsString;
  if not FileExists(wArqXML) then
  begin
    MessageDlg('Arquivo XML não encontrado' + #13 + wArqXML + #13 +
               'Processo interrompido',mtError,[mbOk],0);
    Exit;
  end;

  wArqSai := ExtractFilePath(Application.ExeName) + 'wCanc.Txt';
  wChave  := uDM.PedidosChaveNFe.AsString;
  wJustif := ObtemParametro('JustifCancelamento');
  if wJustif = '' then
    wJustif := 'Cliente cancelou a compra';
  wCmdo    := pExec;                                     // Executável
  wParm    := '/CANCELARNF '+ wChave + ' "' + wJustif + '" -as ' + wArqSai + ' ' + wArqXML;
  if MessageDlg('Cancelamento de NFCe' + #13#13 +
                'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                '  Valor: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,15,2) + #13 +
                '  NFCe: ' + uDM.PedidosNrNFCe.AsString,
                 mtConfirmation,[mbYes,mbNo],0,mbNo) = mrYes
  then begin
    DeleteFile(wArqSai);
    ShellExecute(0,'open',pChar(wCmdo),pChar(wParm),'',1);
    RetornoACNFe(wArqSai,30,wRetorno);
    ShowMessage('NFCe '+ wRetorno);
  end;
  Result := True;

end;

Procedure CancelaPedido;
begin
  uDM.Pedidos.Edit;
  uDM.PedidosSitPagto.AsInteger := 9;
  uDM.Pedidos.Post;
  SHowMessage('Efetuar cancelamento no caixa');

end;

procedure TFuConsPedidos.btImprimirEtiquetasClick(Sender: TObject);
begin
  if MessageDlg('Emissão de etiquetas' + #13 +
                'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                'Confirme a emissão das etiquetas do pedido',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
    EmiteEtiquetas(uDM.PedidosNumero.AsInteger, 0);   // Imprime TODAS as etiquetas do pedido

end;


procedure TFuConsPedidos.btCancelarClick(Sender: TObject);
var nPgts: Integer;
    wMsg: String;
    lCancCartao: Boolean;
begin
  if uDM.Pedidos.RecordCount = 0 then Exit;
  if uDM.PedidosSitPagto.AsInteger = 9 then
  begin
    MessageDlg('Pedido anteriormente cancelado',mtInformation,[mbOk],0);
    Exit;
  end;
  if uDM.PedidosSitPagto.AsInteger = 0 then
  begin
    if MessageDlg('Pedido pendente' + #13#13 + 'Excluir o pedido ?',
                  mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
    then begin
      uDM.Peddetpag.Refresh;
      uDM.PedDetpag.First;
      while uDM.PedDetpag.RecordCount > 0 do
        uDM.Peddetpag.Delete;
      uDM.PedItens.Refresh;
      uDM.PedItens.First;
      while uDM.PedItens.RecordCount > 0 do
        uDM.PedItens.Delete;
      uDM.Pedidos.Delete;
    end;
    Exit;
  end;
  //
  uDM.PedDetpag.Filtered := True;       // Somente regs '03' e '04'  e  Sit = 0
  uDM.PedDetpag.Refresh;
  nPgts := uDM.PedDetpag.RecordCount;
  wMsg  := '- Transação de cartão (';
  if nPgts > 0 then
    wMsg := wMsg + IntToStr(nPgts) + ' ocorrencias)' + #13
  else
    wMsg := wMsg + 'não houve transação com cartão)' + #13;
  if uDM.PedidosNrNFCe.AsInteger > 0 then
    wMsg := wMsg + '- Nota fiscal (NFCe)' + #13
  else
    wMsg := wMsg + #13;
  wMsg := wMsg + '- Pedido';
  if MessageDlg('Confirme o cancelamento do pedido' + #13 +
                'Nro: ' + uDM.PedidosNumero.AsString +
                '  Valor: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNUmber,15,2) + #13#13 +
                wMsg,
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
  begin
    if (uDM.PedidosMeioPagto.AsInteger = 1) or (uDM.PedidosMeioPagto.AsInteger = 2)
    then lCancCartao := CancelaCartao(wExec)
    else lCancCartao := True;
    if lCancCartao then
       if CancelaNFCe(wExec) then
          CancelaPedido;
  end;
  uDM.PedDetpag.Filtered := False;

end;

procedure TFuConsPedidos.btEmitirNFCeClick(Sender: TObject);
var wParam: String;
    wIniName,wAbrir,wImprimir,wPDF,wTrans: String;
    wIniFile: TIniFile;
begin
  if uDM.Pedidos.RecordCount = 0 then Exit;
  if wExec = '' then
  begin
    MessageDlg(wExec + ' não encontrado, processo abortado',mtInformation,[mbOk],0);
    Exit;
  end;
  //

  if (uDM.PedidosNrNFCe.AsInteger > 0) and (uDM.PedidosIdArqXML.AsString <> '')
  then begin
    wArqXML := uDM.PedidosIdArqXML.AsString;
    wArqSai := ExtractFilePath(Application.ExeName) + 'wNFe.Txt';
    DeleteFile(wArqSai);
    wIniName  := ChangeFileExt(wExec,'.Ini');
    wIniFile  := TIniFile.Create(wIniName);
    wAbrir    := wIniFile.ReadString('NFC','AbrirDANFE','');
    wImprimir := wIniFile.ReadString('NFC','ImprimirAuto','');
    wPDF      := wIniFile.ReadString('NFC','PathSalvarPDF','');
    wTrans    := wIniFile.ReadString('NFC','PathSalvar','');
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
  if FuConsPedidos.Width < 700 then FuConsPedidos.Width := 700;
  if FuConsPedidos.Height < 480 then FuConsPedidos.Height := 480;
  GridPed := DefineGrid(GridPed,[0.08,0.15,0.06,0.10,0.33,0.05,0.06,0.08,0.04,0.08],4,0);

end;

procedure TFuConsPedidos.FormShow(Sender: TObject);
begin
  uDM.Pedidos.Last;
  if ObtemParametro('CancelarPedidos') = 'S' then
    btCancelar.Visible := True
  else
    btCancelar.Visible := False;

end;

end.
