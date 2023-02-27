unit SFEuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, System.UITypes, RLPrinters,
  Vcl.Mask;

type
  TFuPrincipalEtq = class(TForm)
    PanTurnos: TPanel;
    Label1: TLabel;
    cbTurnos: TComboBox;
    btProsseguir: TBitBtn;
    btSair: TBitBtn;
    btCarrega: TBitBtn;
    PanPedidos: TPanel;
    PanEtiquetas: TPanel;
    GridPeds: TDBGrid;
    PanRodapePed: TPanel;
    LabNrPeds: TLabel;
    NavPeds: TDBNavigator;
    PanRodapeItens: TPanel;
    LabNrEtqs: TLabel;
    NavItens: TDBNavigator;
    GridItens: TDBGrid;
    dbNroPedido: TDBEdit;
    btNoEtiq: TBitBtn;
    btPreview: TBitBtn;
    btPrint: TBitBtn;
    PanCliente: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    Panel1: TPanel;
    Label2: TLabel;
    cbSelPedidos: TComboBox;
    Label4: TLabel;
    cbSelItens: TComboBox;
    btPrintAll: TBitBtn;
    btSair2: TBitBtn;
    btHelpArgox: TBitBtn;
    btHelpGeral: TBitBtn;
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
    procedure GridPedsDblClick(Sender: TObject);
    procedure dbNroPedidoChange(Sender: TObject);
    procedure cbTurnosExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbSelPedidosClick(Sender: TObject);
    procedure cbSelItensClick(Sender: TObject);
    procedure btPrintAllClick(Sender: TObject);
    procedure btHelpArgoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btHelpGeralMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuPrincipalEtq: TFuPrincipalEtq;
  wPathWork: String;
  xTurno: String;
  imgEtiq: TImage;
  wPrinter,wPorta,wDriver: String;
  nIndex: Integer;
  lDialog: Boolean;
  filAnt: Boolean;
  filTxtAnt: String;

const
  txtNoEtiq: String = 'Não há pedidos à imprimir';
  txtEtiqs: String = 'Pedidos à imprimir: ';

implementation

{$R *.dfm}

uses uGenericas, SFEuPrintFortes, FortesReportCtle, uSysPrinters, uDados, uHelpSpeedFood;

procedure CarregaTurnos;
var lCarrega: Boolean;
    wrkTurno: String;
begin
  with FuPrincipalEtq
  do begin
    cbTurnos.Clear;
    lCarrega := True;
    uDM.RegCaixa.Last;
    while lCarrega do
    begin
      wrkTurno := uDM.RegCaixaTurno.AsString + '  ' +
                  uDM.RegCaixaDtHrInicio.AsString + ' - ' + uDM.RegCaixaDtHrFim.AsString;
      cbTurnos.AddItem(wrkTurno,nil);
      uDM.RegCaixa.Prior;
      if uDM.RegCaixa.Bof or (cbTurnos.Items.Count > 60) then
        lCarrega := False;
    end;
    cbTurnos.ItemIndex := 0;
  end;

end;

Procedure DefineSelecao;
begin
  with FuPrincipalEtq
  do begin
    case cbSelPedidos.ItemIndex of
      0:uDM.Pedidos.Filter := 'Turno=' + xTurno + ' and EtqImpressas = 0';
      1:uDM.Pedidos.Filter := 'Turno=' + xTurno + ' and EtqImpressas <> 0';
      2:uDM.Pedidos.Filter := 'Turno=' + xTurno;
    end;
    uDM.Pedidos.Refresh;
    if uDM.Pedidos.RecordCount = 0 then
       LabNrPeds.Caption := 'Sem pedidos'
    else
       LabNrPeds.Caption := IntToStr(uDM.Pedidos.RecordCount) + ' pedidos';

    if cbSelItens.ItemIndex = 2 then
    begin
      uDM.PedItens.Filtered := False;
      uDM.PedItens.Filter := '';
    end
    else begin
      uDM.PedItens.Filtered := True;
      if cbSelItens.ItemIndex = 0 then
        uDM.PedItens.Filter := 'EtqImpressa = 0'
      else
        uDM.PedItens.Filter := 'EtqImpressa <> 0';
    end;
    uDM.PedItens.Refresh;
    if uDM.PedItens.RecordCount = 0 then
      LabNrEtqs.Caption := 'Sem ítens'
    else
      LabNrEtqs.Caption := IntToStr(uDM.PedItens.RecordCount) + ' ítens';

  end;

