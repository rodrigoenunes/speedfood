unit uDados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, Datasnap.DBClient;
  Procedure ContaExtras;
  Procedure CarregaExtras(pLins: Integer);

  Function CriaAbrePedidoWrk(pNro:Integer): Integer;

type
  TuDM = class(TDataModule)
    FDC: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    Itens: TFDTable;
    DSItens: TDataSource;
    SisPessoa: TFDTable;
    SisPessoaid: TLongWordField;
    SisPessoanome: TStringField;
    SisPessoafantasia: TStringField;
    SisPessoacnpj: TStringField;
    SisPessoaIE: TStringField;
    SisPessoalogradouro: TStringField;
    SisPessoanro: TStringField;
    SisPessoacomplemento: TStringField;
    SisPessoabairro: TStringField;
    SisPessoacidade: TStringField;
    SisPessoauf: TStringField;
    SisPessoaigbecidade: TStringField;
    SisPessoacep: TStringField;
    SisPessoatelefone: TStringField;
    SisPessoawhatsapp: TStringField;
    SisPessoaCSC_Homolog: TStringField;
    SisPessoaCSC_Producao: TStringField;
    SisPessoaNSCertificado: TStringField;
    SisPessoaNrNFCe: TIntegerField;
    SisPessoaSerieNFCe: TStringField;
    ItensZC_Grupo: TStringField;
    PedWrk: TClientDataSet;
    PedWrkNrLcto: TSmallintField;
    PedWrkTpProd: TSmallintField;
    PedWrkCodProd: TIntegerField;
    PedWrkDescricao: TStringField;
    PedWrkObserv: TMemoField;
    PedWrkQuant: TSmallintField;
    PedWrkVlrUnit: TCurrencyField;
    PedWrkExtras: TStringField;
    PedWrkVlrTotal: TCurrencyField;
    PedWrkTxtExtras: TMemoField;
    SPedWrk: TDataSource;
    Pedidos: TFDTable;
    DSPedidos: TDataSource;
    PedidosData: TDateTimeField;
    PedidosCPF_CNPJ: TStringField;
    PedidosValor: TBCDField;
    PedidosMeioPagto: TIntegerField;
    PedidosNrNFCe: TIntegerField;
    PedidosSrNFCe: TIntegerField;
    DSPedItens: TDataSource;
    PedItens: TFDTable;
    ItensDescricao: TStringField;
    ItensTamanho: TStringField;
    ItensPreco: TBCDField;
    ItensNCM: TStringField;
    ItensCFOP: TIntegerField;
    ItensCSOSN: TIntegerField;
    ItensCST: TIntegerField;
    ItensCST_IPI: TIntegerField;
    ItensCST_PIS: TIntegerField;
    ItensCST_COFINS: TIntegerField;
    ItensPcReduz: TFMTBCDField;
    ItensAliqICMS: TBCDField;
    ItensImagem: TStringField;
    ItensGrupo: TIntegerField;
    ItensCodigo: TIntegerField;
    PedWrkVlr01: TCurrencyField;
    PedWrkVlr02: TCurrencyField;
    PedWrkVlr03: TCurrencyField;
    ItensDescrCompleta: TStringField;
    ItensUnidade: TStringField;
    ItensCodBarras: TStringField;
    ItensMinMax: TBooleanField;
    ItensMaximo: TIntegerField;
    ItensMinimo: TIntegerField;
    PedItensNumero: TIntegerField;
    PedItensNrLcto: TIntegerField;
    PedItensTpProd: TIntegerField;
    PedItensCodProd: TIntegerField;
    PedItensObservacao: TStringField;
    PedItensQuant: TIntegerField;
    PedItensVlrUnitario: TBCDField;
    PedItensVlrTotal: TBCDField;
    PedItensExtras: TStringField;
    PedWrkCod01: TSmallintField;
    PedWrkCod02: TSmallintField;
    PedWrkCod03: TSmallintField;
    PedWrkTxtExclus: TMemoField;
    PedWrkZC_Aviso: TStringField;
    ItensZC_Key: TStringField;
    PedidosLanctos: TIntegerField;
    PedItensCod01: TIntegerField;
    PedItensVlr01: TBCDField;
    PedItensCod02: TIntegerField;
    PedItensVlr02: TBCDField;
    PedItensCod03: TIntegerField;
    PedItensVlr03: TBCDField;
    PedItensTxtExtras: TStringField;
    PedItensTxtExclus: TStringField;
    PedidosVlrReais: TBCDField;
    PedidosVlrCDeb: TBCDField;
    PedidosVlrCCred: TBCDField;
    PedidosVlrPIX: TBCDField;
    PedidosVlrOutros: TBCDField;
    PedidosEtqImpressas: TShortintField;
    PedItensEtqImpressa: TShortintField;
    PedidosArqXML: TMemoField;
    PedidosNumero: TLongWordField;
    RegCaixa: TFDTable;
    RegCaixaTurno: TIntegerField;
    RegCaixaDtHrInicio: TDateTimeField;
    RegCaixaDtHrFim: TDateTimeField;
    RegCaixaSaldoInicial: TBCDField;
    RegCaixaE_Dinheiro: TBCDField;
    RegCaixaE_CartaoCredito: TBCDField;
    RegCaixaE_CartaoDebito: TBCDField;
    RegCaixaE_PIX: TBCDField;
    RegCaixaE_Outros: TBCDField;
    RegCaixaE_Suprimento: TBCDField;
    RegCaixaS_Saidas: TBCDField;
    RegCaixaS_Sangria: TBCDField;
    RegCaixaSaldoFinal: TBCDField;
    RegCaixaQtd_Dinheiro: TIntegerField;
    RegCaixaQtd_CartaoCredito: TIntegerField;
    RegCaixaQtd_CartaoDebito: TIntegerField;
    RegCaixaQtd_PIX: TIntegerField;
    RegCaixaQtd_Outros: TIntegerField;
    RegCaixaQtd_Suprimento: TIntegerField;
    RegCaixaQtd_Saidas: TIntegerField;
    RegCaixaQtd_Sangria: TIntegerField;
    RegCaixaQtd_Misto: TIntegerField;
    LctCaixa: TFDTable;
    LctCaixaTurno: TIntegerField;
    LctCaixaSequencia: TIntegerField;
    LctCaixaOperacao: TIntegerField;
    LctCaixaValor: TBCDField;
    LctCaixaMeioPgt: TIntegerField;
    LctCaixaSaldo: TBCDField;
    LctCaixaHistorico: TStringField;
    LctCaixaPgtReais: TBCDField;
    LctCaixaPgtCDeb: TBCDField;
    LctCaixaPgtCCred: TBCDField;
    LctCaixaPgtPIX: TBCDField;
    LctCaixaPgtOutros: TBCDField;
    LctCaixaNroPedido: TIntegerField;
    LctCaixaDtHrLcto: TStringField;
    DSRegCaixa: TDataSource;
    DSLctCaixa: TDataSource;
    LctCaixaZC_Operacao: TStringField;
    LctCaixaZC_MeioPgt: TStringField;
    PedidosNomeCliente: TStringField;
    PedidosVlrRecebido: TBCDField;
    PedidosVlrTroco: TBCDField;
    procedure ItensCalcFields(DataSet: TDataSet);
    procedure LctCaixaCalcFields(DataSet: TDataSet);
    procedure PedWrkCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    pathWork: String;
    nExtras: Integer;
    wNroPedido: Integer;
    wCodExtra: array[1..2,1..12] of integer;
    wTxtExtra: array[1..2,1..12] of String;
    wVlrExtra: array[1..2,1..12] of Currency;
    wCodExtraTab: array[1..24] of Integer;
    wTxtExtraTab: array[1..24] of String;
    wVlrExtraTab: array[1..24] of Currency;

  end;

