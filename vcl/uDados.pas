unit uDados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, Datasnap.DBClient;
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
    ItensDescricao: TStringField;
    ItensDescrCompleta: TMemoField;
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
    ItensZC_Grupo: TStringField;
    ItensZC_Key: TStringField;
    ItensImagem: TStringField;
    RegCaixa: TFDTable;
    DSRegCaixa: TDataSource;
    RegCaixaSequencia: TIntegerField;
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
    LctCaixa: TFDTable;
    LctCaixaSeqCaixa: TIntegerField;
    LctCaixaDtHrLcto: TDateTimeField;
    LctCaixaOperacao: TIntegerField;
    LctCaixaValor: TBCDField;
    LctCaixaMeioPgt: TIntegerField;
    LctCaixaNrCartao: TStringField;
    LctCaixaSaldo: TBCDField;
    LctCaixaHistorico: TStringField;
    LctCaixaZC_Operacao: TStringField;
    DSLctos: TDataSource;
    LctCaixaZC_MeioPgt: TStringField;
    PedWrk: TClientDataSet;
    PedWrkNumero: TIntegerField;
    PedWrkNrLcto: TSmallintField;
    PedWrkTpProd: TSmallintField;
    PedWrkCodProd: TIntegerField;
    PedWrkDescricao: TStringField;
    PedWrkObserv: TMemoField;
    PedWrkQuant: TSmallintField;
    PedWrkVlrUnit: TCurrencyField;
    PedWrkExtras: TStringField;
    PedWrkVlrExt1: TCurrencyField;
    PedWrkVlrExt2: TCurrencyField;
    PedWrkVlrExt3: TCurrencyField;
    PedWrkVlrExt4: TCurrencyField;
    PedWrkVlrExt5: TCurrencyField;
    PedWrkVlrExt6: TCurrencyField;
    PedWrkVlrExt7: TCurrencyField;
    PedWrkVlrExt8: TCurrencyField;
    PedWrkVlrExt9: TCurrencyField;
    PedWrkVlrExt10: TCurrencyField;
    PedWrkVlrExt11: TCurrencyField;
    PedWrkVlrExt12: TCurrencyField;
    PedWrkVlrTotal: TCurrencyField;
    PedWrkExcluir: TStringField;
    PedWrkTxtExtras: TMemoField;
    PedWrkTxtExclus: TMemoField;
    PedWrkFPagto: TSmallintField;
    PedWrkReais: TCurrencyField;
    PedWrkPIX: TCurrencyField;
    PedWrkCCred: TCurrencyField;
    PedWrkCDeb: TCurrencyField;
    PedWrkOutros: TCurrencyField;
    PedWrkZC_Extra: TStringField;
    PedWrkZC_Exclus: TStringField;
    PedWrkZC_Aviso: TStringField;
    SPedWrk: TDataSource;
    ItensGrupo: TStringField;
    ItensCodigo: TIntegerField;
    procedure ItensCalcFields(DataSet: TDataSet);
    procedure LctCaixaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    pathWork: String;

  end;

var
  uDM: TuDM;

const
  xGrupos: array[1..5] of String = ('Lanches','Extras','Exceções','Bedidas','Diversos');
  xOperacao: array[1..5] of String = ('Saldo','Suprim','Receb','Pagto','Sangria');
  xMeioPgt: array[1..5] of String = ('R$', 'CCred','CDeb','PIX','Outros');

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Function CriaAbrePedidoWrk(pNro:Integer): Integer;
var wTabWrk: String;
begin
  Result  := 0;
  wTabWrk := uDM.pathWork + '\PedidoWrk.XML';
  if FileExists(wTabWrk) then
  Try
    DeleteFile(wTabWrk);
  Except
    Result := 1;
    Exit;
  End;
  with uDM
  do begin
    PedWrk.Active := False;
    PedWrk.FieldDefs.Clear;
    PedWrk.FieldDefs.Add('Numero',    ftInteger);
    PedWrk.FieldDefs.Add('NrLcto',    ftSmallint);
    PedWrk.FieldDefs.Add('TpProd',    ftSmallint);
    PedWrk.FieldDefs.Add('CodProd',   ftInteger);
    PedWrk.FieldDefs.Add('Descricao', ftString, 30);
    PedWrk.FieldDefs.Add('Observ',    ftMemo, 10);      // Comentários
    PedWrk.FieldDefs.Add('Quant',     ftSmallint);
    PedWrk.FieldDefs.Add('VlrUnit',   ftCurrency);
    PedWrk.FieldDefs.Add('Extras',    ftString, 12);
    PedWrk.FieldDefs.Add('VlrExt1',   ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt2',   ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt3',   ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt4',   ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt5',   ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt6',   ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt7',   ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt8',   ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt9',   ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt10',  ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt11',  ftCurrency);
    PedWrk.FieldDefs.Add('VlrExt12',  ftCurrency);
    PedWrk.FieldDefs.Add('VlrTotal',  ftCurrency);
    PedWrk.FieldDefs.Add('Excluir',   ftString, 12);
    PedWrk.FieldDefs.Add('TxtExtras', ftMemo, 10);      // Extras - texto
    PedWrk.FieldDefs.Add('TxtExclus', ftMemo, 10);      // Exckusoes - texto
    PedWrk.FieldDefs.Add('FPagto',    ftSmallint);
    PedWrk.FieldDefs.Add('Reais',     ftCurrency);
    PedWrk.FieldDefs.Add('PIX',       ftCurrency);
    PedWrk.FieldDefs.Add('CCRed',     ftCurrency);
    PedWrk.FieldDefs.Add('CDeb',      ftCurrency);
    PedWrk.FieldDefs.Add('Outros',    ftCurrency);
    PedWrk.IndexDefs.Clear;
    PedWrk.IndexDefs.Add('','NrLcto',[ixPrimary,ixUnique]);
    PedWrk.CreateDataSet;
    Try
      PedWrk.Active := True;
      PedWrk.Append;
      PedWrk.SaveToFile(wTabWrk,dfXMLUTF8);
      PedWrk.Active := False;
    Except
      Result := 2;
      Exit;
    End;
    PedWrk.Active := True;
    //

  end;

end;


procedure TuDM.ItensCalcFields(DataSet: TDataSet);
begin
  if uDM = Nil then Exit;

  if not uDM.Itens.Active then Exit;

  uDM.ItensZC_Key.AsString := uDM.ItensGrupo.AsString + uDM.ItensCodigo.AsString;
  if (uDM.ItensGrupo.AsInteger > 0) and (uDM.ItensGrupo.AsInteger < 6)
     then uDM.ItensZC_Grupo.AsString := xGrupos[uDM.ItensGrupo.AsInteger]
     else uDM.ItensZC_Grupo.AsString := '(' + uDM.ItensGrupo.AsString + ')';

end;

procedure TuDM.LctCaixaCalcFields(DataSet: TDataSet);
begin
  if (uDM.LctCaixaOperacao.AsInteger > 0) and (uDM.LctCaixaOperacao.AsInteger < 6)
     then uDM.LctCaixaZC_Operacao.AsString := xOperacao[uDM.LctCaixaOperacao.AsInteger]
     else uDM.LctCaixaZC_Operacao.AsString := '(' + uDM.LctCaixaOperacao.AsString + ')';

  if (uDM.LctCaixaMeioPgt.AsInteger > 0) and (uDM.LctCaixaMeioPgt.AsInteger < 6)
     then uDM.LctCaixaZC_MeioPgt.AsString := xMeioPgt[uDM.LctCaixaMeioPgt.AsInteger]
     else uDM.LctCaixaZC_MeioPgt.AsString := '';

end;

end.
