unit uBiblioteca;

interface

Type
  TRetorno = Record
    Resultado: Boolean;
    Mensagem: String;
  End;

  Function EmitirNFCeDePV(pSis_Pessoa_id, pCom_Pedido_Numero: Integer): TRetorno;

implementation

Uses uDados, FireDAC.Comp.Client, System.SysUtils, Xml.XMLDoc, Xml.XMLIntf,
     Data.DB, Vcl.Dialogs;

Var
  fdqTemp1: TFDQuery;
  vACNFE_HOME, vACNFE_EXE, vACNFE_TMP, vACNFE_PDF, vACNFE_XML, vACNFE_OUT: String;
  vxmld: TXMLDocument;

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

Function TSVPE_VazioOuDir(pNomeParametro: String; Var pValorParametro: String): TRetorno;
Begin
  Result:= TestarSeValorParametroEstaVazio(pNomeParametro, pValorParametro);

  if Not Result.Resultado then
    Exit;

  Result:= TestarSeValorParametroEhDiretorioExistente(pNomeParametro, pValorParametro);

End;

Function TSVPE_VazioOuArq(pNomeParametro: String; Var pValorParametro: String): TRetorno;
Begin
  Result:= TestarSeValorParametroEstaVazio(pNomeParametro, pValorParametro);

  if Not Result.Resultado then
    Exit;

  Result:= TestarSeValorParametroEhArquivoExistente(pNomeParametro, pValorParametro);

End;



Function ValidarParametrosNFCe: TRetorno;
Begin
  Result.Resultado:= False;

  // CriarTabela_sis_parametros_se_necessario;

  //
  Result:= TSVPE_VazioOuDir('ACNFE_HOME', vACNFE_HOME);
  if Not Result.Resultado then
    Exit;
  //

  vACNFE_HOME:= IncludeTrailingPathDelimiter(vACNFE_HOME);
  vACNFE_EXE:= vACNFE_HOME + 'acnfe.exe';

  Result:= TSVPE_VazioOuArq('ACNFE_EXE', vACNFE_EXE);
  if Not Result.Resultado then
    Exit;

  //
  Result:= TSVPE_VazioOuDir('ACNFE_TMP', vACNFE_TMP);
  if Not Result.Resultado then
    Exit;
  //

  Result:= TSVPE_VazioOuDir('ACNFE_PDF', vACNFE_PDF);
  if Not Result.Resultado then
    Exit;
  //

  Result:= TSVPE_VazioOuDir('ACNFE_XML', vACNFE_XML);
  if Not Result.Resultado then
    Exit;
  //

  {
  Result:= TSVPE_VazioOuDir('ACNFE_OUT', vACNFE_OUT);
  if Not Result.Resultado then
    Exit;
  //
  }

End;

Function gerarNodosFilhosDeSelect(
  pNodoAvo: IXMLNode;
  pNomePai, pSQL: String;
  pImprimirConteudoTagSeVazia: Boolean = True;
  pds: TDataSet = Nil
  ): TRetorno;
Var
  // vds: TDataSet;
  vi: Integer;
  vf: TField;
  vNodoPai: IXMLNode;
  vCriouTabela: Boolean;
Begin

  vCriouTabela:= pds = Nil;

  if vCriouTabela then
    vi:= uDados.uDM.FDC.ExecSQL(pSQL, pds);

  if Not pds.IsEmpty then
  Begin
    vNodoPai:= pNodoAvo.AddChild(pNomePai);
    for vf in pds.Fields Do
      if
     Not(vf.AsString.Trim.IsEmpty) or
        (vf.AsString.Trim.IsEmpty and pImprimirConteudoTagSeVazia) then
        vNodoPai.AddChild(vf.FieldName).NodeValue:= vf.AsString;
  End;

  if vCriouTabela then
  Begin
    pds.Close;
    pds.Free;
    pds:= Nil;
  End;

End;

Function geraride(pSis_Pessoa_id, pCom_Pedido_Numero: Integer; pinfNFe: IXMLNode): TRetorno;
Var
  sSQL: String;