var
  uDM: TuDM;

const
  xGrupos: array[1..4] of String = ('Lanches','Extras','Bedidas','Diversos');
  xOperacao: array[0..4] of String = ('Saldo','Receb','Suprim','Pagto','Sangria');
  xMeioPgt: array[1..5] of String = ('R$', 'CCred','CDeb','PIX','Outros');

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure ContaExtras;
begin
  uDM.nExtras := 0;
  uDM.Itens.FindNearest([2,0]);
  while (uDM.ItensGrupo.AsInteger = 2) and (not uDM.Itens.Eof)
  do begin
    uDM.nExtras := uDM.nExtras + 1;
    uDM.Itens.Next;
  end;

end;


Procedure CarregaExtras(pLins: Integer);
var i,j,k: Integer;
begin
  for i := 1 to 2 do
    for j := 1 to 12 do
      begin
        uDM.wCodExtra[i,j] := 0;
        uDM.wTxtExtra[i,j] := '';
        uDM.wVlrExtra[i,j] := 0;
      end;
  for k := 1 to 24 do
    begin
      uDM.wCodExtraTab[k] := 0;
      uDM.wTxtExtraTab[k] := '';
      uDM.wVlrExtraTab[k] := 0;
    end;
  i := 1;
  j := 1;
  uDM.Itens.FindNearest([2,1]);
  while uDM.ItensGrupo.AsInteger = 2
  do begin
    uDM.wCodExtra[i,j] := uDM.ItensCodigo.AsInteger;
    uDM.wTxtExtra[i,j] := uDM.ItensDescricao.AsString;
    uDM.wVlrExtra[i,j] := uDM.ItensPreco.AsCurrency;
    j := j + 1;
    if j > pLins
    then begin
      j := 1;
      i := i + 1;
    end;
    k := uDM.ItensCodigo.AsInteger;
    uDM.wCodExtraTab[k] := uDM.ItensCodigo.AsInteger;
    uDM.wTxtExtraTab[k] := uDM.ItensDescricao.AsString;
    uDM.wVlrExtraTab[k] := uDM.ItensPreco.AsCurrency;
    k := k + 1;
    uDM.Itens.Next;
  end;

