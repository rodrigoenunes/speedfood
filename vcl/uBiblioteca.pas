unit uBiblioteca;

interface

Type
  TRetorno = Record
    Resultado: Boolean;
    Mensagem: String;
  End;

  Function EmitirNFCeDePV(pSis_Pessoa_id, pCom_Pedido_Numero: Integer): TRetorno;

implementation

Uses uDados, FireDAC.Comp.Client, System.SysUtils;

Var
  fdqTemp1: TFDQuery;
  vACNFE_HOME, vACNFE_EXE, vACNFE_TMP, vACNFE_PDF, vACNFE_XML, vACNFE_OUT: String;

Procedure setfdqTemp1;
Begin
  if fdqTemp1 <> Nil then
    Exit;

  fdqTemp1:= TFDQuery.Create(uDM);
  fdqTemp1.Connection:= uDM.FDC;

End;


Procedure CriarTabela_sis_parametros_se_necessario;
Var
  vExists, vCreateTable: String;
Begin
  setfdqTemp1;
  fdqTemp1.SQL.Text:=
    'CALL sys.table_exists(''speedfood'', ''sis_parametros'', @exists); ' +
    'SELECT @exists;';
  fdqTemp1.Open;
  vExists:= fdqTemp1.Fields[0].AsString;
  fdqTemp1.Close;

  If Not vExists.Trim.IsEmpty Then
    Exit;

  vCreateTable:=
    'CREATE TABLE `speedfood`.`sis_parametros` ( ' +
    '  `nome` VARCHAR(32) NOT NULL, ' +
    '  `descricao` VARCHAR(120) NULL, ' +
    '  `valor` VARCHAR(999) NULL, ' +
    '  PRIMARY KEY (`nome`)); ';

  fdqTemp1.ExecSQL(vCreateTable)

End;

Function getValorParametro(pNome: String): String;
Begin

  fdqTemp1.Close;
  fdqTemp1.SQL.Text:=
    'select valor ' +
    'from sis_parametros ' +
    'where nome = ' + pNome.QuotedString;
  fdqTemp1.Open;

  Result:= fdqTemp1.Fields[0].AsString;

  fdqTemp1.Close;

End;

Function TestarSeValorParametroEstaVazio(pNomeParametro: String; Var pValorParametro: String): TRetorno;
Begin

  pValorParametro:= getValorParametro(pNomeParametro);
  Result.Resultado:= Not pValorParametro.Trim.IsEmpty;

  if Not Result.Resultado then
  Begin
    Result.Mensagem:= 'Parâmetro ' + pNomeParametro + ' encontra-se não informado ou vazio!';
    Exit;
  End;

End;

Function TestarSeValorParametroEhDiretorioExistente(pNomeParametro: String; pValorParametro: String): TRetorno;
Begin

  Result.Resultado:= DirectoryExists(pValorParametro);

  if Not Result.Resultado then
  Begin
    Result.Mensagem:= 'Parâmetro ' + pNomeParametro + ', com valor ' + pValorParametro.QuotedString +  ' não representa um diretório existente!';
    Exit;
  End;

End;

Function TestarSeValorParametroEhArquivoExistente(pNomeParametro: String; pValorParametro: String): TRetorno;
Begin

  Result.Resultado:= System.SysUtils.FileExists(pValorParametro);

  if Not Result.Resultado then
  Begin
    Result.Mensagem:= 'Parâmetro ' + pNomeParametro + ', com valor ' + pValorParametro.QuotedString +  ' não representa um arquivo existente!';
    Exit;
  End;

End;



Function ValidarParametrosNFCe: TRetorno;
Begin
  Result.Resultado:= False;

  CriarTabela_sis_parametros_se_necessario;

  //
  Result:= TestarSeValorParametroEstaVazio('ACNFE_HOME', vACNFE_HOME);
  if Not Result.Resultado then
    Exit;

  Result:= TestarSeValorParametroEhDiretorioExistente('ACNFE_HOME', vACNFE_HOME);
  if Not Result.Resultado then
    Exit;

  //

  vACNFE_HOME:= IncludeTrailingPathDelimiter(vACNFE_HOME);

  vACNFE_EXE:= vACNFE_HOME + 'acnfe.exe';

  Result:= TestarSeValorParametroEhArquivoExistente('ACNFE_EXE', vACNFE_EXE);
  if Not Result.Resultado then
    Exit;

  //
  Result:= TestarSeValorParametroEstaVazio('ACNFE_TMP', vACNFE_TMP);
  if Not Result.Resultado then
    Exit;

  Result:= TestarSeValorParametroEhDiretorioExistente('ACNFE_TMP', vACNFE_TMP);
  if Not Result.Resultado then
    Exit;

  //

  Result:= TestarSeValorParametroEstaVazio('ACNFE_PDF', vACNFE_PDF);
  if Not Result.Resultado then
    Exit;

  Result:= TestarSeValorParametroEhDiretorioExistente('ACNFE_PDF', vACNFE_PDF);
  if Not Result.Resultado then
    Exit;

  //

  Result:= TestarSeValorParametroEstaVazio('ACNFE_XML', vACNFE_XML);
  if Not Result.Resultado then
    Exit;

  Result:= TestarSeValorParametroEhDiretorioExistente('ACNFE_XML', vACNFE_XML);
  if Not Result.Resultado then
    Exit;

  //

  Result:= TestarSeValorParametroEstaVazio('ACNFE_OUT', vACNFE_OUT);
  if Not Result.Resultado then
    Exit;

  Result:= TestarSeValorParametroEhDiretorioExistente('ACNFE_OUT', vACNFE_OUT);
  if Not Result.Resultado then
    Exit;

  //


End;

Function EmitirNFCeDePV(pSis_Pessoa_id, pCom_Pedido_Numero: Integer): TRetorno;
Begin
  Result:= ValidarParametrosNFCe;

  if Not Result.Resultado then
    Exit;

End;

end.