end;

procedure TFuPrincipalEtq.btPreviewClick(Sender: TObject);
var nKey1,nKey2: Integer;
begin
  if uDM.PedItens.RecordCount = 0 then Exit;
  nKey1 := uDM.PedItensNumero.AsInteger;
  nKey2 := uDM.PedItensNrLcto.AsInteger;
  FSFEuPrintFortes := TFSFEuPrintFortes.Create(nil);
  DefinePrinterEtiqueta;
  //
  if uDM.PedItensTpProd.AsInteger = 1 then
    FSFEuPrintFortes.RLEtiqLanche.Preview       // Visualiza etiqueta de lanche
  else begin
    filAnt := uDM.PedItens.Filtered;
    filTxtAnt := uDM.pedItens.Filter;
    uDM.PedItens.Filtered := True;
    uDM.PedItens.Filter := 'TpProd=3';
    uDM.PedItens.Refresh;
    FSFEuPrintFortes.RLEtiqBebida.Preview;      // Visualiza etiqueta com TODAS as bebidas
    uDM.PedItens.Filtered := filAnt;
    uDM.PedItens.Filter := filTxtAnt;
    uDM.PedItens.Refresh
  end;
  FSFEuPrintFortes.Free;
  uDM.PedItens.FindKey([nKey1,nKey2]);

end;


procedure TFuPrincipalEtq.btCarregaClick(Sender: TObject);
begin
  CarregaTurnos;
  btProsseguirClick(nil);
  btProsseguir.SetFocus;

end;

procedure TFuPrincipalEtq.btPrintAllClick(Sender: TObject);
var filAnt: Boolean;
    filTxtAnt: String;
    lPreview: Boolean;
begin
  FSFEuPrintFortes := TFSFEuPrintFortes.Create(nil);
  DefinePrinterEtiqueta;
  if AnsiUpperCase(ObtemParametro('EtiquetaPreview')) = 'S' then
    lPreview := True
  else
    lPreview := False;
  //
  filAnt := uDM.PedItens.Filtered;
  filTxtAnt := uDM.PedItens.Filter;
  uDM.PedItens.Filtered := True;
  uDM.PedItens.Filter := 'TpProd=1';
  uDM.PedItens.Refresh;
  uDM.PedItens.First;
  SetRecordRangeLanche(1);      // rrAllRecords;
  if lPreview then
    FSFEuPrintFortes.RLEtiqLanche.Preview
  else
    FSFEuPrintFortes.RLEtiqLanche.Print;
  SetRecordRangeLanche(0);      // rrCurrentOnly;
  uDM.PedItens.Filter := 'TpProd=3';
  uDM.PedItens.Refresh;
  if uDM.PedItens.RecordCount > 0 then
  begin
    // Imprime TODAS as bebidas em uma etiqueta
    uDM.PedItens.First;
    if lPreview then
      FSFEuPrintFortes.RLEtiqBebida.Preview
    else
      FSFEuPrintFortes.RLEtiqBebida.Print;
  end;
  FSFEuPrintFortes.Free;
  //
  uDM.PedItens.Filtered := False;
  uDM.PedItens.Refresh;
  uDM.PedItens.First;
  while not uDM.PedItens.Eof do
  begin
    uDM.PedItens.Edit;
    uDM.PedItensEtqImpressa.AsInteger := 1;
    uDM.PedItens.Post;
    uDM.PedItens.Next;
  end;
  uDM.PedItens.Filtered := filAnt;
  uDM.PedItens.Filter := filTxtAnt;
  uDM.PedItens.Refresh;
  uDM.Pedidos.Edit;
  uDM.PedidosEtqImpressas.AsInteger := 1;
  uDM.Pedidos.Post;
  //
  uDM.Pedidos.Refresh;
  if uDM.Pedidos.RecordCount = 0 then
    LabNrPeds.Caption := 'Sem pedidos'
  else
    LabNrPeds.Caption := IntToStr(uDM.Pedidos.RecordCount) + ' pedidos';

