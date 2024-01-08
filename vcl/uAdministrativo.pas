unit uAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,  FireDAC.Stan.ExprFuncs,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, System.UITypes;
  Procedure Administrativo;

type
  TFuAdministrativo = class(TForm)
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
    procedure btSairClick(Sender: TObject);
    procedure btProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btNovaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuAdministrativo: TFuAdministrativo;
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
    lFilter: Boolean;
begin
  uDM.lDebug := False;
  if ObtemParametro('_DEBUG') = 'S' then uDM.lDebug := True;
  if not CriaResumoVendas then
  begin
    MessageDlg('Não foi possível criar "ResumoVendas"',mtError,[mbOk],0);
    Exit;
  end;
  FuAdministrativo := TFuAdministrativo.Create(nil);
  FuAdministrativo.Top := 12;
  FuAdministrativo.Height := Screen.Height - 80;
  FuAdministrativo.Left := 80;
  with FuAdministrativo
  do begin
    cbTurnoIni.Clear;
    cbTurnoFin.Clear;
    uDM.RegCaixa.Last;
    while not uDM.RegCaixa.Bof do
    begin
      xTurno := uDM.RegCaixaTurno.AsString + '  ' +
                uDM.RegCaixaDtHrInicio.AsString + ' - ' + uDM.RegCaixaDtHrFim.AsString;
      cbTurnoIni.AddItem(xTurno,nil);
      cbTurnoFin.AddItem(xTurno,nil);
      uDM.RegCaixa.Prior;
    end;
    cbTurnoIni.ItemIndex := 0;
    cbTurnoFin.ItemIndex := 0;
    lFilter := uDM.Pedidos.Filtered;

    FuAdministrativo.ShowModal;

    uDM.Pedidos.Filtered := lFilter;
    uDM.Pedidos.Refresh;

  end;
  FuAdministrativo.Free;

end;

Procedure ProcessaPedido;
var iDoc: integer;
begin
  uDM.PedItens.First;
  while not uDM.PedItens.Eof do
  begin
    if uDM.ResVendas.FindKey([uDM.PedItensTpProd.AsInteger,uDM.PedItensCodProd.AsInteger]) then
      uDM.ResVendas.Edit
    else begin
      uDM.ResVendas.Append;
      uDM.ResVendasTpProd.AsInteger := uDM.PedItensTpProd.AsInteger;
      uDM.ResVendasCodProd.AsInteger := uDM.PedItensCodProd.AsInteger;
      if uDM.Itens.FindKey([uDM.PedItensTpProd.AsInteger,uDM.PedItensCodProd.AsInteger]) then
        uDM.ResVendasDescricao.AsString := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll])
      else
        uDM.ResVendasDescricao.AsString := 'Produto ' + uDM.PedItensTpProd.AsString +  '-' + uDM.PedItensCodProd.AsString;
    end;
    uDM.ResVendasQuant.AsInteger := uDM.ResVendasQuant.AsInteger + uDM.PedItensQuant.AsInteger;
    uDM.ResVendasValor.AsCurrency := uDM.ResVendasValor.AsCurrency + uDM.PedItensVlrTotal.AsCurrency;
    //
    ttQtd := ttQtd + uDM.PedItensQuant.AsInteger;
    ttVlr := ttVlr + uDM.PedItensVlrTotal.AsCurrency;
    //
    uDM.ResVendas.Post;
    uDM.PedItens.Next;
  end;
  //
  if (uDM.PedidosMeioPagto.AsInteger >= 0) and (uDM.PedidosMeioPagto.AsInteger <= 5) then
  begin
    qtdMeioPgto[uDM.PedidosMeioPagto.AsInteger] := qtdMeioPgto[uDM.PedidosMeioPagto.AsInteger] + 1;
    vlrMeioPgto[0] := vlrMeioPgto[0] + uDM.PedidosVlrReais.AsCurrency;
    vlrMeioPgto[1] := vlrMeioPgto[1] + uDM.PedidosVlrCDeb.AsCurrency;
    vlrMeioPgto[2] := vlrMeioPgto[2] + uDM.PedidosVlrCCred.AsCurrency;
    vlrMeioPgto[3] := vlrMeioPgto[3] + uDM.PedidosVlrPIX.AsCurrency;
    vlrMeioPgto[4] := vlrMeioPgto[4] + uDM.PedidosVlrOutros.AsCurrency;
    if uDM.PedidosMeioPagto.AsInteger = 5 then
       vlrMeioPgto[5] := vlrMeioPgto[5] + uDM.PedidosValor.AsCurrency;
    // Totalização
    qtdMeioPgto[6] := qtdMeioPgto[6] + 1;    // Qtd total de pedidos
    vlrMeioPgto[6] := vlrMeioPgto[6] + uDM.PedidosValor.AsCurrency;  // Somatório dos pedidos
    //
    if uDM.PedidosNrNFCe.AsInteger > 0
      then iDoc := 0    // NFCe
      else iDoc := 1;   // Outros
    ttQtdDoc[iDoc] := ttQtdDoc[iDoc] + 1;
    ttVlrDoc[iDoc] := ttVlrDoc[iDoc] + uDM.PedidosValor.AsCurrency;
    ttQtdDoc[2] := ttQtdDoc[2] + 1;
    ttVlrDoc[2] := ttVlrDoc[2] + uDM.PedidosValor.AsCurrency;
  end;

