unit SFEuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, System.UITypes, RLPrinters,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    btNoEtiq: TBitBtn;
    btPreview: TBitBtn;
    btPrint: TBitBtn;
    PanCliente: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    Panel1: TPanel;
    Label2: TLabel;
    cbSelPedidos: TComboBox;
    btPrintAll: TBitBtn;
    btSair2: TBitBtn;
    btHelpArgox: TBitBtn;
    btHelpGeral: TBitBtn;
    Timer1: TTimer;
    btReload: TBitBtn;
    PanReload: TPanel;
    LabTmp: TLabel;
    Label4: TLabel;
    dbNroPedido: TDBEdit;
    LabNrPedido: TLabel;
    FDQPedidos: TFDQuery;
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
    procedure btPrintAllClick(Sender: TObject);
    procedure btHelpArgoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btHelpGeralMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure btReloadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuPrincipalEtq: TFuPrincipalEtq;
  wPathWork: String;
  imgEtiq: TImage;
  wPrinter,wPorta,wDriver: String;
  nIndex: Integer;
  lDialog: Boolean;
  filAnt: Boolean;
  filTxtAnt: String;
  wrkTurno: Integer;
  sysSelecao: String;

const
  txtNoEtiq: String = 'Não há pedidos à imprimir';
  txtEtiqs: String = 'Pedidos à imprimir: ';

implementation

{$R *.dfm}

uses uGenericas, SFEuPrintFortes, FortesReportCtle, uSysPrinters, uDados, uHelpSpeedFood;

procedure CarregaTurnos;
var wrkTurno: String;
    nMax: Integer;
begin
  with FuPrincipalEtq
  do begin
    nMax := StrToInt(ObtemParametro(' MaximoTurnos','5'));
    cbTurnos.Clear;
    uDM.Turnos.Last;
    while (cbTurnos.Items.Count <= nMax) and (not uDM.Turnos.Bof) do
    begin
      wrkTurno := uDM.TurnosNrTurno.AsString + '  ' + uDM.TurnosZC_Datas.AsString;
      cbTurnos.AddItem(wrkTurno,nil);
      uDM.Turnos.Prior;
    end;
    cbTurnos.Items.Add('0  Todos os turnos');
    cbTurnos.ItemIndex := 0;
  end;

end;

Procedure ReloadPedidos(pmtTurno:Integer=0; pmtEtqImpress:Integer=2);
var xCampos, xSelecao: String;
    nRegs: Integer;
begin
  {
  uDM.Pedidos.Refresh;
  if uDM.Pedidos.RecordCount = 0 then
     FuPrincipalEtq.LabNrPeds.Caption := 'Sem pedidos'
  else
     FuPrincipalEtq.LabNrPeds.Caption := IntToStr(uDM.Pedidos.RecordCount) + ' pedidos';
  if uDM.PedItens.RecordCount = 0 then
     FuPrincipalEtq.LabNrEtqs.Caption := 'Sem ítens'
  else
     FuPrincipalEtq.LabNrEtqs.Caption := IntToStr(uDM.PedItens.RecordCount) + ' ítens';
  FuPrincipalEtq.PanReload.Visible := False;
  }

  with FuPrincipalEtq do
  begin
    Timer1.Enabled := False;
    PanReload.Visible := True;
    Application.ProcessMessages;
    Sleep(500);

    xCampos := 'Numero, EtqImpressas, NomeCLiente, Turno, Placa, SitPagto, LctLanches, ' +
               'LctBebidas, LctCrepes, LctFrituras, LctGelados ';
    if pmtTurno = 0 then
      xSelecao := 'Turno>0'
    else
      xSelecao := 'Turno=' + IntToStr(pmtTurno);
    case pmtEtqImpress of
      0:xSelecao := xSelecao + ' and EtqImpressas=0';
      1:xSelecao := xSelecao + ' and EtqImpressas>0';
    end;

    FDQPedidos.SQL.Text := 'Select ' + xCampos + 'from com_pedido ' +
                           'where ' + xSelecao;
    FDQPedidos.Open;
    FDQPedidos.Last;
    FDQPedidos.First;         // .Last;
    nRegs := FDQPedidos.RecordCount;
    if nRegs > 0 then
      LabNrPeds.Caption := IntToStr(nRegs) + ' pedidos'
    else
      LabNrPeds.Caption := 'Não há pedidos selecionados';
    sleep(500);
    Timer1.Enabled := True;
  end;

end;


Procedure DefineSelecao;
begin
  with FuPrincipalEtq
  do begin
    Timer1.Enabled := False;
    uDM.turnoIni := wrkTurno;
    uDM.turnoFin := wrkTurno;
    uDM.etqImpress := cbSelPedidos.ItemIndex;

    uDM.Pedidos.Filtered := True;
    uDM.PedItens.Filtered := False;

    ReloadPedidos;

    Timer1.Enabled := True;

{
    uDM.Pedidos.Refresh;
    if uDM.Pedidos.RecordCount = 0 then
       LabNrPeds.Caption := 'Sem pedidos'
    else
       LabNrPeds.Caption := IntToStr(uDM.Pedidos.RecordCount) + ' pedidos';
    if uDM.PedItens.RecordCount = 0 then
      LabNrEtqs.Caption := 'Sem ítens'
    else
      LabNrEtqs.Caption := IntToStr(uDM.PedItens.RecordCount) + ' ítens';
}

  end;

end;


