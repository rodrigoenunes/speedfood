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
    gbSelDados: TGroupBox;
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
    NavResumo: TDBNavigator;
    GridResumo: TDBGrid;
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
    rgMeiosPagto: TRadioGroup;
    rgSituacao: TRadioGroup;
    rgDocumentos: TRadioGroup;
    procedure btSairClick(Sender: TObject);
    procedure btProcessarClick(Sender: TObject);
    procedure btNovaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
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
    rgCaixas.Items.Clear;
    rgCaixas.Items.Add('Todos');
    rgCaixas.Items.Add('Onibus');
    rgCaixas.Items.Add('Balcão');
    rgCaixas.Items.Add('Buffet');
    rgCaixas.ItemIndex := 0;   //uDM.sysNrCaixa;

    rgSituacao.Items.Clear;
    rgSituacao.Items.Add('Todos');
    rgSituacao.Items.Add('Pendentes');
    rgSituacao.Items.Add('Pagos');
    rgSituacao.Items.Add('Cancelados');
    rgSituacao.ItemIndex := 2;

    rgMeiosPagto.Items.Clear;
    rgMeiosPagto.Items.Add('Todos');
    rgMeiosPagto.Items.Add('Dinheiro');
    rgMeiosPagto.Items.Add('C.Débito');
    rgMeiosPagto.Items.Add('C.Crédito');
    rgMeiosPagto.Items.Add('PIX');
    rgMeiosPagto.Items.Add('Outros');
    rgMeiosPagto.Items.Add('Misto');
    rgMeiosPagto.ItemIndex := 0;

    rgDocumentos.Items.Clear;
    rgDocumentos.Items.Add('Todos');
    rgDocumentos.Items.Add('NFCe');
    rgDocumentos.Items.Add('Outros');
    rgDocumentos.ItemIndex := 0;

    gbSelDados.Height := 272;
    gbSelDados.Enabled := True;
    btProcessar.Enabled := gbSelDados.Enabled;
    btSair.Enabled := gbSelDados.Enabled;
    LabProcess.Visible := False;
    pBar1.Visible := False;
    PanResultado.Visible := False;

    FuQueryAdministrativo.ShowModal;

  end;

end;

Procedure ProcessaPedido(pmtPedido:Integer);
var iDoc: integer;
    vlrItens: Currency;
