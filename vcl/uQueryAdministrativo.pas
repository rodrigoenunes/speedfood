unit uQueryAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,  FireDAC.Stan.ExprFuncs,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, System.UITypes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
  Procedure Administrativo;

type
  TFuQueryAdministrativo = class(TForm)
    gbTurnos: TGroupBox;
    cbTurnoIni: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbTurnoFin: TComboBox;
    btProcessar: TBitBtn;
    btSair: TBitBtn;
    PBar1: TProgressBar;
    LabProcess: TLabel;
    PanResultado: TPanel;
    Panel1: TPanel;
    PanValores: TPanel;
    Label3: TLabel;
    edReais: TEdit;
    edQtdReais: TEdit;
    Label4: TLabel;
    edCDeb: TEdit;
    edQtdCDeb: TEdit;
    Label5: TLabel;
    edCCred: TEdit;
    edQtdCCred: TEdit;
    Label6: TLabel;
    edPIX: TEdit;
    edQtdPIX: TEdit;
    Label7: TLabel;
    edOutros: TEdit;
    edQtdOutros: TEdit;
    Label9: TLabel;
    edMisto: TEdit;
    edQtdMisto: TEdit;
    Label8: TLabel;
    edTotal: TEdit;
    edQtdTotal: TEdit;
    LabObsMisto: TLabel;
    Panel2: TPanel;
    Label10: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label11: TLabel;
    Panel5: TPanel;
    NavItens: TDBNavigator;
    GridItens: TDBGrid;
    btNova: TBitBtn;
    btImprimir: TBitBtn;
    btSair2: TBitBtn;
    edVlrNFCe: TEdit;
    edQtdOutrosDoc: TEdit;
    edQtdNFCe: TEdit;
    edVlrOutrosDoc: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edTotVlrDocs: TEdit;
    edTotQtdDocs: TEdit;
    FDQPedidos: TFDQuery;
    FDQItens: TFDQuery;
    DSPedidos: TDataSource;
    FDQPedidosNrNFCe: TIntegerField;
    FDQPedidosMeioPagto: TIntegerField;
    FDQPedidosSitPagto: TSmallintField;
    FDQPedidosNumero: TLongWordField;
    FDQPedidosValor: TBCDField;
    FDQPedidosVlrReais: TBCDField;
    FDQPedidosVlrCDeb: TBCDField;
    FDQPedidosVlrCCred: TBCDField;
    FDQPedidosVlrPIX: TBCDField;
    FDQPedidosVlrOutros: TBCDField;
    FDQItensTpProd: TIntegerField;
    FDQItensCodProd: TIntegerField;
    FDQItensQuant: TIntegerField;
    FDQItensVlrTotal: TBCDField;
    FDQItensNumero: TIntegerField;
    rgCaixas: TRadioGroup;
    procedure btSairClick(Sender: TObject);
    procedure btProcessarClick(Sender: TObject);
    procedure btNovaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuQueryAdministrativo: TFuQueryAdministrativo;
  tIni,tFim: Integer;
  vlrMeioPgto: array[0..6] of Currency;
  qtdMeioPgto: array[0..6] of Integer;
  ttQtd: Integer;
  ttVlr: Currency;
  ttQtdDoc: array[0..2] of Integer;     // NFCe/Outros
  ttVlrDoc: array[0..2] of Currency;    // NFCe/Outros

implementation

{$R *.dfm}

uses uDados, uGenericas, uImpressoes;