procedure TFuPrincipalEtq.btPreviewClick(Sender: TObject);
var nKey1,nKey2: Integer;
begin
  if uDM.PedItens.RecordCount = 0 then Exit;
  Timer1.Enabled := False;
  nKey1 := uDM.PedItensNumero.AsInteger;
  nKey2 := uDM.PedItensNrLcto.AsInteger;
  EmiteEtiquetas(nKey1,nKey2,True);
  uDM.PedItens.FindKey([nKey1,nKey2]);
  Timer1.Enabled := True;

end;


procedure TFuPrincipalEtq.btCarregaClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  CarregaTurnos;
  btProsseguirClick(nil);

end;

procedure TFuPrincipalEtq.btPrintAllClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  EmiteEtiquetas(uDM.PedidosNumero.AsInteger,0,True);
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
  uDM.PedItens.Refresh;
  uDM.Pedidos.Edit;
  uDM.PedidosEtqImpressas.AsInteger := 1;
  uDM.Pedidos.Post;
  //
  ReloadPedidos;
  Timer1.Enabled := True;

end;

procedure TFuPrincipalEtq.btPrintClick(Sender: TObject);
var nKey1,nKey2: Integer;
    nImpressas: Integer;
begin
  if uDM.PedItens.RecordCount = 0 then Exit;
  Timer1.Enabled := False;
  nKey1 := uDM.PedItensNumero.AsInteger;
  nKey2 := uDM.PedItensNrLcto.AsInteger;
  EmiteEtiquetas(nKey1,nKey2,False);
  uDM.PedItens.Refresh;
  if uDM.PedItens.FindKey([nKey1,nKey2]) then
  begin
    uDM.PedItens.Edit;
    uDM.PedItensEtqImpressa.AsInteger := 1;
    uDM.PedItens.Post;
  end;
  nImpressas := 0;
  uDM.PedItens.First;
  while not uDM.PedItens.Eof do
  begin
    if uDM.PedItensEtqImpressa.AsInteger = 1 then
       nImpressas := nImpressas + 1;
    uDM.PedItens.Next;
  end;
  if nImpressas = uDM.PedItens.RecordCount then
  begin
    uDM.Pedidos.Edit;
    uDM.PedidosEtqImpressas.AsInteger := 1;
    uDM.Pedidos.Post;
  end;
  uDM.PedItens.FindKey([nKey1,nKey2]);
  uDM.PedItens.Refresh;
  ReloadPedidos;
  Timer1.Enabled := True;

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
  Timer1.Enabled := False;
  if MessageDlg('Excluir da relação de etiquetas à imprimir ?',
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
  begin
    uDM.PedItens.Edit;
    uDM.PedItensEtqImpressa.AsInteger := 9;
    uDM.PedItens.Post;
  end;
  uDM.PedItens.Refresh;
  Timer1.Enabled := True;

end;

procedure TFuPrincipalEtq.btProsseguirClick(Sender: TObject);
var nPos: Integer;
begin
  nPos := Pos(' ',cbTurnos.Text);
  wrkTurno := StrToIntDef(Copy(cbTurnos.Text,1,nPos-1), -1);
  if wrkTurno < 0 then
  begin
    MessageDlg('Erro na informação do turno, reinforme',mtError,[mbOk],0);
    cbTurnos.SetFocus;
    Exit;
  end;
  //
  cbSelPedidos.ItemIndex := 0;
  cbSelPedidosClick(nil);
  PanPedidos.Visible := True;
  PanEtiquetas.Visible := True;
  FormResize(nil);
  Timer1.Enabled := True;
  btReload.SetFocus;

end;
procedure TFuPrincipalEtq.btReloadClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  ReloadPedidos(wrkTurno, cbSelPedidos.ItemIndex);
  Timer1.Enabled := True;

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

procedure TFuPrincipalEtq.cbSelPedidosClick(Sender: TObject);
begin
  DefineSelecao;

end;

procedure TFuPrincipalEtq.dbNroPedidoChange(Sender: TObject);
begin
  LabNrPedido.Visible := False;
  Application.ProcessMessages;
  if not uDM.PedItens.Active then Exit;
  LabNrPedido.Caption := 'Pedido: ' + uDM.PedidosNumero.AsString;
  LabNrPedido.Visible := True;
  Application.ProcessMessages;
  DefineSelecao;

end;

procedure TFuPrincipalEtq.FormActivate(Sender: TObject);
var nTempo: Integer;
begin
  if uDM = Nil then
  begin
    uDM := TuDM.Create(nil);
    uDM.FDC.Connected     := True;
    uDM.SisPessoa.Active  := True;
    uDM.Itens.Active      := True;
    uDM.Turnos.Active     := True;
    uDM.Pedidos.Active    := True;
    uDM.PedItens.Active   := True;
    uDM.Parametros.Active := True;
    uDM.sitPagto          := 1;     // Somente pedidos 'pagos'
    nTempo := StrToIntDef(ObtemParametro('EtiquetaTimer'),10);
    if nTempo = 0 then nTempo := 11;
    LabTmp.Caption := IntToStr(nTempo);
    Timer1.Interval := nTempo * 1000;
    FFRCtle.RLPreviewSetup1.ZoomFactor := StrToIntDef(ObtemParametro('FortesZoomFactor'),100);

    FDQPedidos.Connection := uDM.FDC;
    FDQPedidos.Close;

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
  //Application.Terminate;

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

procedure TFuPrincipalEtq.Timer1Timer(Sender: TObject);
begin
  ReloadPedidos;

end;

end.