end;


procedure TFuAdministrativo.btImprimirClick(Sender: TObject);
begin
  ImprimeResumo(cbTurnoIni.Text,cbTurnoFin.Text,vlrMeioPgto,qtdMeioPgto,ttVlrDoc,ttQtdDoc);

end;

procedure TFuAdministrativo.btNovaClick(Sender: TObject);
begin
  gbTurnos.Height := 101;
  gbTurnos.Enabled := True;
  LabProcess.Visible := False;
  PBar1.Visible := False;
  PanResultado.Visible := False;
  cbTurnoIni.SetFocus;

end;

procedure TFuAdministrativo.btProcessarClick(Sender: TObject);
var i,tAux: Integer;
    impAnt,pgtAnt: Integer;
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
  if uDM.lDebug then
    MessageDlg('tIni=' + IntToStr(tIni) + '  tFim=' + IntToStr(tFim), mtInformation,[mbOk],0);
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

  gbTurnos.Height := 151;
  gbTurnos.Enabled := False;

  uDM.turnoIni := tIni;
  uDM.TurnoFin := tFim;
  impAnt := uDM.etqImpress;
  pgtAnt := uDM.sitPagto;
  uDM.etqImpress := 2;             // Sem seleção de impressão de etiquetas
  uDM.sitPagto := 1;               // Somente pagos
  uDM.Pedidos.Filtered := True;
  uDM.Pedidos.Refresh;
  uDM.Pedidos.First;
  PBar1.Min := 0;
  PBar1.Max := uDM.Pedidos.RecordCount;
  PBar1.Position := 0;
  PBar1.Visible := True;
  LabProcess.Caption := 'Processando ' + IntToStr(PBar1.Position) + ' de ' + IntToStr(pBar1.Max);
  LabProcess.Visible := True;
  PanResultado.Visible := False;
  if uDM.lDebug then MessageDlg('Antes da leitura dos pedidos' + #13 +
                                'tIni=' + IntToStr(uDM.turnoIni) + ' tFim=' + IntToStr(uDM.turnoFin) + #13 +
                                'sitPagto=' + IntToStr(uDM.sitPagto) + ' etiqs=' + IntToStr(uDM.etqImpress) + #13 +
                                'Pedidos=' + IntToStr(uDM.Pedidos.RecordCount),mtInformation,[mbOk],0);

  Application.ProcessMessages;
  while not uDM.Pedidos.Eof do
  begin
    //if (uDM.PedidosTurno.AsInteger >= tIni) and (uDM.PedidosTurno.AsInteger <= tFim)
    //  then ProcessaPedido;
    ProcessaPedido;
    PBar1.Position := pBar1.Position + 1;
    LabProcess.Caption := 'Processando ' + IntToStr(PBar1.Position) + ' de ' + IntToStr(pBar1.Max);
    Application.ProcessMessages;
    uDM.Pedidos.Next;
  end;
  if uDM.lDebug then MessageDlg('Depois da leitura dos pedidos',mtInformation,[mbOk],0);
  //
  uDM.etqImpress := impAnt;
  uDM.meioPgto := pgtAnt;
  uDM.Pedidos.Refresh;
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
  gbTurnos.Height := 101;
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
  FuAdministrativo.FormResize(nil);

end;

procedure TFuAdministrativo.btSairClick(Sender: TObject);
begin
  FuAdministrativo.Close;

end;

procedure TFuAdministrativo.FormCreate(Sender: TObject);
begin
  //LabObsMisto.Caption := '(*) Incluso nos meios' + #13 + 'de pagamento';

end;

procedure TFuAdministrativo.FormResize(Sender: TObject);
begin
  GridItens := DefineGrid(GridItens,[0.08, 0.33, 0.10, 0.20], 1, 0);

end;

end.
