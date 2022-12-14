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
  Procedure CarregaExtras(pCols,pLins: Integer);
  Function CriaAbrePedidoWrk(pNro:Integer): Integer;
  Function ObtemParametro(idParam:String): String;

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
    PedWrkZC_Aviso: TStringField;
    PedidosLanctos: TIntegerField;
    PedItensCod01: TIntegerField;
    PedItensVlr01: TBCDField;
    PedItensCod02: TIntegerField;
    PedItensVlr02: TBCDField;
    PedItensCod03: TIntegerField;
    PedItensVlr03: TBCDField;
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
    DSSisPessoa: TDataSource;
    SisPessoaValCertificado: TDateTimeField;
    SisPessoaibgecidade: TStringField;
    SisPessoaTecladoVirtual: TBooleanField;
    PedWrkTxtSem: TMemoField;
    PedWrkTxtMais: TMemoField;
    PedWrkTxtMenos: TMemoField;
    PedItensTxtSem: TStringField;
    PedItensTxtMais: TStringField;
    PedItensTxtMenos: TStringField;
    ItensAlteraPreco: TBooleanField;
    ItensZC_AltPreco: TStringField;
    ItensZC_Key: TStringField;
    PedWrkAltPreco: TBooleanField;
    SisPessoaPathImagens: TStringField;
    PedWrkZC_Extras: TCurrencyField;
    LctCaixaZC_DtHr: TStringField;
    LctCaixaZC_Reais: TStringField;
    LctCaixaZC_CDeb: TStringField;
    LctCaixaZC_PIX: TStringField;
    LctCaixaZC_Outros: TStringField;
    LctCaixaZC_CCred: TStringField;
    RegCaixaZC_IniFim: TStringField;
    RegCaixaZC_VlrEntradas: TCurrencyField;
    RegCaixaZC_VlrSaidas: TCurrencyField;
    RegCaixaZC_QtdEntradas: TIntegerField;
    RegCaixaZC_QtdSaidas: TIntegerField;
    LctCaixaTipo: TStringField;
    PedItensAlteraPreco: TShortintField;
    PedItensVlrUnFiscal: TBCDField;
    LctCaixaZC_SomaMP: TCurrencyField;
    PedidosTurno: TIntegerField;
    PedItensTurno: TIntegerField;
    EtqItens: TFDTable;
    EtqItensNumero: TIntegerField;
    EtqItensNrLcto: TIntegerField;
    EtqItensTpProd: TIntegerField;
    EtqItensCodProd: TIntegerField;
    EtqItensQuant: TIntegerField;
    EtqItensTxtSem: TStringField;
    EtqItensTxtMais: TStringField;
    EtqItensTxtMenos: TStringField;
    EtqItensObservacao: TStringField;
    EtqItensEtqImpressa: TShortintField;
    EtqItensTurno: TIntegerField;
    DSEtqItens: TDataSource;
    EtqItensZC_Descricao: TStringField;
    EtqItensZC_DataHora: TStringField;
    EtqItensExtras: TStringField;
    EtqItensZC_NroLcto: TStringField;
    Parametros: TFDTable;
    ParametrosNome: TStringField;
    ParametrosDescricao: TStringField;
    ParametrosValor: TStringField;
    Parametrossis_parametroscol: TStringField;
    procedure ItensCalcFields(DataSet: TDataSet);
    procedure LctCaixaCalcFields(DataSet: TDataSet);
    procedure PedWrkCalcFields(DataSet: TDataSet);
    procedure RegCaixaCalcFields(DataSet: TDataSet);
    procedure EtqItensCalcFields(DataSet: TDataSet);
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
  xMeioPgt: array[0..5] of String = ('R$', 'CDeb','CCred','PIX','Outros','Misto');

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


Procedure CarregaExtras(pCols,pLins: Integer);
var i,j,k: Integer;
    maxCol,maxLin: Integer;
