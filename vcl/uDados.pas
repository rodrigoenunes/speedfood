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
  Procedure CarregaGrupos;
  Procedure ContaExtras;
  Procedure CarregaExtras(pCols,pLins: Integer);
  Function CriaAbrePedidoWrk(pNro:Integer): Integer;
  Function CriaResumoVendas: Boolean;
  Function ObtemParametro(idParam:String; retDefault:String = ''): String;
  Procedure ExcluePedido(pNumero:Integer);
  //Procedure DefineGuiaPedidos(pLeGrava:String; var pTamFonte:Integer; var pMultiline:Boolean);
  Function CarregaItensCodBarra: Boolean;

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
    ResumoVendas: TClientDataSet;
    SResumoVendas: TDataSource;
    ResumoVendasTpProd: TSmallintField;
    ResumoVendasCodProd: TIntegerField;
    ResumoVendasQuant: TIntegerField;
    ResumoVendasValor: TCurrencyField;
    ResumoVendasDescricao: TStringField;
    ResumoVendasZC_Cod: TStringField;
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
    RegCaixaCaixaSeq: TIntegerField;
    LctCaixaCaixaSeq: TIntegerField;
    LctCaixaLctoSeq: TIntegerField;
    Turnos: TFDTable;
    TurnosNrTurno: TIntegerField;
    TurnosDtHrInicio: TDateTimeField;
    TurnosDtHrFim: TDateTimeField;
    TurnosStatus: TIntegerField;
    TurnosVlr_Reais: TBCDField;
    TurnosVlr_CDeb: TBCDField;
    TurnosVlr_CCred: TBCDField;
    TurnosVlr_PIX: TBCDField;
    TurnosVlr_Outros: TBCDField;
    TurnosQtd_Reais: TIntegerField;
    TurnosQtd_CDeb: TIntegerField;
    TurnosQtd_CCred: TIntegerField;
    TurnosQtd_PIX: TIntegerField;
    TurnosQtd_Outros: TIntegerField;
    DSTurnos: TDataSource;
    RegCaixaTurno: TIntegerField;
    LctCaixaDtHrLcto: TDateTimeField;
    RegCaixaZC_CaixaNrSeq: TStringField;
    TurnosZC_Status: TStringField;
    TurnosZC_Datas: TStringField;
    RegCaixaVlrRecebDiv: TBCDField;
    RegCaixaQtdRecebDiv: TIntegerField;
    PedidosLctCrepes: TIntegerField;
    PedidosLctBuffet: TIntegerField;
    PedidosLctOutros: TIntegerField;
    PedidosLctDiversos: TIntegerField;
    PedItensSeqLcto: TIntegerField;
    PedItensZC_SeqLcto: TStringField;
    PedItensZC_TpEtiq: TStringField;
    PedWrkPeso: TIntegerField;
    PedItensPeso: TIntegerField;
    SCDBufet: TDataSource;
    CDBuffet: TClientDataSet;
    CDBuffetVlrUnit: TCurrencyField;
    CDBuffetPeso: TIntegerField;
    CDBuffetDescr: TStringField;
    CDDiversos: TClientDataSet;
    SCDDiversos: TDataSource;
    CDDiversosCodBarras: TStringField;
    CDDiversosCodGrupo: TIntegerField;
    CDDiversosCodItem: TIntegerField;
    CDDiversosDescr: TStringField;
    CDDiversosUnid: TStringField;
    CDDiversosQuant: TIntegerField;
    CDDiversosVlrUnit: TCurrencyField;
    CDDiversosVlrTotal: TCurrencyField;
    SCDItens: TDataSource;
    CDItens: TClientDataSet;
    CDItensGrupo: TIntegerField;
    CDItensCodigo: TIntegerField;
    CDItensDescricao: TStringField;
    CDItensPreco: TCurrencyField;
    CDItensUnidade: TStringField;
    CDItensCodGrpItem: TStringField;
    CDItensCodBarras: TStringField;
    CDBuffetZC_Valor: TCurrencyField;
    PedDetpagNSU: TStringField;
    PedDetpagCodAutorizacao: TStringField;
    PedDetpagNroReferencia: TStringField;
    PedDetpagDigCartao: TStringField;
    PedDetpagCodBandeira: TStringField;
    PedDetpagAutDataHora: TStringField;
    PedDetpagAutClieArqImpr: TStringField;
    PedDetpagAutEstabArqImpr: TStringField;
    PedDetpagCancDataHora: TStringField;
    PedDetpagCancClieArqImpr: TStringField;
    PedDetpagCancEstabArqImpr: TStringField;
    PedidosLctFrituras: TIntegerField;
    PedDetpagtpPagTela: TIntegerField;
    PedidosParaLevar: TShortintField;
    PedidosLctHamburgueres: TIntegerField;
    PedidosLctDrinks: TIntegerField;
    procedure ItensCalcFields(DataSet: TDataSet);
    procedure LctCaixaCalcFields(DataSet: TDataSet);
    procedure PedWrkCalcFields(DataSet: TDataSet);
    procedure RegCaixaCalcFields(DataSet: TDataSet);
    procedure PedidosCalcFields(DataSet: TDataSet);
    procedure PedItensCalcFields(DataSet: TDataSet);
    procedure ResumoVendasCalcFields(DataSet: TDataSet);
    procedure ItensFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure PedidosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure DetpagWrkCalcFields(DataSet: TDataSet);
    procedure PedDetpagCalcFields(DataSet: TDataSet);
    procedure PedDetpagFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure RegCaixaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure LctCaixaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TurnosCalcFields(DataSet: TDataSet);
    procedure CDBuffetCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    pathImagens: String;
    nExtras: Integer;
    wNroPedido: Integer;
    wCodExtra: array[1..2,1..24] of integer;
    wTxtExtra: array[1..2,1..24] of String;
    wVlrExtra: array[1..2,1..24] of Currency;
    wCodExtraTab: array[1..48] of Integer;
    wTxtExtraTab: array[1..48] of String;
    wVlrExtraTab: array[1..48] of Currency;
    usaCorItem: Boolean;
    sysIniFile,sysUser,sysCPUId{,sysVersao,sysLocal}: String;
    sysNumId,sysNrCaixa,sysCaixaSeq: Integer;
    sysPedidos,sysBalcao,sysWhats,sysManut,sysAdmin,sysBuffet: Boolean;
    sysUsuar,sysSefaz,sysHelp,sysHelpArgox,sysAltLctos,sysCaixaDisp: Boolean;
    sysIdPedidos,sysIdBalcao,sysIdBuffet: String;
    sysEtiquetasPrt,sysPedidosPrt,sysCaixaPrt,sysResumoPrt: String;
    sysIniBalcao,sysAbasFonte: Integer;
    sysAbasMultiline: Boolean;
    sysCtleCaixas,sysCtleTurnos: Boolean;
    sysAtivo: String;
    sysPedePlaca: Boolean;
    sysTefPosIni,sysTefPos: Integer;
    sysImprimePedido,sysImprimeEtiquetaBebidas,sysImprimeEtiquetaLanches,
    sysImprimeEtiquetaCrepes,sysImprimeEtiquetaHamburgueres,
    sysImprimeEtiquetaFrituras,sysImprimeEtiquetaDrinks: Boolean;
    sysColValor,sysBtnNFCe,sysBtnCancel:Boolean;
    sysAbreTurnoCaixa:Boolean;
    balLanches,balBebidas,balCrepes,balFrituras,balHamburgueres,balBufDiv,balDrinks: Boolean;
    filGrupoItens: Integer;
    meioPgto: Integer;
    nomeClie,CPFCNPJ,nroPlaca: String;
    turnoIni,turnoFin,etqImpress: Integer;
    turnoCorrente: Integer;
    nrInicialPedido: Integer;
    sitPagto: Integer;
    lDebug,lConexao: Boolean;
    wOperCartoes: Integer;
    xGrupos: array[1..49] of String;

  end;

