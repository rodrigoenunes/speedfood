unit uDados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Expr, Datasnap.DBClient, Dialogs;
  Procedure ContaExtras;
  Procedure CarregaExtras(pCols,pLins: Integer);
  Function CriaAbrePedidoWrk(pNro:Integer): Integer;
  Function CriaResumoVendas: Boolean;
  Function ObtemParametro(idParam:String; retDefault:String = ''): String;
  Procedure ExcluePedido(pNumero:Integer);

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
    Parametros: TFDTable;
    ParametrosNome: TStringField;
    ParametrosDescricao: TStringField;
    ParametrosValor: TStringField;
    Parametrossis_parametroscol: TStringField;
    LctCaixaZC_OpAbrv: TStringField;
    LctCaixaZC_MpAbrv: TStringField;
    PedItensCortado: TShortintField;
    PedItensPrensado: TShortintField;
    PedWrkCortado: TBooleanField;
    PedWrkPrensado: TBooleanField;
    PedidosZC_Impresso: TStringField;
    PedItensZC_Tipo: TStringField;
    PedItensZC_Descricao: TStringField;
    PedItensZC_PedLcto: TStringField;
    PedidosZC_DataHora: TStringField;
    PedItensZC_Impresso: TStringField;
    PedItensZC_Tp: TStringField;
    PedidosZC_MeioPagto: TStringField;
    PedidosZC_MPExtenso: TStringField;
    ItenspMVAST: TFMTBCDField;
    RegCaixaVlrPedidos: TBCDField;
    RegCaixaQtdPedidos: TIntegerField;
    ResVendas: TClientDataSet;
    SResVendas: TDataSource;
    ResVendasTpProd: TSmallintField;
    ResVendasCodProd: TIntegerField;
    ResVendasQuant: TIntegerField;
    ResVendasValor: TCurrencyField;
    ResVendasDescricao: TStringField;
    ResVendasZC_Cod: TStringField;
    ItensCorItem: TStringField;
    ItensZC_Cor: TStringField;
    PedidosPlaca: TStringField;
    PedItensZC_PlacaLcto: TStringField;
    PedItensZC_CodDescr: TStringField;
    Usuarios: TFDTable;
    UsuariosNome: TStringField;
    UsuariosSenha: TStringField;
    PedItensZC_SenhaLst: TStringField;
    PedItensZC_PrensCort: TStringField;
    PedidosZC_Senha: TStringField;
    PedidosLctLanches: TIntegerField;
    PedidosLctBebidas: TIntegerField;
    PedItensTxtMais: TStringField;
    PedItensTxtSem: TStringField;
    PedItensTxtMenos: TStringField;
    PedidosZC_NroLst: TStringField;
    RegCaixaSituacao: TStringField;
    RegCaixaZC_Situacao: TStringField;
    PedDetpag: TFDTable;
    PedDetpagNumero: TIntegerField;
    PedDetpagSeq: TIntegerField;
    PedDetpagindPag: TIntegerField;
    PedDetpagtPag: TStringField;
    PedDetpagValor: TBCDField;
    PedDetpagtpIntegra: TIntegerField;
    PedDetpagCNPJ: TStringField;
    PedDetpagBandeira: TStringField;
    PedDetpagcAut: TStringField;
    PedDetpagnrCartao: TStringField;
    PedDetpagAfiliacao: TStringField;
    PedDetpagNrParcelas: TIntegerField;
    PedDetpagvTroco: TBCDField;
    DSPedDetpag: TDataSource;
    DetpagWrk: TClientDataSet;
    SDetpagWrk: TDataSource;
    DetpagWrkSeq: TSmallintField;
    DetpagWrkValor: TCurrencyField;
    DetpagWrkZC_tPag: TStringField;
    DetpagWrktPag: TStringField;
    PedidosTpIntegra: TIntegerField;
    SisPessoaTefPos: TIntegerField;
    PedidosZC_SitPagto: TStringField;
    PedidosSitPagto: TIntegerField;
    PedidosZC_SitTxt: TStringField;
    PedDetpagnrDocto: TStringField;
    PedDetpagZC_nrCartao: TStringField;
    PedDetpagcodVenda: TStringField;
    PedidosIdArqXML: TStringField;
    PedidosChaveNFe: TStringField;
    PedDetpagSit: TIntegerField;
    PedidosOrigem: TShortintField;
    PedidosZC_Origem: TStringField;
    PedWrkEtqImpressa: TSmallintField;
    PedidosIdEstacao: TStringField;
    PedidosNrEstacao: TShortintField;
    RegCaixaNrCaixa: TIntegerField;
    LctCaixaNrCaixa: TIntegerField;
    ItensEtiqueta: TBooleanField;
    ItensZC_Etiqueta: TStringField;
    procedure ItensCalcFields(DataSet: TDataSet);
    procedure LctCaixaCalcFields(DataSet: TDataSet);
    procedure PedWrkCalcFields(DataSet: TDataSet);
    procedure RegCaixaCalcFields(DataSet: TDataSet);
    procedure PedidosCalcFields(DataSet: TDataSet);
    procedure PedItensCalcFields(DataSet: TDataSet);
    procedure ResVendasCalcFields(DataSet: TDataSet);
    procedure ItensFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure PedidosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure DetpagWrkCalcFields(DataSet: TDataSet);
    procedure PedDetpagCalcFields(DataSet: TDataSet);
    procedure PedDetpagFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure RegCaixaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    pathImagens: String;
    nExtras: Integer;
    wNroPedido: Integer;
    wCodExtra: array[1..2,1..12] of integer;
    wTxtExtra: array[1..2,1..12] of String;
    wVlrExtra: array[1..2,1..12] of Currency;
    wCodExtraTab: array[1..24] of Integer;
    wTxtExtraTab: array[1..24] of String;
    wVlrExtraTab: array[1..24] of Currency;
    usaCorItem: Boolean;
    sysUser,sysCPUId: String;
    sysNumId,sysNrCaixa: Integer;
    sysPedidos,sysBalcao,sysWhats,sysManut,sysAdmin,sysBuffet,
    sysUsuar,sysSefaz,sysHelp,sysHelpArgox,sysTurnos: Boolean;
    sysIdPedidos,sysIdBalcao,sysIdBuffet: String;
    sysEtiquetasPrt,sysPedidosPrt,sysCaixaPrt,sysResumoPrt: String;
    filGrupoItens: Integer;
    meioPgto: Integer;
    nomeClie,CPFCNPJ,nroPlaca: String;
    turnoIni,turnoFin,etqImpress: Integer;
    turnoCorrente: Integer;
    nrInicialPedido: Integer;
    sitPagto: Integer;
    lDebug: Boolean;
    wOperCartoes: Integer;

  end;