Begin

  sSQL:=
    'select ' + #13#10 +
    '  substring(ibgecidade, 1, 2) "cUF", ' + #13#10 +
    '  floor(rand()*100000000) "cNF", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''natOp'') "natOp", ' + #13#10 +
    '  65 "mod", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''serie'') "serie",  ' + #13#10 +
    '  ( ' + #13#10 +
    '    select ' + #13#10 +
    '      ifnull( ' + #13#10 +
    '        max(NrNFCe), ' + #13#10 +
    '        (select valor from sis_parametros where nome = ''ultnNF'') ' + #13#10 +
    '    ) + 1 ' + #13#10 +
    '    from com_pedido ' + #13#10 +
    '    where NrNFCe is not null ' + #13#10 +
    '  ) "nNF", ' + #13#10 +
    '  CONCAT(CURDATE(), ''T'', CURTIME(), ifnull((select valor from sis_parametros where nome = ''TZD''), '''')) "dhEmi", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''tpNF'') "tpNF", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''idDest'') "idDest",' + #13#10 +
    '  ibgecidade "cMunFG", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''tpImp'') "tpImp", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''tpEmis'') "tpEmis", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''tpAmb'') "tpAmb", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''finNFe'') "finNFe", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''indFinal'') "indFinal", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''indPres'') "indPres", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''indIntermed'') "indIntermed", ' + #13#10 +
    '  (select valor from sis_parametros where nome = ''procEmi'') "procEmi" ' + #13#10 +
    'from sis_pessoa ' + #13#10 +
    'where id = (select valor from sis_parametros where nome = ''emissor_sis_pessoa_id'')';

  Result:= gerarNodosFilhosDeSelect(pinfNFe, 'ide', sSQL);

End;


Function gerarenderEmit(pemit: IXMLNode): TRetorno;
Var
  sSQL: String;
Begin

  sSQL:=
    'select ' +
    '  logradouro "xLgr", ' +
    '  nro, ' +
    '  complemento "xCompl", ' +
    '  bairro "xBairro", ' +
    '  ibgecidade "cMun", ' +
    '  cidade "xMun", ' +
    '  uf "UF", ' +
    '  cep "CEP", ' +
    '  telefone "fone" ' +
    'from sis_pessoa ' +
    'where id = (select valor from sis_parametros where nome = ''emissor_sis_pessoa_id'') ';

  Result:= gerarNodosFilhosDeSelect(pemit, 'enderemit', sSQL);

End;


Function geraremit(pinfNFe: IXMLNode): TRetorno;
Var
  nemit: IXMLNode;
  sSQL: String;
  vds: TDataSet;
  vi: Integer;
Begin

  nemit:= pinfNFe.AddChild('emit');

  sSQL:=
    'select ' +
    '  cnpj "CNPJ", ' +
    '  nome "xNome", ' +
    '  fantasia "xFant", ' +
    '  IE "IE", ' +
    '  (select valor from sis_parametros where nome = ''CRT'') "CRT" ' +
    'from sis_pessoa ' +
    'where id = (select valor from sis_parametros where nome = ''emissor_sis_pessoa_id'') ';

  vi:= uDados.uDM.FDC.ExecSQL(sSQL, vds);

  nemit.AddChild('CNPJ').NodeValue := vds.FieldByName('CNPJ').AsString;
  nemit.AddChild('xNome').NodeValue:= vds.FieldByName('xNome').AsString;
  nemit.AddChild('xFant').NodeValue:= vds.FieldByName('xFant').AsString;

  Result:= gerarenderEmit( nemit );
  if Not Result.Resultado then
    Exit;

End;


Function gerardest(pCom_Pedido_Numero: Integer; pninfNFe: IXMLNode): TRetorno;
Var
  sSQL: String;
Begin

  sSQL:=
    'select ' +
    '  ( ' +
    '    CASE WHEN CHAR_LENGTH(IFNULL(CPF_CNPJ, '''')) <= 11 THEN ' +
    '      IFNULL(CPF_CNPJ, '''') ' +
    '  ELSE ' +
    '      '''' ' +
    '    END ' +
    '  ) "CPF", ' +
    '  ( ' +
    '    CASE WHEN CHAR_LENGTH(IFNULL(CPF_CNPJ, '''')) > 11 THEN ' +
    '      IFNULL(CPF_CNPJ, '''') ' +
    '  ELSE ' +
    '      '''' ' +
    '    END ' +
    '  ) "CNPJ" ' +
    'from com_pedido ' +
    'where CPF_CNPJ is not null ' +
    '  and numero = ' + pCom_Pedido_Numero.ToString;


  Result:= gerarNodosFilhosDeSelect(pninfNFe, 'dest', sSQL, False);

End;


Function gerardet(pCom_Pedido_Numero: Integer; pninfNFe: IXMLNode): TRetorno;
Var
  sSQL: String;
  vds: TDataSet;
  vi: Integer;
  pdet: IXMLNode;
Begin

  sSQL:=
    'select ' +
    '  (@row_number := @row_number + 1) "nItem", ' +
    '  i.* ' +
    'from ' +
    '(' +
    'select ' +
    '   CodProd "cProd", ' +
    '   ''SEM GTIN'' as "cEAN", ' +
    '   Descricao "xProd", ' +
    '   NCM "NCM", ' +
    '   CFOP "CFOP", ' +
    '   Unidade "uCom", ' +
    '   Quant "qCom", ' +
    '   VlrUnitario "vUnCom", ' +
    '   VlrTotal "vProd", ' +
    '   ''SEM GTIN'' as "cEANTrib", ' +
    '   Unidade "uTrib",' +
    '   Quant "qTrib", ' +
    '   VlrUnitario "vUnTrib", ' +
    '   1 as "indTot" ' +
    'from com_pedidoitem ' +
    'left join com_itens on com_pedidoitem.CodProd = com_itens.codigo ' +
    'where numero = ' + pCom_Pedido_Numero.ToString + ' ' +
    'order by NrLcto ' +
    ') as i ' +
    'inner join (SELECT @row_number := 0) rn on 1=1 ';

  vi:= uDados.uDM.FDC.ExecSQL(sSQL, vds);

  if vds.IsEmpty then
  Begin
    Result.Resultado:= False;
    Result.Mensagem:= 'Não foram encontrados itens neste pedido!';
    Exit;
  End;

  vds.First;
  while Not vds.Eof do
  Begin
    pdet:= pninfNFe.AddChild('det');
    pdet.Attributes['nItem']:= vds.FieldByName('nItem').AsString;
    Result:= gerarNodosFilhosDeSelect(pdet, 'prod', EmptyStr, True, vds);

    if Not Result.Resultado then
      Break;

    vds.Next;
  End;

  vds.Close;
  vds.Free;
  vds:= Nil;


End;

Function gerarInfNFe(pSis_Pessoa_id, pCom_Pedido_Numero: Integer; pNFe: IXMLNode): TRetorno;
Var
  ninfNFe: IXMLNode;
Begin

  ninfNFe:= pNFe.AddChild('infNFe');

  Result:= geraride(pSis_Pessoa_id, pCom_Pedido_Numero, ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result:= geraremit(ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result:= gerardest(pCom_Pedido_Numero, ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result:= gerardet(pCom_Pedido_Numero, ninfNFe);
  if Not Result.Resultado then
    Exit;




End;


Function gerarNFe(pSis_Pessoa_id, pCom_Pedido_Numero: Integer): TRetorno;
Var
  nNFe: IXMLNode;
Begin

  if vxmld = Nil then
    vxmld:= TXMLDocument.Create(uDM);

  vxmld.XML.Text:= EmptyStr;
  vxmld.Active  := True;

  nNFe:= vxmld.AddChild('NFe');

  Result:= gerarInfNFe(pSis_Pessoa_id, pCom_Pedido_Numero, nNFe);



End;



Function getGerarArqXML(pSis_Pessoa_id, pCom_Pedido_Numero: Integer): TRetorno;
Begin
  Result:= gerarNFe(pSis_Pessoa_id, pCom_Pedido_Numero);

  if Not Result.Resultado then
    Exit;

  vxmld.XML.SaveToFile('C:\ACCenter\arqs\nfe\contr\nfe.xml');
  vxmld.Active:= False;


End;

Function EmitirNFCeDePV(pSis_Pessoa_id, pCom_Pedido_Numero: Integer): TRetorno;
Begin
  Result:= ValidarParametrosNFCe;
  if Not Result.Resultado then
    Exit;

  Result:= getGerarArqXML(pSis_Pessoa_id, pCom_Pedido_Numero);
  if Not Result.Resultado then
    Exit;


End;

end.