var
  uDM: TuDM;

const
  xOperacao: array[0..4] of String = ('Saldo','Receb','Suprim','Pagto','Sangria');
  xOperAbrv: array[0..4] of String = ('Sdo',  'Rec',  'Sup',   'Pgt',  'San');
  xMeioPgto: array[0..6] of String = ('R$', 'CDeb','CCred','PIX','iFood','Misto','Banri');
  xMeioAbrv: array[0..6] of String = ('R$', 'CDb', 'CCr',  'PIX','iFo',    'Mis',  'Ban');
  xMPExtenso: array[0..6] of String = ('Dinheiro',
                                       'Cartão débito',
                                       'Cartão crédito',
                                       'PIX',
                                       'iFood',
                                       'Misto',
                                       'Banricompras');
implementation

Uses IniFiles, uGenericas;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure CarregaGrupos;
var i: Integer;
    xParm: String;
begin
  for i := 1 to Length(uDM.xGrupos) do
    uDM.xGrupos[i] := '';
  xParm := ObtemParametro('LanctoMontarLanche');
  if (xParm = '') or (xParm = 'N') then
  begin
    uDM.xGrupos[4] := 'N';
    uDM.xGrupos[5] := 'N';
  end;
  xParm := ObtemParametro('LanctoCrepes');
  if (xParm = '') or (xParm = 'N') then
  begin
    uDM.xGrupos[11] := 'N';
    uDM.xGrupos[12] := 'N';
  end;
  xParm := ObtemParametro('LanctoBufDiv');
  if (xParm = '') or (xParm = 'N') then
  begin
    uDM.xGrupos[6] := 'N';     // Diversos
    uDM.xGrupos[15] := 'N';    // Buffet sorvetes
  end;
  xParm := ObtemParametro('LanctoFrituras');
  if (xParm = '') or (xParm = 'N') then
  begin
    uDM.xGrupos[21] := 'N';
    uDM.xGrupos[22] := 'N';
  end;
  xParm := ObtemParametro('LanctoHamburgueres');
  if (xParm = '') or (xParm = 'N') then
  begin
    uDM.xGrupos[31] := 'N';
    uDM.xGrupos[32] := 'N';
  end;
  xParm := ObtemParametro('LanctoDrinks');
  if (xParm = '') or (xParm = 'N') then
  begin
    uDM.xGrupos[35] := 'N';
  end;
  xParm := ObtemParametro('LanctoShakes');
  if (xParm = '') or (xParm = 'N') then
  begin
    uDM.xGrupos[41] := 'N';
    uDM.xGrupos[42] := 'N';
  end;
  //
  for i := 1 to Length(uDM.xGrupos) do
    if uDM.xGrupos[i] = '' then
    begin
      xParm := 'Grupo_' + IntToStr(i);
      uDM.xGrupos[i] := ObtemParametro(xParm,'NoMsg');
    end;
  //
  for i := 1 to Length(uDM.xGrupos) do
    if uDM.xGrupos[i] = 'N' then
      uDM.xGrupos[i] := '';