var
  uDM: TuDM;
  xGrupos: array[1..49] of String;

const
  xOperacao: array[0..4] of String = ('Saldo','Receb','Suprim','Pagto','Sangria');
  xOperAbrv: array[0..4] of String = ('Sdo',  'Rec',  'Sup',   'Pgt',  'San');
  xMeioPgto: array[0..5] of String = ('R$', 'CDeb','CCred','PIX','Outros','Misto');
  xMeioAbrv: array[0..5] of String = ('R$', 'CDb', 'CCr',  'PIX','Ou',    'Mis');
  xMPExtenso: array[0..5] of String = ('Dinheiro', 'Cart�o d�bito','Cart�o cr�dito',
                                       'PIX', 'Outros', 'Misto');
implementation

Uses IniFiles;

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
    uDM.wTxtExtraTab[k] := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
    uDM.wVlrExtraTab[k] := uDM.ItensPreco.AsCurrency;
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
    PedWrk.FieldDefs.Add('Observ',    ftMemo, 10);      // Coment�rios
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
    PedWrk.FieldDefs.Add('TxtMais',   ftMemo, 10);      // Texto 'MAIS'
    PedWrk.FieldDefs.Add('TxtSem',    ftMemo, 10);      // Texto 'SEM'
    PedWrk.FieldDefs.Add('TxtMenos',  ftMemo, 10);
    PedWrk.FieldDefs.Add('AltPreco',  ftBoolean);
    PedWrk.FieldDefs.Add('Cortado',   ftBoolean);
    PedWrk.FieldDefs.Add('Prensado',  ftBoolean);
    PedWrk.FieldDefs.Add('EtqImpressa', ftSmallint);
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
    //
    DetpagWrk.Active := False;
    DetpagWrk.FieldDefs.Clear;
    DetpagWrk.FieldDefs.Add('Seq',    ftSmallint);
    DetpagWrk.FieldDefs.Add('Valor',  ftCurrency);
    DetpagWrk.FieldDefs.Add('tPag',   ftString, 2);
    DetpagWrk.IndexDefs.Clear;
    DetpagWrk.IndexDefs.Add('','Seq',[ixPrimary,ixUnique]);
    DetpagWrk.CreateDataSet;
    Try
      DetpagWrk.Active := True;
      DetpagWrk.Active := False;
    Except
      Result := 3;
      Exit;
    End;
    //
    PedWrk.Active := True;
    DetpagWrk.Active := True;
    uDM.wNroPedido := pNro;
    uDM.nroPlaca := '';
    uDM.meioPgto := 0;
    uDM.nomeClie := '';
    uDM.CPFCNPJ := '';

  end;