begin
  // Totaliza pedido, selecionado no "Select"
  with FuQueryAdministrativo
  do begin
    // Verifica validade do pedido
    FDQItens.SQL.Text := 'Select * from com_pedidoitem where Numero='+ IntToStr(pmtPedido);
    FDQItens.Open;
    FDQItens.First;
    vlrItens := 0;
    while not FDQItens.Eof do
    begin
      vlrItens := vlrItens + FDQItensVlrTotal.AsCurrency;
      FDQItens.Next;
    end;
    if vlrItens <> FDQPedidosValor.AsCurrency then
    begin
      DebugMensagem(uDM.lDebug,'Pedido ' + IntToStr(pmtPedido) +
                               '  Valor=' + FloatToStrF(FDQPedidosValor.AsCurrency,ffNumber,15,2) +
                               '  Calc='+ FloatToStrF(vlrItens,ffNumber,15,2));
      Exit;
    end;
    //
    // Totalização por MeioPagto
    qtdMeioPgto[FDQPedidosMeioPagto.AsInteger] := qtdMeioPgto[FDQPedidosMeioPagto.AsInteger] + 1;
    vlrMeioPgto[0] := vlrMeioPgto[0] + FDQPedidosVlrReais.AsCurrency;
    vlrMeioPgto[1] := vlrMeioPgto[1] + FDQPedidosVlrCDeb.AsCurrency;
    vlrMeioPgto[2] := vlrMeioPgto[2] + FDQPedidosVlrCCred.AsCurrency;
    vlrMeioPgto[3] := vlrMeioPgto[3] + FDQPedidosVlrPIX.AsCurrency;
    vlrMeioPgto[4] := vlrMeioPgto[4] + FDQPedidosVlrOutros.AsCurrency;
    if FDQPedidosMeioPagto.AsInteger = 5 then
       vlrMeioPgto[5] := vlrMeioPgto[5] + FDQPedidosValor.AsCurrency;      // Pagto misto totalização
    qtdMeioPgto[6] := qtdMeioPgto[6] + 1;    // Qtd total de pedidos
    vlrMeioPgto[6] := vlrMeioPgto[6] + FDQPedidosValor.AsCurrency;  // Somatório total dos pedidos
    // Totalização por documento emitido
    if FDQPedidosNrNFCe.AsInteger > 0 then
       iDoc := 0    // NFCe
    else
       iDoc := 1;   // Outros
    ttQtdDoc[iDoc] := ttQtdDoc[iDoc] + 1;
    ttVlrDoc[iDoc] := ttVlrDoc[iDoc] + FDQPedidosValor.AsCurrency;
    ttQtdDoc[2] := ttQtdDoc[2] + 1;
    ttVlrDoc[2] := ttVlrDoc[2] + FDQPedidosValor.AsCurrency;
    //
    // Totalização dos itens vendidos
    FDQItens.SQL.Text := 'Select * from com_pedidoitem where Numero='+ IntToStr(pmtPedido);
    FDQItens.Open;
    FDQItens.First;
    while not FDQItens.Eof do
    begin
      if not uDM.ResumoVendas.FindKey([FDQItensTpProd.AsInteger,FDQItensCodProd.AsInteger]) then
      begin
        uDM.ResumoVendas.Append;
        uDM.ResumoVendasTpProd.AsInteger := FDQItensTpProd.AsInteger;
        uDM.ResumoVendasCodProd.AsInteger := FDQItensCodProd.AsInteger;
        if uDM.Itens.FindKey([FDQItensTpProd.AsInteger,FDQItensCodProd.AsInteger]) then
          uDM.ResumoVendasDescricao.AsString := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase,rfReplaceAll])
        else
          uDM.ResumoVendasDescricao.AsString := 'Produto ' + uDM.PedItensTpProd.AsString +  '-' + uDM.PedItensCodProd.AsString;
      end
      else
        uDM.ResumoVendas.Edit;
      uDM.ResumoVendasQuant.AsInteger := uDM.ResumoVendasQuant.AsInteger + FDQItensQuant.AsInteger;
      uDM.ResumoVendasValor.AsCurrency := uDM.ResumoVendasValor.AsCurrency + FDQItensVlrTotal.AsCurrency;
      uDM.ResumoVendas.Post;
      // Totalização geral de ítens
      ttQtd := ttQtd + FDQItensQuant.AsInteger;
      ttVlr := ttVlr + FDQItensVlrTotal.AsCurrency;
      //
      FDQItens.Next;

    end;
  end;



end;


procedure TFuQueryAdministrativo.btImprimirClick(Sender: TObject);
begin
  ImprimeResumo(cbTurnoIni.Text,cbTurnoFin.Text,
                vlrMeioPgto,
                qtdMeioPgto,
                ttVlrDoc,
                ttQtdDoc,
                rgCaixas.ItemIndex,
                rgSituacao.ItemIndex,
                rgMeiosPagto.ItemIndex,
                rgDocumentos.ItemIndex);

end;

procedure TFuQueryAdministrativo.btNovaClick(Sender: TObject);
begin
  gbSelDados.Enabled := True;
  btProcessar.Enabled := gbSelDados.Enabled;
  btSair.Enabled := gbSelDados.Enabled;
  LabProcess.Visible := False;
  PBar1.Visible := False;
  PanResultado.Visible := False;
  rgSituacao.ItemIndex := 2;
  rgMeiosPagto.ItemIndex := 0;
  cbTurnoIni.SetFocus;

end;

procedure TFuQueryAdministrativo.btProcessarClick(Sender: TObject);
var i,tAux: Integer;
    nRegs: Integer;
    wMsg: String;
    wSelText: String;