end;


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
  for k := 1 to 48 do
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
    PedWrk.FieldDefs.Add('Observ',    ftMemo, 10);      // Comentários
    PedWrk.FieldDefs.Add('Quant',     ftSmallint);
    PedWrk.FieldDefs.Add('VlrUnit',   ftCurrency);
    PedWrk.FieldDefs.Add('Extras',    ftString, 100);
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
    PedWrk.FieldDefs.Add('Peso',      ftInteger);       // Peso em GRAMAS
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
    CDBuffet.Active := False;
    CDBuffet.FieldDefs.Clear;
    CDBuffet.FieldDefs.Add('Peso',    ftInteger);
    CDBuffet.FieldDefs.Add('VlrUnit', ftCurrency);
    //CDBuffet.FieldDefs.Add('VlrTotal',ftCurrency);
    CDBuffet.FieldDefs.Add('Descr',   ftString, 120);
    CDBuffet.CreateDataSet;
    Try
      CDBuffet.Active := True;
      CDBuffet.Active := False;
    Except
      Result := 4;
      Exit;
    End;
    //
    CDDiversos.Active := False;
    CDDiversos.FieldDefs.Clear;
    CDDiversos.FieldDefs.Add('CodBarras', ftString, 25);
    CDDiversos.FieldDefs.Add('CodGrupo',  ftInteger);
    CDDiversos.FieldDefs.Add('CodItem',   ftInteger);
    CDDiversos.FieldDefs.Add('Descr',     ftString, 80);
    CDDiversos.FieldDefs.Add('Unid',      ftString,5);
    CDDiversos.FieldDefs.Add('Quant',     ftInteger);
    CDDiversos.FieldDefs.Add('VlrUnit',   ftCurrency);
    CDDiversos.FieldDefs.Add('VlrTotal',  ftCurrency);
    CDDiversos.CreateDataSet;
    Try
      CDDiversos.Active := True;
      CDDiversos.Active := False;
    Except
      Result := 5;
      Exit;
    End;
    //
    PedWrk.Active := True;
    DetpagWrk.Active := True;
    CDBuffet.Active := True;
    CDDiversos.Active := True;
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
    ResumoVendas.Active := False;
    ResumoVendas.FieldDefs.Clear;
    ResumoVendas.FieldDefs.Add('TpProd',    ftSmallint);
    ResumoVendas.FieldDefs.Add('CodProd',   ftInteger);
    ResumoVendas.FieldDefs.Add('Quant',     ftInteger);
    ResumoVendas.FieldDefs.Add('Valor',     ftCurrency);
    ResumoVendas.FieldDefs.Add('Descricao', ftString, 80);
    ResumoVendas.IndexDefs.Clear;
    ResumoVendas.IndexDefs.Add('','TpProd;CodProd',[ixPrimary,ixUnique]);
    ResumoVendas.CreateDataSet;
    Try
      ResumoVendas.Active := True;
      ResumoVendas.Active := False;
    Except
      Result := False;
      Exit;
    End;
    ResumoVendas.Active := True;

  end;