end;


Function CriaResumoVendas: Boolean;
begin
  Result  := True;
  with uDM
  do begin
    ResVendas.Active := False;
    ResVendas.FieldDefs.Clear;
    ResVendas.FieldDefs.Add('TpProd',    ftSmallint);
    ResVendas.FieldDefs.Add('CodProd',   ftInteger);
    ResVendas.FieldDefs.Add('Quant',     ftInteger);
    ResVendas.FieldDefs.Add('Valor',     ftCurrency);
    ResVendas.FieldDefs.Add('Descricao', ftString, 80);
    ResVendas.IndexDefs.Clear;
    ResVendas.IndexDefs.Add('','TpProd;CodProd',[ixPrimary,ixUnique]);
    ResVendas.CreateDataSet;
    Try
      ResVendas.Active := True;
      ResVendas.Active := False;
    Except
      Result := False;
      Exit;
    End;
    ResVendas.Active := True;

  end;

end;


Function ObtemParametro(idParam:String; retDefault:String = ''): String;
begin
  Result := retDefault;
  if not uDM.Parametros.Active then
    uDM.Parametros.Active := True;
  if uDM.Parametros.FindKey([idParam]) then
    Result := uDM.ParametrosValor.AsString
  else MessageDlg('Parametro [' + idParam + '] n�o informado' + #13 +
                  'Default [' + retDefault + ']',mtWarning,[mbOk],0);

end;


Procedure ExcluePedido(pNumero:Integer);
begin
  if not uDM.Pedidos.FindKey([pNumero]) then
     Exit;
  uDM.PedDetpag.First;
  while uDM.PedDetpag.RecordCount > 0 do
    uDM.PedDetpag.Delete;
  uDM.PedItens.First;
  while uDM.PedItens.RecordCount > 0 do
    uDM.PedItens.Delete;
  uDM.Pedidos.Delete;

end;


procedure TuDM.DataModuleCreate(Sender: TObject);
Var
  vIniFile: TIniFile;
  sIniFile, sServer, sPorta: String;
  i: Integer;