end;

procedure TFuPrincipalEtq.btPrintClick(Sender: TObject);
var nKey1,nKey2: Integer;
    filTxtAnt: String;
    filAnt: Boolean;
begin
  if uDM.PedItens.RecordCount = 0 then Exit;
  nKey1 := uDM.PedItensNumero.AsInteger;
  nKey2 := uDM.PedItensNrLcto.AsInteger;
  FSFEuPrintFortes := TFSFEuPrintFortes.Create(nil);
  DefinePrinterEtiqueta;
  if uDM.PedItensTpProd.AsInteger = 1 then
  begin
    if ObtemParametro('EtiquetaPreview') = 'S' then
      FSFEuPrintFortes.RLEtiqLanche.Preview
    else FSFEuPrintFortes.RLEtiqLanche.Print;
    if uDM.PedItens.FindKey([nKey1,nKey2]) then
    begin
      uDM.PedItens.Edit;
      uDM.PedItensEtqImpressa.AsInteger := 1;
      uDM.PedItens.Post;
    end;
  end
  else begin
    filAnt := uDM.PedItens.Filtered;
    filTxtAnt := uDM.PedItens.Filter;
    uDM.PedItens.Filter := 'TpProd=3';
    uDM.PedItens.Filtered := True;
    uDM.PedItens.Refresh;
    if ObtemParametro('EtiquetaPreview') = 'S' then
      FSFEuPrintFortes.RLEtiqBebida.Preview
    else FSFEuPrintFortes.RLEtiqBebida.Print;       // Imprime TODAS as bebidas em uma etiqueta
    uDM.PedItens.First;
    while not uDM.PedItens.Eof do
    begin
      uDM.PedItens.Edit;
      uDM.PedItensEtqImpressa.AsInteger := 1;  // Assinala impressao
      uDM.PedItens.Post;
      uDM.PedItens.Next;
    end;
    uDM.PedItens.Filtered := filAnt;
    uDM.PedItens.Filter := filTxtAnt;
    uDM.PedItens.Refresh
  end;
  FSFEuPrintFortes.Free;
  uDM.PedItens.Refresh;

end;

procedure TFuPrincipalEtq.btHelpArgoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
     AjudaSpeedFood(2)
  else
     AjudaSpeedFood(2,True);

end;

procedure TFuPrincipalEtq.btHelpGeralMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
     AjudaSpeedFood(1)
  else
     AjudaSpeedFood(1,True);

end;