Procedure Administrativo;
var xTurno: String;
begin
  //uDM.lDebug := False;
  //if ObtemParametro('DEBUG') = 'S' then uDM.lDebug := True;
  if not CriaResumoVendas then    // Cria DataSet ResumoVendas
  begin
    MessageDlg('Não foi possível criar "ResumoVendas"',mtError,[mbOk],0);
    Exit;
  end;
  //
  FuQueryAdministrativo.Top := 12;
  FuQueryAdministrativo.Height := Screen.Height - 80;
  FuQueryAdministrativo.Left := 80;
  with FuQueryAdministrativo
  do begin
    cbTurnoIni.Clear;
    cbTurnoFin.Clear;
    uDM.Turnos.Last;                        // Era uDM.RegCaixa
    while not uDM.Turnos.Bof do
    begin
      xTurno := uDM.TurnosNrTurno.AsString + '  ' +
                DataHoraString(uDM.TurnosDtHrInicio.AsDateTime, 2, 4) + ' - ' +
                DataHoraString(uDM.TurnosDtHrFim.AsDateTime, 2, 4) + '  ' +
                uDM.TurnosZC_Status.AsString;
      cbTurnoIni.AddItem(xTurno,nil);
      cbTurnoFin.AddItem(xTurno,nil);
      uDM.Turnos.Prior;
    end;
    cbTurnoIni.ItemIndex := 0;
    cbTurnoFin.ItemIndex := 0;
    rgCaixas.ItemIndex := uDM.sysNrCaixa;
    FuQueryAdministrativo.ShowModal;

  end;

end;

Procedure ProcessaPedido(pmtPedido:Integer);
var iDoc: integer;
begin
  with FuQueryAdministrativo
  do begin
    FDQItens.SQL.Text := 'Select * from com_pedidoitem where Numero='+ IntToStr(pmtPedido);
    FDQItens.Open;
    FDQItens.First;
    while not FDQItens.Eof do
    begin
      if uDM.ResVendas.FindKey([FDQItensTpProd.AsInteger,FDQItensCodProd.AsInteger])
      then
        uDM.ResVendas.Edit
      else begin
        uDM.ResVendas.Append;
        uDM.ResVendasTpProd.AsInteger := FDQItensTpProd.AsInteger;
        uDM.ResVendasCodProd.AsInteger := FDQItensCodProd.AsInteger;
        if uDM.Itens.FindKey([FDQItensTpProd.AsInteger,FDQItensCodProd.AsInteger]) then
          uDM.ResVendasDescricao.AsString := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll])
        else
          uDM.ResVendasDescricao.AsString := 'Produto ' + uDM.PedItensTpProd.AsString +  '-' + uDM.PedItensCodProd.AsString;
      end;
      uDM.ResVendasQuant.AsInteger := uDM.ResVendasQuant.AsInteger + FDQItensQuant.AsInteger;
      uDM.ResVendasValor.AsCurrency := uDM.ResVendasValor.AsCurrency + FDQItensVlrTotal.AsCurrency;
      //
      ttQtd := ttQtd + FDQItensQuant.AsInteger;
      ttVlr := ttVlr + FDQItensVlrTotal.AsCurrency;
      //
      uDM.ResVendas.Post;
      FDQItens.Next;
    end;
    //

    if (FDQPedidosMeioPagto.AsInteger >= 0) and (FDQPedidosMeioPagto.AsInteger <= 5) then
    begin
      qtdMeioPgto[FDQPedidosMeioPagto.AsInteger] := qtdMeioPgto[FDQPedidosMeioPagto.AsInteger] + 1;
      vlrMeioPgto[0] := vlrMeioPgto[0] + FDQPedidosVlrReais.AsCurrency;
      vlrMeioPgto[1] := vlrMeioPgto[1] + FDQPedidosVlrCDeb.AsCurrency;
      vlrMeioPgto[2] := vlrMeioPgto[2] + FDQPedidosVlrCCred.AsCurrency;
      vlrMeioPgto[3] := vlrMeioPgto[3] + FDQPedidosVlrPIX.AsCurrency;
      vlrMeioPgto[4] := vlrMeioPgto[4] + FDQPedidosVlrOutros.AsCurrency;
      if FDQPedidosMeioPagto.AsInteger = 5 then
         vlrMeioPgto[5] := vlrMeioPgto[5] + FDQPedidosValor.AsCurrency;
      // Totalização
      qtdMeioPgto[6] := qtdMeioPgto[6] + 1;    // Qtd total de pedidos
      vlrMeioPgto[6] := vlrMeioPgto[6] + FDQPedidosValor.AsCurrency;  // Somatório dos pedidos
      //
      if FDQPedidosNrNFCe.AsInteger > 0 then
         iDoc := 0    // NFCe
      else
         iDoc := 1;   // Outros
      ttQtdDoc[iDoc] := ttQtdDoc[iDoc] + 1;
      ttVlrDoc[iDoc] := ttVlrDoc[iDoc] + FDQPedidosValor.AsCurrency;
      ttQtdDoc[2] := ttQtdDoc[2] + 1;
      ttVlrDoc[2] := ttVlrDoc[2] + FDQPedidosValor.AsCurrency;
    end;
  end;