begin
  FDC.Connected := False;
  sIniFile := ChangeFileExt(ParamStr(0), '.ini');
  vIniFile := TIniFile.Create(sIniFile);
  if not FileExists(sIniFile) then
  Begin
    vIniFile.WriteString('DB', 'Host', '');
    vIniFile.WriteString('DB', 'Port', '');

    vIniFile.WriteString('Estacao','Nome','');
    vIniFile.WriteInteger('Estacao','Numero',0);
    vIniFile.WriteBool('Estacao','Pedidos',True);
    vIniFile.WriteString('Estacao','IdPedidos','Onibus');
    vIniFile.WriteBool('Estacao','Buffet',False);
    vIniFile.WriteString('Estacao','IdBuffet','Buffet');
    vIniFile.WriteBool('Estacao','Balcao',False);
    vIniFile.WriteString('Estacao','IdBalcao','Balc�o 1');
    vIniFile.WriteBool('Estacao','WhatsApp',False);
    vIniFile.WriteBool('Estacao','Manutencao',False);
    vIniFile.WriteBool('Estacao','Administrativo',False);
    vIniFile.WriteBool('Estacao','Usuario',False);
    vIniFile.WriteBool('Estacao','Help',False);
    vIniFile.WriteBool('Estacao','HelpArgox',False);
    vIniFile.WriteBool('Estacao','VerSefaz',False);
    vIniFile.WriteBool('Estacao','Turnos',False);
    vIniFile.WriteInteger('Estacao','CaixaNro',0);       // Nro caixa a filtrar

    vIniFile.WriteString('Impressoras','Etiquetas','');
    vIniFile.WriteString('Impressoras','Pedidos','');
    vIniFile.WriteString('Impressoras','Caixa','');
    vIniFile.WriteString('Impressoras','Resumo','');

  End;
  sServer := vIniFile.ReadString('DB', 'Host', '').Trim;
  if Not sServer.IsEmpty then
    FDC.Params[ FDC.Params.IndexOfName('server') ]:= 'Server=' + sServer;

  sPorta := vIniFile.ReadString('DB', 'Port', '').Trim;
  if Not sPorta.IsEmpty then
    FDC.Params[ FDC.Params.IndexOfName('port') ]:= 'Port=' + sPorta;

  sysCPUId := vIniFile.ReadString('Estacao','Nome','');
  sysNumId := vIniFile.ReadInteger('Estacao','Numero',0);

  sysPedidos := vIniFile.ReadBool('Estacao','Pedidos',True);
  sysIdPedidos := vIniFile.ReadString('Estacao','IdPedidos','Onibus');

  sysBuffet := vIniFile.ReadBool('Estacao','Buffet',True);
  sysIdBuffet := vIniFile.ReadString('Estacao','IdBuffet','Buffet');

  sysBalcao := vIniFile.ReadBool('Estacao','Balcao',False);
  sysIdBalcao := vIniFile.ReadString('Estacao','IdBalcao','Balc�o 1');

  sysWhats := vIniFile.ReadBool('Estacao','WhatsApp',False);
  sysManut := vIniFile.ReadBool('Estacao','Manutencao',False);
  sysAdmin := vIniFile.ReadBool('Estacao','Administrativo',False);
  sysUsuar := vIniFile.ReadBool('Estacao','Usuario',False);
  sysHelp := vIniFile.ReadBool('Estacao','Help',False);
  sysHelpArgox := vIniFile.ReadBool('Estacao','HelpArgox',False);
  sysSefaz := vIniFile.ReadBool('Estacao','VerSefaz',False);
  sysTurnos := vIniFile.ReadBool('Estacao','Turnos',False);
  sysNrCaixa := vIniFile.ReadInteger('Estacao','CaixaNro',0);
  if sysNrCaixa = 0 then
     sysNrCaixa := sysNumId;
  //
  if (not sysPedidos) and (not sysBalcao) and (not sysBuffet) then
     MessageDlg('Verifique os parametros de inicializa��o, Pedidos/Balcao/Buffet' + #13 +
                'Arquivo: ' + sIniFile,mtWarning,[mbOk],0);
  //
  sysEtiquetasPrt := vIniFile.ReadString('Impressoras','Etiquetas','');
  sysPedidosPrt := vIniFile.ReadString('Impressoras','Pedidos','');
  sysCaixaPrt := vIniFile.ReadString('Impressoras','Caixa','');
  sysResumoPrt := vIniFile.ReadString('Impressoras','Resumo','');
  //
  vIniFile.Free;
  //
  FDC.Connected := True;
  //
  wOperCartoes := 0;
  //
  for i := 1 to Length(xGrupos)
     do xGrupos[i] := '';
  xGrupos[01] := 'Lanches';
  xGrupos[02] := 'Extras lanches';
  xGrupos[03] := 'Bebidas';
  xGrupos[04] := 'B�sicos';
  xGrupos[05] := 'Extras b�sicos';
  xGrupos[06] := 'Diversos';
  xGrupos[11] := 'Crepes';
  xGrupos[12] := 'Sabores crepes';
  xGrupos[15] := 'Buffet';
  xGrupos[21] := 'Quentes';
  xGrupos[22] := 'Extras quentes';
  xGrupos[31] := 'Gelados';
  xGrupos[32] := 'Extras gelados';
  xGrupos[41]  := 'Milkshake';
  //