end;


Function CriaAbrePedidoWrk(pNro:Integer): Integer;
begin
  Result  := 0;
  with uDM
  do begin
    PedWrk.Active := False;
    PedWrk.FieldDefs.Clear;
    PedWrk.FieldDefs.Add('NrLcto',    ftSmallint);
    PedWrk.FieldDefs.Add('TpProd',    ftSmallint);
    PedWrk.FieldDefs.Add('CodProd',   ftInteger);
    PedWrk.FieldDefs.Add('Descricao', ftString, 30);
    PedWrk.FieldDefs.Add('Observ',    ftMemo, 10);      // Comentários
    PedWrk.FieldDefs.Add('Quant',     ftSmallint);
    PedWrk.FieldDefs.Add('VlrUnit',   ftCurrency);
    PedWrk.FieldDefs.Add('Extras',    ftString, 24);
    PedWrk.FieldDefs.Add('Cod01',     ftSmallint);
    PedWrk.FieldDefs.Add('Vlr01',     ftCurrency);
    PedWrk.FieldDefs.Add('Cod02',     ftSmallint);
    PedWrk.FieldDefs.Add('Vlr02',     ftCurrency);
    PedWrk.FieldDefs.Add('Cod03',     ftSmallint);
    PedWrk.FieldDefs.Add('Vlr03',     ftCurrency);
    PedWrk.FieldDefs.Add('VlrTotal',  ftCurrency);
    PedWrk.FieldDefs.Add('TxtExtras', ftMemo, 1024);      // Extras - texto
    PedWrk.FieldDefs.Add('TxtExclus', ftMemo, 1024);      // Exclusoes - texto
    PedWrk.IndexDefs.Clear;
    PedWrk.IndexDefs.Add('','NrLcto',[ixPrimary,ixUnique]);
    PedWrk.CreateDataSet;
    Try
      PedWrk.Active := True;
      PedWrk.Active := False;
    Except
      Result := 2;
      Exit;
    End;
    PedWrk.Active := True;
    wNroPedido := pNro;

  end;

end;


procedure TuDM.ItensCalcFields(DataSet: TDataSet);
begin
  if uDM = Nil then Exit;
  if not uDM.Itens.Active then Exit;
  if (uDM.ItensGrupo.AsInteger > 0) and (uDM.ItensGrupo.AsInteger < 5)
     then uDM.ItensZC_Grupo.AsString := xGrupos[uDM.ItensGrupo.AsInteger]
     else uDM.ItensZC_Grupo.AsString := '(' + uDM.ItensGrupo.AsString + ')';
  uDM.ItensZC_Key.AsString := uDM.ItensGrupo.AsString + uDM.ItensCodigo.AsString;

end;

procedure TuDM.LctCaixaCalcFields(DataSet: TDataSet);
begin
  if (uDM.LctCaixaOperacao.AsInteger >= 0) and (uDM.LctCaixaOperacao.AsInteger <= 4)
     then uDM.LctCaixaZC_Operacao.AsString := xOperacao[uDM.LctCaixaOperacao.AsInteger]
     else uDM.LctCaixaZC_Operacao.AsString := '(' + uDM.LctCaixaOperacao.AsString + ')';

  if (uDM.LctCaixaMeioPgt.AsInteger >= 1) and (uDM.LctCaixaMeioPgt.AsInteger <= 5)
     then uDM.LctCaixaZC_MeioPgt.AsString := xMeioPgt[uDM.LctCaixaMeioPgt.AsInteger]
     else uDM.LctCaixaZC_MeioPgt.AsString := '';

end;

procedure TuDM.PedWrkCalcFields(DataSet: TDataSet);
begin
  if not PedWrk.Active then Exit;
  PedWrkZC_Aviso.AsString := '';
  if (Pos('1',PedWrkExtras.AsString) > 0)
     or (Pos('2',PedWrkExtras.AsString) > 0) then PedWrkZC_Aviso.AsString := 'P';

end;

end.