end;


Function ObtemParametro(idParam:String; retDefault:String = ''): String;
var lMsg: Boolean;
begin
  lMsg := True;
  if retDefault = 'NoMsg' then
  begin
    retDefault := '';
    lMsg := False;
  end;
  //
  Result := retDefault;
  if not uDM.Parametros.Active then
    uDM.Parametros.Active := True;
  if uDM.Parametros.FindKey([idParam]) then
  begin
    Result := uDM.ParametrosValor.AsString;
    Exit;
  end;
  if lMsg then
    MessageDlg('Parametro [' + idParam + '] não informado' + #13 +
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


{
Procedure DefineGuiaPedidos(pLeGrava:String; var pTamFonte:Integer; var pMultiline:Boolean);
Var
  vIniFile: TIniFile;
  sIniFile: String;
  sServer: String;
  idServer: array [1..2] of String;
  sPorta: String;
  i: Integer;
begin
  sIniFile := ChangeFileExt(ParamStr(0), '.ini');
  vIniFile := TIniFile.Create(sIniFile);
  if pLeGrava = 'L' then
  begin

    Exit;
  end;
end;
}

Function CarregaItensCodBarra: Boolean;
var i: Integer;
    wGrp: array[1..2] of Integer;
    kGrp: Integer;
begin
  Result := False;
  with uDM
  do begin
    CDItens.Active := False;
    CDItens.FieldDefs.Clear;
    CDItens.FieldDefs.Add('CodGrpItem', ftString, 5);
    CDItens.FieldDefs.Add('CodBarras',  ftString, 25);
    CDItens.FieldDefs.Add('Grupo',      ftInteger);
    CDItens.FieldDefs.Add('Codigo',     ftInteger);
    CDItens.FieldDefs.Add('Descricao',  ftString, 80);
    CDItens.FieldDefs.Add('Unidade',    ftString,5);
    CDItens.FieldDefs.Add('Preco',      ftCurrency);
    CDItens.IndexDefs.Clear;
    CDItens.IndexDefs.Add('','CodGrpItem',[ixPrimary,ixUnique]);
    CDItens.IndexDefs.Add('CODIGOBARRAS','CodBarras;CodGrpItem',[]);
    CDItens.IndexDefs.Add('ALFABETICA','Descricao;CodGrpItem',[]);
    CDItens.CreateDataSet;
    Try
      CDItens.Active := True;
    Except
      Exit;
    End;
    //
    wGrp[1] := 3;
    wGrp[2] := 6;
    for i := 1 to Length(wGrp) do
    begin
      kGrp := wGrp[i];
      Itens.FindNearest([kGrp,0]);
      while ItensGrupo.AsInteger = kGrp do
      begin
        CDItens.Append;
        CDItensCodGrpItem.AsString := stringCompleta(ItensGrupo.AsString,'E','0',2) +
                                      stringCompleta(ItensCodigo.AsString,'E','0',3);
        CDItensCodBarras.AsString := ItensCodBarras.AsString;
        CDItensGrupo.AsInteger := ItensGrupo.AsInteger;
        CDItensCodigo.AsInteger := ItensCodigo.AsInteger;
        CDItensDescricao.AsString := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
        ItensDescricao.AsString;
        CDItensUnidade.AsString := ItensUnidade.AsString;
        CDItensPreco.AsCurrency := ItensPreco.AsCurrency;
        Try
          CDItens.Post;
        Except
          ShowMessage('Chave=' + CDItensCodGrpItem.AsString);
          CDItens.Cancel;
        End;
        Itens.Next;
      end;
    end;
  end;
  Result := True;

end;


procedure TuDM.CDBuffetCalcFields(DataSet: TDataSet);
var wVlrUnitar,wVlrVenda,wVlrFinal: Integer;
begin
  wVlrUnitar := Round(CDBuffetVlrUnit.AsCurrency * 100);      // Valor unitario KG
  wVlrVenda := CDBuffetPeso.AsInteger * wVlrUnitar;           // Peso em G (gramas)
  wVlrFinal := Round(wVlrVenda / 1000);                       // Valor da venda ( * 100)
  CDBuffetZC_Valor.AsCurrency := wVlrFinal / 100;             // Valor em reais

end;

procedure TuDM.DataModuleCreate(Sender: TObject);
Var
  vIniFile: TIniFile;
  sServer: String;
  idServer: array [1..2] of String;
  sPorta: String;
  i: Integer;
begin
  FDC.Connected := False;
  sysIniFile := ChangeFileExt(ParamStr(0), '.ini');
  vIniFile := TIniFile.Create(sysIniFile);
  if not FileExists(sysIniFile) then
  Begin
    vIniFile.WriteString('DB', 'Host', '');
    vIniFile.WriteString('DB', 'Port', '');
    vIniFile.WriteString('DB', 'Host2', '');
    vIniFile.WriteString('DB', 'Port2', '');
    vIniFile.WriteString('DB', 'Pwd', 'speed@123');    // ou speedfood

    vIniFile.WriteString('Estacao','Nome','');               // Nome da estação
    vIniFile.WriteInteger('Estacao','Numero',0);             // Nro da estação é o nro do CAIXA
    vIniFile.WriteBool('Estacao','Pedidos',True);            // Pedidos de cachorro quente ? (Onibus)
    vIniFile.WriteString('Estacao','IdPedidos','Onibus');
    vIniFile.WriteBool('Estacao','Buffet',False);
    vIniFile.WriteString('Estacao','IdBuffet','Buffet');
    vIniFile.WriteBool('Estacao','Balcao',False);
    vIniFile.WriteString('Estacao','IdBalcao','Balcão 1');
    vIniFile.WriteInteger('Estacao','IniBalcao',0);          // Pag. inicial (0, 1, 2....)
    vIniFile.WriteBool('Estacao','WhatsApp',False);
    vIniFile.WriteBool('Estacao','Manutencao',False);
    vIniFile.WriteBool('Estacao','Administrativo',False);
    vIniFile.WriteBool('Estacao','Usuario',False);
    vIniFile.WriteBool('Estacao','Help',False);
    vIniFile.WriteBool('Estacao','HelpArgox',False);
    vIniFile.WriteBool('Estacao','VerSefaz',False);
    vIniFile.WriteBool('Estacao','Turnos',False);             // Tratativa de turnos
    vIniFile.WriteBool('Estacao','CaixaAltLctos',False);
    vIniFile.WriteBool('Estacao','CaixaDisponivel',False);
    vIniFile.WriteBool('Estacao','ImprimePedidoBalcao',False);

    vIniFile.WriteString('Estacao','Versao','XXX');
    vIniFile.WriteString('Estacao','TEFPOS','TEF');

    vIniFile.WriteString('Impressoras','Etiquetas','');
    vIniFile.WriteString('Impressoras','Pedidos','');
    vIniFile.WriteString('Impressoras','Caixa','');
    vIniFile.WriteString('Impressoras','Resumo','');

    vIniFile.WriteBool('AbasDisponiveis','Lanches',True);
    vIniFile.WriteBool('AbasDisponiveis','Bebidas',True);
    vIniFile.WriteBool('AbasDisponiveis','Crepes',False);
    vIniFile.WriteBool('AbasDisponiveis','Frituras',False);
    vIniFile.WriteBool('AbasDisponiveis','Hamburgueres',False);
    vIniFile.WriteBool('AbasDisponiveis','Buffet',False);
    vIniFile.WriteBool('AbasDisponiveis','Diversos',True);
    vIniFile.WriteBool('AbasDisponiveis','Drinks',False);

    vIniFile.WriteInteger('AbasPedidos','Fonte',12);
    vIniFile.WriteBool('AbasPedidos','Multiline',False);

    vIniFile.WriteBool('Controle','Caixas',False);
    vIniFile.WriteBool('Controle','Turnos',False);

  End;

  idServer[1] := vIniFile.ReadString('DB', 'Host', '127.0.0.1').Trim;
  idServer[2] := vIniFile.ReadString('DB', 'Host2', '255.255.255.1').Trim;
  sPorta := vIniFile.ReadString('DB', 'Port', '').Trim;

{
  sServer := vIniFile.ReadString('DB', 'Host', '').Trim;
  if Not sServer.IsEmpty then
    FDC.Params[ FDC.Params.IndexOfName('server') ]:= 'Server=' + sServer;
  if Not sPorta.IsEmpty then
    FDC.Params[ FDC.Params.IndexOfName('port') ]:= 'Port=' + sPorta;
}
  sysCPUId := vIniFile.ReadString('Estacao','Nome','');
  sysNumId := vIniFile.ReadInteger('Estacao','Numero',0);
  sysNrCaixa := sysNumId;
  sysAbreTurnoCaixa := vIniFile.ReadBool('Estacao','AbreTurnoCaixa',False);

  sysPedidos := vIniFile.ReadBool('Estacao','Pedidos',True);
  sysIdPedidos := vIniFile.ReadString('Estacao','IdPedidos','Onibus');
  sysBuffet := vIniFile.ReadBool('Estacao','Buffet',True);
  sysIdBuffet := vIniFile.ReadString('Estacao','IdBuffet','Buffet');
  sysBalcao := vIniFile.ReadBool('Estacao','Balcao',False);
  sysIdBalcao := vIniFile.ReadString('Estacao','IdBalcao','Balcão 1');
  sysIniBalcao := vIniFile.ReadInteger('Estacao','IniBalcao',0);

  sysWhats := vIniFile.ReadBool('Estacao','WhatsApp',False);
  sysManut := vIniFile.ReadBool('Estacao','Manutencao',False);
  sysAdmin := vIniFile.ReadBool('Estacao','Administrativo',False);
  sysUsuar := vIniFile.ReadBool('Estacao','Usuario',False);
  sysHelp := vIniFile.ReadBool('Estacao','Help',False);
  sysHelpArgox := vIniFile.ReadBool('Estacao','HelpArgox',False);
  sysSefaz := vIniFile.ReadBool('Estacao','VerSefaz',False);
  sysAltLctos := vIniFile.ReadBool('Estacao','CaixaAltLctos',False);
  sysCaixaDisp := vIniFile.ReadBool('Estacao','CaixaDisponivel',False);

  sysImprimePedido := vIniFile.ReadBool('Estacao','ImprimePedido',False);
  sysImprimeEtiquetaBebidas := vIniFile.ReadBool('Estacao','ImprimeEtiquetaBebidas',False);
  sysImprimeEtiquetaLanches := vIniFile.ReadBool('Estacao','ImprimeEtiquetaLanches',False);
  sysImprimeEtiquetaCrepes := vIniFile.ReadBool('Estacao','ImprimeEtiquetaCrepes',False);
  sysImprimeEtiquetaHamburgueres := vIniFile.ReadBool('Estacao','ImprimeEtiquetaHamburgueres',False);
  sysImprimeEtiquetaFrituras := vIniFile.ReadBool('Estacao','ImprimeEtiquetaFrituras',False);
  sysImprimeEtiquetaDrinks := vIniFile.ReadBool('Estacao','ImprimeEtiquetaDrinks',False);
  sysColValor := vIniFile.ReadBool('Estacao','ColunaValor',False);
  sysBtnNFCe := vIniFile.ReadBool('Estacao','ConsNFCe',False);
  sysBtnCancel := vIniFile.ReadBool('Estacao','ConsCancela',False);

  //
  //sysVersao := AnsiUpperCase(vIniFile.ReadString('Estacao','Versao','XXXX'));
  //sysLocal := AnsiUpperCase(vIniFile.ReadString('Estacao','Local','Onibus'));  xx
  //
  if AnsiUpperCase(vIniFile.ReadString('Estacao','TEFPOS','TEF')) = 'TEF'
     then sysTEFPOSIni := 1              // Integrado
     else sysTEFPOSIni := 2;             // Não integrado
  //
  balLanches := vIniFile.ReadBool('AbasDisponiveis','Lanches',True);
  balBebidas := vIniFile.ReadBool('AbasDisponiveis','Bebidas',True);
  balCrepes := vIniFile.ReadBool('AbasDisponiveis','Crepes',False);
  balFrituras := vIniFile.ReadBool('AbasDisponiveis','Frituras',False);
  balHamburgueres := vIniFile.ReadBool('AbasDisponiveis','Hamburgueres',False);
  balBufDiv := vIniFile.ReadBool('AbasDisponiveis','BuffetDiversos',False);
  balDrinks := vIniFile.ReadBool('AbasDisponiveis','Drinks',False);
  //
{
  if (not sysPedidos) and (not sysBalcao) and (not sysBuffet) then
     MessageDlg('Verifique os parametros de inicialização, Pedidos/Balcao/Buffet' + #13 +
                'Arquivo: ' + sysIniFile,mtWarning,[mbOk],0);
}

  sysEtiquetasPrt := vIniFile.ReadString('Impressoras','Etiquetas','');
  sysPedidosPrt := vIniFile.ReadString('Impressoras','Pedidos','');
  sysCaixaPrt := vIniFile.ReadString('Impressoras','Caixa','');
  sysResumoPrt := vIniFile.ReadString('Impressoras','Resumo','');

  sysAbasFonte := vIniFile.ReadInteger('AbasPedidos','Fonte',12);
  sysAbasMultiLine := vIniFile.ReadBool('AbasPedidos','Multiline',False);

  sysCtleCaixas := vIniFile.ReadBool('Controle','Caixas',False);
  sysCtleTurnos := vIniFile.ReadBool('Controle','Turnos',False);

  vIniFile.Free;
  //
  // Conexão BD
  lConexao := False;
  for i := 1 to 2 do
  begin
    sServer := idServer[i];
    FDC.Params[FDC.Params.IndexOfName('server')]:= 'Server=' + sServer;
    Try
      FDC.Connected := True;
      lConexao := True;
      Break;
    Except
      FDC.Connected := False;
    End;
  end;
  if not lConexao then
  begin
    MessageDlg('Conexão BD impossibilitada' + #13 +
               'Serv#1: ' + idServer[1] + #13 +
               'Serv#2: ' + idServer[2] + #13 +
               'verifique.' + #13 +
               'Aplicação finalizada',mtError,[mbOk],0);
    Halt(0);
  End;
  //
  wOperCartoes := 0;       // Contador de operaçoes com cartões
  //
  RegCaixa.Filtered := True;
  LctCaixa.Filtered := True;

end;

procedure TuDM.DetpagWrkCalcFields(DataSet: TDataSet);
var ntPag: Integer;
begin
  ntPag := StrToIntDef(uDM.DetpagWrktPag.AsString,0);
  case ntPag of
    1:uDM.DetpagWrkZC_tPag.AsString := 'Dinheiro';        // '01-Dinheiro';
    3:uDM.DetpagWrkZC_tPag.AsString := 'C.Crédito';       // '03-C.Crédito';
    4:uDM.DetpagWrkZC_tPag.AsString := 'C.Débito';        // '04-C.Débito';
    17:uDM.DetpagWrkZC_tPag.AsString := 'PIX';            // '17-PIX';
    99:uDM.DetpagWrkZC_tPag.AsString := 'iFood';          // '99-iFood  Outros';
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
  uDM.LctCaixaZC_DtHr.AsString := DataHoraString(uDM.LctCaixaDtHrLcto.AsDateTime, 2, 4);
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

procedure TuDM.LctCaixaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if (uDM.sysNrCaixa = 0) or
     (uDM.LctCaixaNrCaixa.AsInteger = uDM.sysNrCaixa)
    then Accept := True;

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
  if (PedidosMeioPagto.AsInteger >= 0) and (PedidosMeioPagto.AsInteger <= 6)
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
  // uDM.etqImpress 0-Não impressa  1-Impressa  2-Todas (sem selecão)
  if uDM.etqImpress <> 2 then
     if uDM.PedidosEtqImpressas.AsInteger <> uDM.etqImpress then Exit;
  // Filtro para a situação de pagamento   uDM.sitPagto
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
    1:begin
        PedItensZC_Tipo.AsString := 'Lan';
        PedItensZC_Tp.AsString := 'L';
        PedItensZC_TpEtiq.AsString := 'Lanche';
    end;
    3:begin
        PedItensZC_Tipo.AsString := 'Beb';
        PedItensZC_Tp.AsString := 'B';
        PedItensZC_TpEtiq.AsString := 'Bebidas';
    end;
    4:begin
        PedItensZC_Tipo.AsString := 'Mon';
        PedItensZC_Tp.AsString := 'M';
        PedItensZC_TpEtiq.AsString := 'Lanche montado';
    end;
    6:begin
       PedItensZC_Tipo.AsString := 'Div';
       PedItensZC_Tp.AsString := 'D';
       PedItensZC_TpEtiq.AsString := 'Diversos';
    end;
    11:begin
       PedItensZC_Tipo.AsString := 'Crp';
       PedItensZC_Tp.AsString := 'C';
       PedItensZC_TpEtiq.AsString := 'CREPE'
    end;
    15:begin
       PedItensZC_Tipo.AsString := 'BSo';
       PedItensZC_Tp.AsString := 'V';
       PedItensZC_TpEtiq.AsString := 'Buffet'
    end;
    21:begin
       PedItensZC_Tipo.AsString := 'Fri';
       PedItensZC_Tp.AsString := 'F';
       PedItensZC_TpEtiq.AsString := 'FRITURA';
    end;
    31:begin
       PedItensZC_Tipo.AsString := 'Ham';
       PedItensZC_Tp.AsString := 'H';
       PedItensZC_TpEtiq.AsString := 'HAMBURGUER';
    end;
    35:begin
       PedItensZC_Tipo.AsString := 'Drk';
       PedItensZC_Tp.AsString := 'K';
       PedItensZC_TpEtiq.AsString := 'DRINKS';
    end
    else begin
      PedItensZC_Tipo.AsString := '';
      PedItensZC_Tp.AsString := '';
      PedItensZC_TpEtiq.AsString := '';
    end;
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
  if PedItensSeqLcto.AsInteger > 0 then
    PedItensZC_SeqLcto.AsString := PedItensSeqLcto.AsString
  else
    PedItensZC_SeqLcto.AsString := '';

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
    RegCaixaZC_IniFim.AsString := DataHoraString(RegCaixaDtHrInicio.AsDateTime,2,4) + '-' +
                                  DataHoraString(RegCaixaDtHrFim.AsDateTime,2,4);
  end
  else begin
    RegCaixaZC_Situacao.AsString := 'Aberto';
    RegCaixaZC_IniFim.AsString := DataHoraString(RegCaixaDtHrInicio.AsDateTime,2,4) + '- ................';
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

  RegCaixaZC_CaixaNrSeq.AsString    := RegCaixaNrCaixa.AsString + ' / ' + uDM.RegCaixaCaixaSeq.AsString;

end;

procedure TuDM.RegCaixaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if (uDM.sysNrCaixa = 0) or
     (uDM.RegCaixaNrCaixa.AsInteger = uDM.sysNrCaixa)
    then Accept := True;

end;

procedure TuDM.ResumoVendasCalcFields(DataSet: TDataSet);
begin
  ResumoVendasZC_Cod.AsString := ResumoVendasTpProd.AsString + '.' + ResumoVendasCodProd.AsString;

end;

procedure TuDM.TurnosCalcFields(DataSet: TDataSet);
begin
  case TurnosStatus.AsInteger of
    0:begin
        TurnosZC_Status.AsString := 'Aberto';
        TurnosZC_Datas.AsString := DataHoraString(TurnosDtHrInicio.AsDateTime, 2, 4) + ' - ......';
    end;
    1:begin
        TurnosZC_Status.AsString := 'Finalizado';
        TurnosZC_Datas.AsString := DataHoraString(TurnosDtHrInicio.AsDateTime, 2, 4) + ' - '+
                                   DataHoraString(TurnosDtHrFim.AsDateTime, 2, 4);
    end;
    else begin
      TurnosZC_Status.AsString := '>> ' + TurnosStatus.AsString + ' <<';
      TurnosZC_Datas.AsString := DataHoraString(TurnosDtHrInicio.AsDateTime, 2, 4) + ' - '+
                                 DataHoraString(TurnosDtHrFim.AsDateTime, 2, 4);
    end;
  end;
end;

end.