begin
  if pCols = 4 then maxCol := 1
               else maxCol := 2;
  maxLin := pLins;
  for i := 1 to MaxCol do
    for j := 1 to MaxLin do
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
    if j > maxLin
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
    PedWrk.FieldDefs.Add('TxtSem',    ftMemo, 10);      // Texto 'SEM'
    PedWrk.FieldDefs.Add('TxtMais',   ftMemo, 10);
    PedWrk.FieldDefs.Add('TxtMenos',  ftMemo, 10);
    PedWrk.FieldDefs.Add('AltPreco',  ftBoolean);
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

Function ObtemParametro(idParam:String): String;
begin
  Result := '';
  if not uDM.Parametros.Active then
    uDM.Parametros.Active := True;
  if uDM.Parametros.FindKey([idParam]) then Result := uDM.ParametrosValor.AsString;

end;


procedure TuDM.EtqItensCalcFields(DataSet: TDataSet);
begin
  EtqItensZC_Descricao.AsString := '';
  if Itens.FindKey([EtqItensTpProd.AsInteger,EtqItensCodProd.AsInteger]) then
    EtqItensZC_Descricao.AsString := stringReplace(ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
  EtqItensZC_DataHora.AsString := '';
  if uDM.Pedidos.FindKey([EtqItensNumero.AsInteger]) then
    EtqItensZC_DataHora.AsString := uDM.PedidosData.AsString;
  EtqItensZC_NroLcto.AsString := EtqItensNumero.AsString + '/' + EtqItensNrLcto.AsString;

end;

procedure TuDM.ItensCalcFields(DataSet: TDataSet);
begin
  if uDM = Nil then Exit;
  if not uDM.Itens.Active then Exit;
  if (uDM.ItensGrupo.AsInteger > 0) and (uDM.ItensGrupo.AsInteger < 5)
     then uDM.ItensZC_Grupo.AsString := xGrupos[uDM.ItensGrupo.AsInteger]
     else uDM.ItensZC_Grupo.AsString := '(' + uDM.ItensGrupo.AsString + ')';
  uDM.ItensZC_Key.AsString := uDM.ItensGrupo.AsString + uDM.ItensCodigo.AsString;
  if uDM.ItensAlteraPreco.AsBoolean then uDM.ItensZC_AltPreco.AsString := 'P'
  else uDM.ItensZC_AltPreco.AsString := '';

end;

procedure TuDM.LctCaixaCalcFields(DataSet: TDataSet);
begin
  if (uDM.LctCaixaOperacao.AsInteger >= 0) and (uDM.LctCaixaOperacao.AsInteger <= 4)
     then uDM.LctCaixaZC_Operacao.AsString := xOperacao[uDM.LctCaixaOperacao.AsInteger]
     else uDM.LctCaixaZC_Operacao.AsString := '(' + uDM.LctCaixaOperacao.AsString + ')';

  if (uDM.LctCaixaMeioPgt.AsInteger >= 0) and (uDM.LctCaixaMeioPgt.AsInteger <= 5)
     then uDM.LctCaixaZC_MeioPgt.AsString := xMeioPgt[uDM.LctCaixaMeioPgt.AsInteger]
     else uDM.LctCaixaZC_MeioPgt.AsString := '(' + uDM.LctCaixaMeioPgt.AsString + ')';
  uDM.LctCaixaZC_DtHr.AsString := Copy(uDM.LctCaixaDtHrLcto.AsString,9,2) + '/' +
                                  Copy(uDM.LctCaixaDtHrLcto.AsString,6,2) + '/' +
                                  Copy(uDM.LctCaixaDtHrLcto.AsString,3,2) + ' ' +
                                  Copy(uDM.LctCaixaDtHrLcto.AsString,12,5);
  uDM.LctCaixaZC_Reais.AsString  := '';
  uDM.LctCaixaZC_CDeb.AsString   := '';
  uDM.LctCaixaZC_CCred.AsString  := '';
  uDM.LctCaixaZC_PIX.AsString    := '';
  uDM.LctCaixaZC_Outros.AsString := '';
  if uDM.LctCaixaPgtReais.AsCurrency > 0 then
    uDM.LctCaixaZC_Reais.AsString  := FloatToStrF(uDM.LctCaixaPgtReais.AsCurrency,ffNumber,15,2);
  if uDM.LctCaixaPgtCDeb.AsCurrency > 0 then
    uDM.LctCaixaZC_CDeb.AsString   := FloatToStrF(uDM.LctCaixaPgtCDeb.AsCurrency,ffNumber,15,2);
  if uDM.LctCaixaPgtCCred.AsCurrency > 0 then
    uDM.LctCaixaZC_CCred.AsString  := FloatToStrF(uDM.LctCaixaPgtCCred.AsCurrency,ffNumber,15,2);
  if uDM.LctCaixaPgtPIX.AsCurrency > 0 then
    uDM.LctCaixaZC_PIX.AsString    := FloatToStrF(uDM.LctCaixaPgtPIX.AsCurrency,ffNumber,15,2);
  if uDM.LctCaixaPgtOutros.AsCurrency > 0 then
    uDM.LctCaixaZC_Outros.AsString := FloatToStrF(uDM.LctCaixaPgtOutros.AsCurrency,ffNumber,15,2);

  uDM.LctCaixaZC_SomaMP.AsCurrency := uDM.LctCaixaPgtReais.AsCurrency +
                                      uDM.LctCaixaPgtCDeb.AsCurrency +
                                      uDM.LctCaixaPgtCCred.AsCurrency +
                                      uDM.LctCaixaPgtPIX.AsCurrency +
                                      uDM.LctCaixaPgtOutros.AsCurrency;

end;

procedure TuDM.PedWrkCalcFields(DataSet: TDataSet);
begin
  if not PedWrk.Active then Exit;
  PedWrkZC_Aviso.AsString := '';
  if (Pos('1',PedWrkExtras.AsString) > 0)
     or (Pos('2',PedWrkExtras.AsString) > 0) then PedWrkZC_Aviso.AsString := 'P';
  PedWrkZC_Extras.AsCurrency := PedWrkVlr01.AsCurrency + PedWrkVlr02.AsCurrency + PedWrkVlr03.AsCurrency;

end;

procedure TuDM.RegCaixaCalcFields(DataSet: TDataSet);
begin
  RegCaixaZC_IniFim.AsString := Copy(RegCaixaDtHrInicio.AsString,1,6) +
                                Copy(RegCaixaDtHrInicio.AsString,9,8) + ' - ' +
                                Copy(RegCaixaDtHrFim.AsString,1,6) +
                                Copy(RegCaixaDtHrFim.AsString,9,8);
  RegCaixaZC_VlrEntradas.AsCurrency := RegCaixaE_Dinheiro.AsCurrency + RegCaixaE_CartaoDebito.AsCurrency +
                                       RegCaixaE_CartaoCredito.AsCurrency + RegCaixaE_PIX.AsCurrency +
                                       RegCaixaE_Outros.AsCurrency + RegCaixaE_Suprimento.AsCurrency;
  RegCaixaZC_QtdEntradas.AsInteger  := RegCaixaQtd_Dinheiro.AsInteger + RegCaixaQtd_CartaoDebito.AsInteger +
                                       RegCaixaQtd_CartaoCredito.AsInteger + RegCaixaQtd_PIX.AsInteger +
                                       RegCaixaQtd_Outros.AsInteger + RegCaixaQtd_Suprimento.AsInteger +
                                       RegCaixaQtd_Misto.AsInteger;
  RegCaixaZC_VlrSaidas.AsCurrency   := RegCaixaS_Saidas.AsCurrency + RegCaixaS_Sangria.AsCurrency;
  RegCaixaZC_QtdSaidas.AsInteger    := RegCaixaQtd_Saidas.AsInteger + RegCaixaQtd_Sangria.AsInteger;

end;

end.