end;

procedure TuDM.DetpagWrkCalcFields(DataSet: TDataSet);
var ntPag: Integer;
begin
  ntPag := StrToIntDef(uDM.DetpagWrktPag.AsString,0);
  case ntPag of
    1:uDM.DetpagWrkZC_tPag.AsString := 'Dinheiro';        // '01-Dinheiro';
    3:uDM.DetpagWrkZC_tPag.AsString := 'C.Cr�dito';       // '03-C.Cr�dito';
    4:uDM.DetpagWrkZC_tPag.AsString := 'C.D�bito';        // '04-C.D�bito';
    17:uDM.DetpagWrkZC_tPag.AsString := 'PIX';            // '17-PIX';
    99:uDM.DetpagWrkZC_tPag.AsString := 'Outros';         // '99-Outros';
    else uDM.DetpagWrkZC_tPag.AsString := '---';
  end;

end;


procedure TuDM.ItensCalcFields(DataSet: TDataSet);
begin
  if uDM = Nil then Exit;
  if not uDM.Itens.Active then Exit;
  //
  if (uDM.ItensGrupo.AsInteger > 0) and (uDM.ItensGrupo.AsInteger <= Length(xGrupos))
     then uDM.ItensZC_Grupo.AsString := xGrupos[uDM.ItensGrupo.AsInteger]
     else uDM.ItensZC_Grupo.AsString := '(' + uDM.ItensGrupo.AsString + ')';
  //
  uDM.ItensZC_Key.AsString := uDM.ItensGrupo.AsString + uDM.ItensCodigo.AsString;
  if uDM.ItensAlteraPreco.AsBoolean then uDM.ItensZC_AltPreco.AsString := 'P'
  else uDM.ItensZC_AltPreco.AsString := '';
  uDM.ItensZC_Cor.AsString := '';
  if uDM.ItensEtiqueta.AsBoolean then uDM.ItensZC_Etiqueta.AsString := 'P'
  else uDM.ItensZC_Etiqueta.AsString := '';

end;

procedure TuDM.ItensFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if (filGrupoItens = 0) or (uDM.ItensGrupo.AsInteger = filGrupoItens) then
     Accept := True
  else
     Accept := False;

end;

procedure TuDM.LctCaixaCalcFields(DataSet: TDataSet);
begin
  if (uDM.LctCaixaOperacao.AsInteger >= 0) and (uDM.LctCaixaOperacao.AsInteger <= 4)
     then begin
       uDM.LctCaixaZC_Operacao.AsString := xOperacao[uDM.LctCaixaOperacao.AsInteger];
       uDM.LctCaixaZC_OpAbrv.AsString   := xOperAbrv[uDM.LctCaixaOperacao.AsInteger];
     end
     else begin
       uDM.LctCaixaZC_Operacao.AsString := '(' + uDM.LctCaixaOperacao.AsString + ')';
       uDM.LctCaixaZC_OpAbrv.AsString   := '(' + uDM.LctCaixaOperacao.AsString + ')';
     end;
  if (uDM.LctCaixaMeioPgt.AsInteger >= 0) and (uDM.LctCaixaMeioPgt.AsInteger <= 5)
     then begin
       uDM.LctCaixaZC_MeioPgt.AsString := xMeioPgto[uDM.LctCaixaMeioPgt.AsInteger];
       uDM.LctCaixaZC_MpAbrv.AsString  := xMeioAbrv[uDM.LctCaixaMeioPgt.AsInteger];
     end
     else begin
       uDM.LctCaixaZC_MeioPgt.AsString := '(' + uDM.LctCaixaMeioPgt.AsString + ')';
       uDM.LctCaixaZC_MpAbrv.AsString  := '(' + uDM.LctCaixaMeioPgt.AsString + ')';
     end;
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

procedure TuDM.PedDetpagCalcFields(DataSet: TDataSet);
begin
  PedDetpagZC_nrCartao.AsString := Copy(PedDetpagnrCartao.AsString,1,4) + '.' +
                                   Copy(PedDetpagnrCartao.AsString,5,4) + '.' +
                                   Copy(PedDetpagnrCartao.AsString,9,4) + '.' +
                                   Copy(PedDetpagnrCartao.AsString,13,4);
