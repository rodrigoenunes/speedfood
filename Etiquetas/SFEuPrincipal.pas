unit SFEuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, System.UITypes, RLPrinters;

type
  TFuPrincipalEtq = class(TForm)
    PanTurnos: TPanel;
    Label1: TLabel;
    cbTurnos: TComboBox;
    btProsseguir: TBitBtn;
    btSair: TBitBtn;
    btCarrega: TBitBtn;
    GridEtqs: TDBGrid;
    PanRodape: TPanel;
    NavEtqs: TDBNavigator;
    LabNrEtqs: TLabel;
    btPrint: TBitBtn;
    btNoEtiq: TBitBtn;
    btSair2: TBitBtn;
    btPreview: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btCarregaClick(Sender: TObject);
    procedure btProsseguirClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cbTurnosEnter(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btNoEtiqClick(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure btPreviewClick(Sender: TObject);
    procedure GridEtqsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuPrincipalEtq: TFuPrincipalEtq;
  wPathWork: String;
  imgEtiq: TImage;

const
  txtNoEtiq: String = 'Não há etiquetas à imprimir';
  txtEtiqs: String = 'Etiquetas à imprimir: ';

implementation

{$R *.dfm}

uses uDados, uGenericas, SFEuPrintFortes, FortesReportCtle, uSysPrinters;

procedure CarregaTurnos;
var xTurno: String;
begin
  with FuPrincipalEtq
  do begin
    cbTurnos.Clear;
    uDM.RegCaixa.Last;
    while not uDM.RegCaixa.Bof do
    begin
      xTurno := uDM.RegCaixaTurno.AsString + '  ' +
                uDM.RegCaixaDtHrInicio.AsString + ' - ' + uDM.RegCaixaDtHrFim.AsString;
      cbTurnos.AddItem(xTurno,nil);
      uDM.RegCaixa.Prior;
    end;
    cbTurnos.ItemIndex := 0;
  end;

end;


procedure TFuPrincipalEtq.btPreviewClick(Sender: TObject);
var nKey1,nKey2: Integer;
begin
  if uDM.EtqItens.RecordCount = 0 then Exit;
  nKey1 := uDM.EtqItensNumero.AsInteger;
  nKey2 := uDM.EtqItensNrLcto.AsInteger;
  FFRCtle.RLPreviewSetup1.CustomActionText := '';
  FSFEuPrintFortes := TFSFEuPrintFortes.Create(nil);
  FSFEuPrintFortes.RLEtiqueta.Preview;
  FSFEuPrintFortes.Free;
  uDM.EtqItens.FindKey([nKey1,nKey2]);

end;


procedure TFuPrincipalEtq.btCarregaClick(Sender: TObject);
begin
  CarregaTurnos;
  btProsseguirClick(nil);
  btProsseguir.SetFocus;

end;

procedure TFuPrincipalEtq.btPrintClick(Sender: TObject);
var nKey1,nKey2: Integer;
    wPrinter,wPorta,wDriver: String;
    nIndex: Integer;
    lDialog: Boolean;
begin
  if uDM.EtqItens.RecordCount = 0 then Exit;
  nKey1 := uDM.EtqItensNumero.AsInteger;
  nKey2 := uDM.EtqItensNrLcto.AsInteger;
  lDialog  := False;
  wPrinter := ObtemParametro('PrinterEtq');          // 'HP Photosmart';
  //wPrinter := uBiblioteca.getValorParametro('PrinterEtq');
  if not DefineImpressora(True,wPrinter,wPorta,wDriver,nIndex) then
  begin
    lDialog := True;
    if not RetornaImpressoraPadrao(wPrinter,wPorta,wDriver,nIndex) then Exit;
  end;
  RLPrinters.RLPrinter.PrinterName := wPrinter;
  RLPrinters.RLPrinter.Copies := 1;
  FFRCtle.RLPreviewSetup1.CustomActionText := '';
  FSFEuPrintFortes := TFSFEuPrintFortes.Create(nil);
  FSFEuPrintFortes.RLEtiqueta.PrintDialog := lDialog;
  FSFEuPrintFortes.RLEtiqueta.Print;
  FSFEuPrintFortes.Free;
  if uDM.EtqItens.FindKey([nKey1,nKey2]) then
  begin
    uDM.EtqItens.Edit;
    uDM.EtqItensEtqImpressa.AsInteger := uDM.EtqItensEtqImpressa.AsInteger + 1;
    uDM.EtqItens.Post;
  end;
  uDM.EtqItens.Refresh;
  if uDM.EtqItens.RecordCount = 0 then
    LabNrEtqs.Caption := txtNoEtiq
  else
    LabNrEtqs.Caption := txtEtiqs + IntToStr(uDM.EtqItens.RecordCount);

end;

procedure TFuPrincipalEtq.btNoEtiqClick(Sender: TObject);
begin
 if MessageDlg('Excluir da relação de etiquetas à imprimir ?',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
  begin
    uDM.etqItens.Edit;
    uDM.EtqItensEtqImpressa.AsInteger := 9;
    uDM.EtqItens.Post;
    uDM.EtqItens.Refresh;
    if uDM.EtqItens.RecordCount = 0 then
      LabNrEtqs.Caption := txtNoEtiq
    else
      LabNrEtqs.Caption := txtEtiqs + IntToStr(uDM.EtqItens.RecordCount);
  end;

end;

procedure TFuPrincipalEtq.btProsseguirClick(Sender: TObject);
var nPos: Integer;
    xTurno: String;
begin
  nPos := Pos(' ',cbTurnos.Text);
  xTurno := Copy(cbTurnos.Text,1,nPos-1);
  if StrToIntDef(xTurno,-1) < 0 then
  begin
    MessageDlg('Erro na informação do turno, reinforme',mtError,[mbOk],0);
    cbTurnos.SetFocus;
    Exit;
  end;
  //
  uDM.EtqItens.Filtered := True;
  uDM.EtqItens.Filter   := 'Turno=' + xTurno + ' and TpProd=1 and EtqImpressa=0';
  uDM.EtqItens.Active   := True;
  if uDM.EtqItens.RecordCount = 0 then
    LabNrEtqs.Caption := txtNoEtiq
  else
    LabNrEtqs.Caption := txtEtiqs + IntToStr(uDM.EtqItens.RecordCount);
  GridEtqs.Visible  := True;
  NavEtqs.Visible   := True;
  LabNrEtqs.Visible := True;
  btPreview.Visible := True;
  btPrint.Visible   := True;
  btNoEtiq.Visible  := True;

  FormResize(nil);

end;
procedure TFuPrincipalEtq.btSairClick(Sender: TObject);
begin
  FuPrincipalEtq.Close;

end;

procedure TFuPrincipalEtq.cbTurnosEnter(Sender: TObject);
begin
  GridEtqs.Visible  := False;
  NavEtqs.Visible   := False;
  LabNrEtqs.Visible := False;
  btPreview.Visible := False;
  btPrint.Visible    := False;
  btNoEtiq.Visible  := False;

end;

procedure TFuPrincipalEtq.FormActivate(Sender: TObject);
begin
  if uDM = Nil then
  begin
    uDM := TuDM.Create(nil);
    uDM.FDC.Connected    := True;
    uDM.SisPessoa.Active := True;
    uDM.Itens.Active     := True;
    uDM.RegCaixa.Active  := True;
    uDM.Pedidos.Active   := True;
    uDM.pathWork         := wPathWork;
    CarregaTurnos;
    btProsseguir.SetFocus;
    btProsseguirClick(nil);
  end;

end;

procedure TFuPrincipalEtq.FormCreate(Sender: TObject);
begin
  wPathWork := ExtractFilePath(Application.ExeName);

end;

procedure TFuPrincipalEtq.FormResize(Sender: TObject);
begin
  GridEtqs := DefineGrid(GridEtqs,[0.08, 0.04, 0.33],2,0);

end;

procedure TFuPrincipalEtq.GridEtqsDblClick(Sender: TObject);
begin
  btPrintClick(nil);

end;

end.