procedure TFuPrincipalEtq.btNoEtiqClick(Sender: TObject);
begin
 if MessageDlg('Excluir da relação de etiquetas à imprimir ?',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
  begin
    uDM.PedItens.Edit;
    uDM.PedItensEtqImpressa.AsInteger := 9;
    uDM.PedItens.Post;
  end;
  uDM.PedItens.Refresh;

end;

procedure TFuPrincipalEtq.btProsseguirClick(Sender: TObject);
var nPos: Integer;
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
  cbSelPedidos.ItemIndex := 0;    // À imprimir
  uDM.Pedidos.Filtered := True;
  uDM.Pedidos.Filter := 'Turno=' + xTurno + ' and EtqImpressas = 0';
  uDM.Pedidos.Refresh;
  if uDM.Pedidos.RecordCount = 0 then
    LabNrPeds.Caption := 'Sem pedidos'
  else
    LabNrPeds.Caption := IntToStr(uDM.Pedidos.RecordCount) + ' pedidos';
  //
  cbSelItens.ItemIndex := 0;      // À imprimir
  DefineSelecao;
  PanPedidos.Visible := True;
  PanEtiquetas.Visible := True;
  FormResize(nil);

end;
procedure TFuPrincipalEtq.btSairClick(Sender: TObject);
begin
  FuPrincipalEtq.Close;

end;

procedure TFuPrincipalEtq.cbTurnosEnter(Sender: TObject);
begin
  PanPedidos.Visible := False;
  PanEtiquetas.Visible := False;

end;

procedure TFuPrincipalEtq.cbTurnosExit(Sender: TObject);
begin
  btProsseguirClick(nil);

end;

procedure TFuPrincipalEtq.cbSelItensClick(Sender: TObject);
begin
  DefineSelecao;

{
  if cbSelItens.ItemIndex = 2 then
  begin
    uDM.PedItens.Filtered := False;
    uDM.PedItens.Filter := '';
  end
  else begin
    uDM.PedItens.Filtered := True;
    if cbSelItens.ItemIndex = 0 then
      uDM.PedItens.Filter := 'EtqImpressa = 0'
    else
      uDM.PedItens.Filter := 'EtqImpressa <> 0';
  end;
  uDM.PedItens.Refresh;
  if uDM.PedItens.RecordCount = 0 then
    LabNrEtqs.Caption := 'Sem ítens'
  else
    LabNrEtqs.Caption := IntToStr(uDM.PedItens.RecordCount) + ' ítens';
}

end;

procedure TFuPrincipalEtq.cbSelPedidosClick(Sender: TObject);
begin
  DefineSelecao;

end;

procedure TFuPrincipalEtq.dbNroPedidoChange(Sender: TObject);
begin
  if not uDM.PedItens.Active then Exit;
  DefineSelecao;

end;

procedure TFuPrincipalEtq.FormActivate(Sender: TObject);
begin
  if uDM = Nil then
  begin
    uDM := TuDM.Create(nil);
    uDM.FDC.Connected     := True;
    uDM.SisPessoa.Active  := True;
    uDM.Itens.Active      := True;
    uDM.RegCaixa.Active   := True;
    uDM.Pedidos.Active    := True;
    uDM.PedItens.Active   := True;
    FFRCtle.RLPreviewSetup1.ZoomFactor := StrToIntDef(ObtemParametro('FortesZoomFactor'),100);
    CarregaTurnos;
    cbTurnos.SetFocus;
  end;

end;

procedure TFuPrincipalEtq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  uDM.PedItens.Active   := False;
  uDM.Pedidos.Active    := False;
  uDM.RegCaixa.Active   := False;
  uDM.Itens.Active      := False;
  uDM.SisPessoa.Active  := False;
  uDM.Parametros.Active := False;
  Application.Terminate;

end;

procedure TFuPrincipalEtq.FormCreate(Sender: TObject);
begin
  wPathWork := ExtractFilePath(Application.ExeName);
  btPreview.Caption := 'Visualizar etiqueta';
  btPrint.Caption := 'Imprimir etiqueta';
  btNoEtiq.Caption := 'Excluir etiqueta';
  btPrintAll.Caption := 'Imprimir TODAS as etiquetas do pedido';
  FuPrincipalEtq.FormResize(nil);

end;

procedure TFuPrincipalEtq.FormResize(Sender: TObject);
begin
  FuPrincipalEtq.Width := (Screen.Width div 5) * 4;
  FuPrincipalEtq.Height := Screen.Height - 100;
  FuPrincipalEtq.Left := (Screen.Width - FuPrincipalEtq.Width) div 2;
  FuPrincipalEtq.Top := 40;
  //
  PanPedidos.Width := 297;
  GridPeds.Columns[0].Width := 76;
  GridPeds.Columns[1].Width := 50;
  GridPeds.Columns[2].Width := 46;
  GridPeds.Columns[3].Width := 84;
  //
  GridItens := DefineGrid(GridItens,[0.08, 0.08, 0.08, 0.33, 0.08],3,0);

  btPreview.Width := (PanRodapeItens.Width - (btPreview.Left + 16)) div 3;
  btPrint.Left := btPreview.Left + btPreview.Width + 3;
  btPrint.Width := btPreview.Width;
  btNoEtiq.Left := btPrint.Left + btPrint.Width + 3;
  btNoEtiq.Width := btPreview.Width;
  btPrintAll.Left := btPreview.Left;
  btPrintAll.Width := btPreview.Width * 2 + 3;
  btSair2.Left := btNoEtiq.Left;
  btSair2.Width := btNoEtiq.Width;

end;

procedure TFuPrincipalEtq.GridPedsDblClick(Sender: TObject);
begin
  btPrintClick(nil);

end;

end.