end;

procedure TuDM.PedDetpagFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if (PedDetpagtPag.AsString = '03') or
     (PeddetpagtPag.AsString = '04') then Accept := True;

end;

procedure TuDM.PedidosCalcFields(DataSet: TDataSet);
var xData,nrAux: String;
begin
  nrAux := Copy(FormatFloat('000000',PedidosNumero.AsInteger),4,3);
  if PedidosPlaca.AsString <> '' then
    PedidosZC_Senha.AsString := PedidosPlaca.AsString
  else
    PedidosZC_Senha.AsString := nrAux;   // PedidosNumero.AsString;
  PedidosZC_NroLst.AsString := nrAux;

  case PedidosSitPagto.AsInteger of
    1:begin
        PedidosZC_SitPagto.AsString := 'P';                // Fontname no grid=Wingdings 2  (Pago) Tickado
        PedidosZC_SitTxt.AsString := 'Pago';
    end;
    9:begin
        PedidosZC_SitPagto.AsString := 'O';                // Cancelado
        PedidosZC_SItTxt.AsString := 'Cancelado';
    end
    else begin   // 0,2,3,4,5,6,7,8
       PedidosZC_SitPagto.AsString := '';
       PedidosZC_SitTxt.AsString := 'Pendente';
    end;
  end;

  PedidosZC_Impresso.AsString := '';
  if PedidosEtqImpressas.AsInteger > 0 then
    PedidosZC_Impresso.AsString := 'Impresso';
  xData := PedidosData.AsString;
  PedidosZC_DataHora.AsString := Copy(xData,1,6) + Copy(xData,9,8);
  if (PedidosMeioPagto.AsInteger >= 0) and (PedidosMeioPagto.AsInteger <= 5)
  then begin
    PedidosZC_MeioPagto.AsString := xMeioAbrv[PedidosMeioPagto.AsInteger];
    PedidosZC_MPExtenso.AsString := xMPExtenso[PedidosMeioPagto.AsInteger];
  end
  else begin
    PedidosZC_MeioPagto.AsString := '(' + PedidosMeioPagto.AsString + ')';
    PedidosZC_MPExtenso.AsString := '[  ' + PedidosMeioPagto.AsString + '  ]';
  end;

  case PedidosOrigem.AsInteger of
    0:PedidosZC_Origem.AsString := PedidosIdEstacao.AsString;    // 'Onibus';
    1:PedidosZC_Origem.AsString := Trim(PedidosIdEstacao.AsString) + '-WhatsApp';  // Onibus-WhatsApp
    else PedidosZC_Origem.AsString := '';
  end;

end;

procedure TuDM.PedidosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if PedidosTurno.AsInteger < uDM.turnoIni then Exit;
  if PedidosTurno.AsInteger > uDM.TurnoFin then Exit;
  // uDM.etqImpress 0-N�o impressa  1-Impressa  2-Todas (sem selec�o)
  if uDM.etqImpress <> 2 then
     if uDM.PedidosEtqImpressas.AsInteger <> uDM.etqImpress then Exit;
  // Filtro para a situa��o de pagamento   uDM.sitPagto
  //     0-Pagto pendente  1-Pago  2-Pendentes e Pagos  3-Cancelados  9-Todos (Pend,Pago,Cancelado)
  case uDM.sitPagto of
    0:if PedidosSitPagto.AsInteger <> 0 then              // Somente pendentes
         Exit;
    1:if PedidosSitPagto.AsInteger <> 1 then              // Somente pagos
         Exit;
    2:if (PedidosSitPagto.AsInteger <> 0) and             // Pendentes e Pagos
         (PedidosSitPagto.AsInteger <> 1) then
         Exit;
    3:if PedidosSitPagto.AsInteger <> 9 then              // Somente cancelados
         Exit;
  end;
  //
  Accept := True;

end;