end;


procedure TFuQueryAdministrativo.btImprimirClick(Sender: TObject);
begin
  ImprimeResumo(cbTurnoIni.Text,cbTurnoFin.Text,vlrMeioPgto,qtdMeioPgto,ttVlrDoc,ttQtdDoc,
                rgCaixas.Items[rgCaixas.ItemIndex]);

end;

procedure TFuQueryAdministrativo.btNovaClick(Sender: TObject);
begin
  gbTurnos.Height := 163;
  gbTurnos.Enabled := True;
  LabProcess.Visible := False;
  PBar1.Visible := False;
  PanResultado.Visible := False;
  cbTurnoIni.SetFocus;

end;

procedure TFuQueryAdministrativo.btProcessarClick(Sender: TObject);
var i,tAux: Integer;
    impAnt,pgtAnt: Integer;
    nRegs: Integer;
    xCaixa,xSitPag: String;
begin
  i := Pos(' ',cbTurnoIni.Text);
  tIni := StrToIntDef(Copy(cbTurnoIni.Text,1,i-1),99999);
  i := Pos(' ',cbTurnoFin.Text);
  tFim := StrToIntDef(Copy(cbTurnoFin.Text,1,i-1),99999);
  if (tIni = 99999) or (tFim = 99999) then
  begin
    MessageDlg('Erro na informação de Turnos, reinforme',mtError,[mbOk],0);
    cbTurnoIni.SetFocus;
    Exit;
  end;
  if tIni > tFim then
  begin
    tAux := tIni;
    tIni := tFim;
    tFim := tAux;
  end;
  DebugMensagem(uDM.lDebug,'tIni=' + IntToStr(tIni) + '  tFim=' + IntToStr(tFim));
  //
  uDM.ResVendas.Active := True;
  uDM.ResVendas.EmptyDataSet;
  for i := 0 to 6 do
    begin
      vlrMeioPgto[i] := 0;
      qtdMeioPgto[i] := 0;
    end;
  ttQtd := 0;
  ttVlr := 0;
  for i := 0 to 2 do
  begin
    ttQtdDoc[i] := 0;   // NFCe/Outros
    ttVlrDoc[i] := 0;
  end;

  gbTurnos.Height := 212;
  gbTurnos.Enabled := False;
  //
  if rgCaixas.ItemIndex = 0 then
     xCaixa := 'NrEstacao>0 '    // Todos os caixas
  else
     xCaixa := 'NrEstacao=' + IntToStr(rgCaixas.ItemIndex);
  xSitPag := 'SitPagto=1';
  //
  FDQPedidos.Connection := uDM.FDC;
  FDQPedidos.Close;
  FDQPedidos.SQL.Text := 'Select * from com_pedido where' +
                         ' Turno>=' + IntToStr(tIni) + ' and Turno<=' + IntToStr(tFim) +
                         ' and ' + xCaixa + ' and ' + xSitPag;
  FDQPedidos.Open;
  FDQPedidos.Last;
  nRegs := FDQPedidos.RecordCount;
  //
  FDQItens.Connection := uDM.FDC;
  FDQItens.Close;

  DebugMensagem(uDM.lDebug,'Regs=' + IntToStr(nRegs));
 //
  PBar1.Min := 0;
  PBar1.Max := nRegs;
  PBar1.Position := 0;
  PBar1.Visible := True;
  LabProcess.Caption := 'Processando ' + IntToStr(PBar1.Position) + ' de ' + IntToStr(pBar1.Max);
  LabProcess.Visible := True;
  PanResultado.Visible := False;
  DebugMensagem(uDM.lDebug,'Antes da leitura dos pedidos' + #13 +
                           'tIni=' + IntToStr(tIni) + ' tFim=' + IntToStr(tFim) + #13 +
                           'sitPagto=1 (Somente pagos)' + #13 +
                           'Pedidos=' + IntToStr(FDQPedidos.RecordCount));

  Application.ProcessMessages;
  FDQPedidos.First;
  while not FDQPedidos.Eof do
  begin
    ProcessaPedido(FDQPedidosNumero.AsInteger);
    PBar1.Position := pBar1.Position + 1;
    LabProcess.Caption := 'Processando ' + IntToStr(PBar1.Position) + ' de ' + IntToStr(pBar1.Max);
    Application.ProcessMessages;
    FDQPedidos.Next;
  end;
  DebugMensagem(uDM.lDebug,'Depois da leitura dos pedidos');
  //
  uDM.ResVendas.Append;
  uDM.ResVendasTpProd.AsInteger := 9;
  uDM.ResVendasCodProd.AsInteger := 99;
  uDM.ResVendasDescricao.AsString := 'Total geral';
  uDM.ResVendasQuant.AsInteger := ttQtd;
  uDM.ResVendasValor.AsCurrency := ttVlr;
  uDM.ResVendas.Post;
  //
  LabProcess.Visible := False;
  PBar1.Visible := False;
  gbTurnos.Height := 163;
  //
  edReais.Text := FloatToStrF(vlrMeioPgto[0],ffNumber,15,2);
  edCDeb.Text := FloatToStrF(vlrMeioPgto[1],ffNumber,15,2);
  edCCred.Text := FloatToStrF(vlrMeioPgto[2],ffNumber,15,2);
  edPIX.Text := FloatToStrF(vlrMeioPgto[3],ffNumber,15,2);
  edOutros.Text := FloatToStrF(vlrMeioPgto[4],ffNumber,15,2);
  edMisto.Text := FloatToStrF(vlrMeioPgto[5],ffNumber,15,2);
  edTotal.Text := FloatToStrF(vlrMeioPgto[6],ffNumber,15,2);

  edQtdReais.Text := IntToStr(qtdMeioPgto[0]);
  edQtdCDeb.Text := IntToStr(qtdMeioPgto[1]);
  edQtdCCred.Text := IntToStr(qtdMeioPgto[2]);
  edQtdPIX.Text := IntToStr(qtdMeioPgto[3]);
  edQtdOutros.Text := IntToStr(qtdMeioPgto[4]);
  edQtdMisto.Text := IntToStr(qtdMeioPgto[5]);
  edQtdTotal.Text := IntToStr(qtdMeioPgto[6]);

  edVlrNFCe.Text := FloatToStrF(ttVlrDoc[0],ffNumber,15,2);
  edVlrOutrosDoc.Text := FloatToStrF(ttVlrDoc[1],ffNumber,15,2);
  edQtdNFCe.Text := IntToStr( ttQtdDoc[0]);
  edQtdOutrosDoc.Text :=  IntToStr(ttQtdDoc[1]);
  edTotVlrDocs.Text := FloatToStrF(ttVlrDoc[2],ffNumber,15,2);
  edTotQtdDocs.Text := IntToStr(ttQtdDoc[2]);

  PanResultado.Visible := True;
  FDQPedidos.Close;
  FuQueryAdministrativo.FormResize(nil);

end;

procedure TFuQueryAdministrativo.btSairClick(Sender: TObject);
begin
  FuQueryAdministrativo.Close;

end;

procedure TFuQueryAdministrativo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  gbTurnos.Height := 163;
  gbTurnos.Enabled := True;
  LabProcess.Visible := False;
  PBar1.Visible := False;
  PanResultado.Visible := False;

end;

procedure TFuQueryAdministrativo.FormResize(Sender: TObject);
begin
  GridItens := DefineGrid(GridItens,[0.08, 0.33, 0.10, 0.20], 1, 0);

end;

end.