begin
  i := Pos(' ',cbTurnoIni.Text);
  tIni := StrToIntDef(Copy(cbTurnoIni.Text,1,i-1),99999);
  i := Pos(' ',cbTurnoFin.Text);
  tFim := StrToIntDef(Copy(cbTurnoFin.Text,1,i-1),99999);
  wMsg := '';
  if (tIni = 99999) or (tFim = 99999) then
    wMsg := wMsg + 'Informação de turnos' + #13;
  if rgCaixas.ItemIndex < 0 then
    wMsg := wMsg + 'Indicação de "Caixa"' + #13;
  if rgSituacao.ItemIndex < 0 then
    wMsg := wMsg + 'Situação dos pedidos' + #13;
  if rgMeiosPagto.ItemIndex < 0 then
    wMsg := wMsg + 'Meio de pagamento' + #13;
  if rgDocumentos.ItemIndex < 0 then
    wMsg := wMsg + 'Docs. emitidos' + #13;
  if wMsg <> '' then
  begin
    MessageDlg('Verifique a seleção de dados' + #13 + wMsg + #13 +
               'Reinforme',mtError,[mbOk],0);
    cbTurnoIni.SetFocus;
    Exit;
  end;
  if tIni > tFim then
  begin
    tAux := tIni;
    tIni := tFim;
    tFim := tAux;
  end;
  //
  DebugMensagem(uDM.lDebug,'tIni=' + IntToStr(tIni) + '  tFim=' + IntToStr(tFim));
  //
  uDM.ResumoVendas.Active := True;
  uDM.ResumoVendas.EmptyDataSet;
  // Meios de pagamento (0-R$ 1-CDeb 2-CCred 3-PIX 4-Outros 5-Misto 6-Total)
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
  //
  gbSelDados.Enabled := False;
  btProcessar.Enabled := gbSelDados.Enabled;
  btSair.Enabled := gbSelDados.Enabled;
  //
  wSelText := 'Select * from com_pedido where ' +
              'Turno>=' + IntToStr(tIni) + ' and Turno<=' + IntToStr(tFim);
  if rgCaixas.ItemIndex > 0 then
    wSelText := wSelText + ' and NrEstacao=' + IntToStr(rgCaixas.ItemIndex);
  if rgSituacao.ItemIndex > 0 then
  begin
    wSelText := wSelText + ' and SitPagto=';
    case rgSituacao.itemIndex of
      1:wSelText := wSelText + '0';   // Pendentes
      2:wSelText := wSelText + '1';   // Pagos
      3:wSeltext := wSelText + '9';   // cancelados
    end;
  end;
  if rgMeiosPagto.ItemIndex > 0 then
    wSelText := wSelText + ' and MeioPagto=' + IntToStr(rgMeiosPagto.ItemIndex-1);
  if rgDocumentos.ItemIndex > 0 then
  begin
    wSelText := wSelText + ' and NrNFCe';
    if rgDocumentos.ItemIndex = 1 then
      wSelText := wSelText + '>0'
    else
      wSelText := wSelText + '=0';
  end;
   //
  FDQPedidos.Connection := uDM.FDC;
  FDQPedidos.Close;
  FDQPedidos.SQL.Text := wSelText;
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
  Application.ProcessMessages;
  DebugMensagem(uDM.lDebug,'Antes da leitura dos pedidos' + #13 +
                           wSelText + #13 +
                           'Pedidos=' + IntToStr(nRegs));
  FDQPedidos.First;
  while not FDQPedidos.Eof do
  begin
    PBar1.Position := pBar1.Position + 1;
    LabProcess.Caption := 'Processando ' + IntToStr(PBar1.Position) + ' de ' + IntToStr(pBar1.Max);
    Application.ProcessMessages;
    ProcessaPedido(FDQPedidosNumero.AsInteger);
    FDQPedidos.Next;
  end;
  DebugMensagem(uDM.lDebug,'Depois da leitura dos pedidos');
  LabProcess.Visible := False;
  PBar1.Visible := False;
  Application.ProcessMessages;
  //
  uDM.ResumoVendas.Append;
  uDM.ResumoVendasTpProd.AsInteger := 99;
  uDM.ResumoVendasCodProd.AsInteger := 99;
  uDM.ResumoVendasDescricao.AsString := 'Total geral';
  uDM.ResumoVendasQuant.AsInteger := ttQtd;
  uDM.ResumoVendasValor.AsCurrency := ttVlr;
  uDM.ResumoVendas.Post;
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

procedure TFuQueryAdministrativo.FormResize(Sender: TObject);
begin
  GridResumo := DefineGrid(GridResumo,[0.08, 0.33, 0.10, 0.20], 1, 0);

end;

end.