procedure TuDM.PedItensCalcFields(DataSet: TDataSet);
var nrAux: String;
begin
  case PedItensTpProd.AsInteger of
    1:PedItensZC_Tipo.AsString := 'Lan';
    3:PedItensZC_Tipo.AsString := 'Beb';
    4:PedItensZC_Tipo.AsString := 'Mon';
    6:PedItensZC_Tipo.AsString := 'Div';
    else PedItensZC_Tipo.AsString := '';
  end;
  case PedItensTpProd.AsInteger of
    1:PedItensZC_Tp.AsString := 'L';
    3:PedItensZC_Tp.AsString := 'B';
    4:PedItensZC_Tp.AsString := 'M';
    6:PedItensZC_Tp.AsString := 'D';
    else PedItensZC_Tp.AsString := '';
  end;
  PedItensZC_PrensCort.AsString := '';
  if PedItensPrensado.AsInteger <> 0

     then PedItensZC_PrensCort.AsString := '< PRENSADO >     ';
  if PedItensCortado.AsInteger <> 0
     then PedItensZC_PrensCort.AsString := PedItensZC_PrensCort.AsString + '< CORTADO >';
  PedItensZC_PrensCort.AsString := Trim(PedItensZC_PrensCort.AsString);

  if Itens.FindKey([PedItensTpProd.AsInteger,PedItensCodProd.AsInteger]) then
    PedItensZC_Descricao.AsString := stringReplace(ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll])
  else
    PedItensZC_Descricao.AsString := 'Indefinido (' + PedItensCodProd.AsString + ')';
  if PedItensTpProd.AsInteger = 4 then
    PedItensZC_Descricao.AsString := '* * * ' + PedItensZC_Descricao.AsString + ' * * *';

  PedItensZC_CodDescr.AsString := '[ ' + PedItensCodProd.AsString + ' ] ' + PedItensZC_Descricao.AsString;

  if PedItensEtqImpressa.AsInteger <> 0 then
    PedItensZC_Impresso.ASString := 'P'                          // Fontname no grid=Wingdings 2
  else
    PedItensZC_Impresso.AsString := '';

  nrAux := Copy(FormatFloat('000000',PedItensNumero.AsInteger),4,3);
  if (PedItensTpProd.AsInteger = 1) or (PedItensTpProd.AsInteger = 4)
  then begin
    PedItensZC_PedLcto.AsString := nrAux + ' / ' + PedItensNrLcto.AsString +
                                   ' de ' + uDM.PedidosLctLanches.AsString;
    PedItensZC_PlacaLcto.AsString := PedidosPlaca.AsString +  ' / ' + PedItensNrLcto.AsString +
                                   ' de ' + uDM.PedidosLctLanches.AsString;
  end
  else begin
    PedItensZC_PedLcto.AsString := nrAux;
    PedItensZC_PlacaLcto.AsString := PedidosPlaca.AsString
  end;
  if StrToIntDef(PedidosPlaca.AsString,0) <> 0 then
    PedItensZC_SenhaLst.AsString := PedItensZC_PlacaLcto.AsString
  else
    PedItensZC_SenhaLst.AsString := PedItensZC_PedLcto.AsString;

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
  if RegCaixaSituacao.AsString = 'F' then
  begin
    RegCaixaZC_Situacao.AsString := 'Finalizado';
    RegCaixaZC_IniFim.AsString := Copy(RegCaixaDtHrInicio.AsString,1,6) +
                                  Copy(RegCaixaDtHrInicio.AsString,9,8) + ' - ' +
                                  Copy(RegCaixaDtHrFim.AsString,1,6) +
                                  Copy(RegCaixaDtHrFim.AsString,9,8);
  end
  else begin
    RegCaixaZC_Situacao.AsString := 'Aberto';
    RegCaixaZC_IniFim.AsString := Copy(RegCaixaDtHrInicio.AsString,1,6) +
                                  Copy(RegCaixaDtHrInicio.AsString,9,8) + ' - ' +
                                  '......' + '........';
  end;
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

procedure TuDM.RegCaixaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if (uDM.sysNrCaixa = 0) or
     (uDM.RegCaixaNrCaixa.AsInteger = uDM.sysNrCaixa)
    then Accept := True;

end;

procedure TuDM.ResVendasCalcFields(DataSet: TDataSet);
begin
  ResVendasZC_Cod.AsString := ResVendasTpProd.AsString + '.' + ResVendasCodProd.AsString;

end;

end.
