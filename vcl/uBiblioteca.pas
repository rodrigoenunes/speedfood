unit uBiblioteca;

interface

// Uses System.Generics.Collections;

Type
  TRetorno = Record
    Resultado: Boolean;
    Mensagem: String;
    ArqXML: String;
    IdArqXML: String;
    Chave: String;
    NroSerie: Integer;
    NroNF: Integer;
    ConteudoXML: String;
    DetPags: String;
  End;

  TICMSTot = Record
    vProd: Currency;
    vNF: Currency;
  End;

  Function EmitirNFCeDePV(pCom_Pedido_Numero: Integer; pCom_Imprimir:Boolean): TRetorno;
  Function getValorParametro(pNome: String): String;

implementation

Uses Winapi.Windows, uDados, FireDAC.Comp.Client, System.SysUtils, Xml.XMLDoc,
     Xml.XMLIntf, System.Classes, Vcl.Forms,
     Data.DB, Vcl.Dialogs; // , SysUtils;

Var
  fdqTemp1: TFDQuery;
  vACNFE_HOME, vACNFE_EXE, vACNFE_TMP, vACNFE_PDF, vACNFE_XML,
    vACNFE_OUT: String;
  vEMISSOR_SIS_PESSOA_ID: Integer;
  vxmld: TXMLDocument;
  ICMSTot: TICMSTot;

Procedure setfdqTemp1;
Begin
  if fdqTemp1 <> Nil then
    Exit;

  fdqTemp1:= TFDQuery.Create(uDM);
  fdqTemp1.Connection:= uDM.FDC;

End;

Procedure Zerar_ICMSTot;
Begin
  ICMSTot.vProd:= 0;
  ICMSTot.vNF  := 0;
End;

Procedure CriarTabela_sis_parametros_se_necessario;
Var
  vExists, vCreateTable: String;
Begin
  setfdqTemp1;

  Exit;
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

  If fdqTemp1.IsEmpty Then
    Result:= EmptyStr
  Else
    Result:= fdqTemp1.Fields[0].AsString;

  fdqTemp1.Close;

End;

Function TestarSeValorParametroEstaVazio(pNomeParametro: String; Var pValorParametro: String): TRetorno; Overload;
Begin

  pValorParametro:= getValorParametro(pNomeParametro);
  Result.Resultado:= Not pValorParametro.Trim.IsEmpty;

  if Not Result.Resultado then
  Begin
    Result.Mensagem:= 'Parâmetro ' + pNomeParametro + ' encontra-se não informado ou vazio!';
    Exit;
  End;

End;

Function TestarSeValorParametroEstaVazio(pNomeParametro: String; Var pValorParametro: Integer): TRetorno; Overload;
Var
  iValorParametro: Integer;
  sValorParametro: String;
Begin

  sValorParametro:= getValorParametro(pNomeParametro);
  Result.Resultado:= Not sValorParametro.Trim.IsEmpty;

  if Not Result.Resultado then
  Begin
    Result.Mensagem:= 'Parâmetro ' + pNomeParametro + ' encontra-se não informado ou vazio!';
    Exit;
  End;

  Try
    iValorParametro:= sValorParametro.ToInteger;
  Except
    Result.Mensagem:= 'Parâmetro ' + pNomeParametro + ' possui um valor que não é um nro inteiro!';
    Exit;
  End;

  pValorParametro:= iValorParametro;
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

Function ValidarParametrosNFCe(pCom_Pedido_Numero: Integer): TRetorno;
Var
  sSQL: String;
  vResultSet: TDataSet;
Begin
  Result.Resultado:= False;

  CriarTabela_sis_parametros_se_necessario;

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

  Result:= TestarSeValorParametroEstaVazio('emissor_sis_pessoa_id', vEMISSOR_SIS_PESSOA_ID);
  if Not Result.Resultado then
    Exit;

  // vSIS_PESSOA_ID   emissor_sis_pessoa_id

  {
  Result:= TSVPE_VazioOuDir('ACNFE_OUT', vACNFE_OUT);
  if Not Result.Resultado then
    Exit;
  //
  }

  {
  sSQL:=
    'select 1 ' +
    'from com_pedido ' +
    'where numero = ' + pCom_Pedido_Numero.ToString +
    '  and NrNFCe is null';
  udm.FDC.ExecSQL(sSQL, vResultSet);
  Result.Resultado:= vResultSet.Fields[0].AsInteger = 1;
  Try
    if Not Result.Resultado then
    Begin
      Result.Mensagem:= 'Pedido já faturado!';
      Exit;
    End;
  Finally
    vResultSet.Close;
    vResultSet.Free;
  End;
  }

End;

Function gerarNodosFilhosDeSelect(
  pNodoAvo: IXMLNode;
  pNomePai, pSQL: String;
  pImprimirConteudoTagSeVazia: Boolean = True;
  pds: TDataSet = Nil;
  pIniciarDe: Integer = 0;
  pIniciarAte: Integer = 999
  ): TRetorno;
Var
  // vds: TDataSet;
  vi: Integer;
  vf: TField;
  vNodoPai: IXMLNode;
  vCriouTabela: Boolean;
  vNodeValue: String;
Begin
  Result.Resultado:= False;

  vCriouTabela:= pds = Nil;

  if vCriouTabela then
    vi:= uDados.uDM.FDC.ExecSQL(pSQL, pds);

  if Not pds.IsEmpty then
  Begin
    vNodoPai:= pNodoAvo.AddChild(pNomePai);
    for vf in pds.Fields Do
      If
       (
       Not(vf.AsString.Trim.IsEmpty) or
          (vf.AsString.Trim.IsEmpty and pImprimirConteudoTagSeVazia)
       )
       and
       ( (vf.Index >= pIniciarDe) and (vf.Index <= pIniciarAte) )
        then
      Begin

        if pNomePai = 'ide' then
        Begin
          if vf.FieldName = 'serie' then
            Result.NroSerie:= vf.AsInteger
          Else if vf.FieldName = 'nNF' then
            Result.NroNF:= vf.AsInteger;
        End;

        vNodeValue:= vf.AsString;

        {
        if (vf.FieldName = 'vUnCom') then
        Begin
          if vf.Index < pIniciarDe then
            Continue;
        End;
        }

        if vf.DataType in [ftFloat, ftCurrency, ftBCD, ftExtended, ftFMTBcd] then
          vNodeValue:= vNodeValue.Replace(',', '.');
        vNodoPai.AddChild(vf.FieldName).NodeValue:= vNodeValue;

      End;
  End;

  if vCriouTabela then
  Begin
    pds.Close;
    pds.Free;
    pds:= Nil;
  End;

  Result.Resultado:= True;

End;

Function gerar_tag(pCom_Pedido_Numero: Integer; pinfNFe: IXMLNode; nometag: String): TRetorno;
Var
  sSQL: String;
Begin
  Result.Resultado:= False;

  sSQL:= getValorParametro('SQL_' + nometag).Trim;
  if sSQL.IsEmpty then
  Begin
    Result.Mensagem:=  'Parametro SQL_' + nometag + ' indefinido!';
    Exit;
  End;

  sSQL:= sSQL.Replace(':numero', pCom_Pedido_Numero.ToString );

  Result:= gerarNodosFilhosDeSelect(pinfNFe, nometag, sSQL);

End;


Function geraride(pCom_Pedido_Numero: Integer; pinfNFe: IXMLNode): TRetorno;
Var
  sSQL: String;
Begin
  Result.Resultado:= False;

  sSQL:= getValorParametro('SQL_ide').Trim;
  if sSQL.IsEmpty then
  Begin
    Result.Mensagem:=  'Parametro SQL_ide indefinido!';
    Exit;
  End;

  Result:= gerarNodosFilhosDeSelect(pinfNFe, 'ide', sSQL);

End;


Function gerarenderEmit(pemit: IXMLNode): TRetorno;
Var
  sSQL: String;
Begin
  Result.Resultado:= False;

  sSQL:= getValorParametro('SQL_enderEmit').Trim;
  if sSQL.IsEmpty then
  Begin
    Result.Mensagem:=  'Parametro SQL_enderEmit indefinido!';
    Exit;
  End;

  Result:= gerarNodosFilhosDeSelect(pemit, 'enderEmit', sSQL, False);

End;


Function geraremit(pinfNFe: IXMLNode): TRetorno;
Var
  nemit: IXMLNode;
  sSQL: String;
  vds: TDataSet;
  vi: Integer;
Begin
  Result.Resultado:= False;

  sSQL:= getValorParametro('SQL_emit').Trim;
  if sSQL.IsEmpty then
  Begin
    Result.Mensagem:=  'Parametro SQL_emit indefinido!';
    Exit;
  End;

  nemit:= pinfNFe.AddChild('emit');

  // InputQuery('emit', 'SQL', sSQL);
  vi:= uDados.uDM.FDC.ExecSQL(sSQL, vds);

  nemit.AddChild('CNPJ').NodeValue := vds.FieldByName('CNPJ').AsString;
  nemit.AddChild('xNome').NodeValue:= vds.FieldByName('xNome').AsString;
  nemit.AddChild('xFant').NodeValue:= vds.FieldByName('xFant').AsString;

  Result:= gerarenderEmit( nemit );
  if Not Result.Resultado then
    Exit;

  nemit.AddChild('IE').NodeValue := vds.FieldByName('IE').AsString;
  nemit.AddChild('CRT').NodeValue:= vds.FieldByName('CRT').AsString;

End;

Function gerardest(pCom_Pedido_Numero: Integer; pninfNFe: IXMLNode): TRetorno;
Var
  sSQL: String;
Begin
  Result.Resultado:= False;

  sSQL:= getValorParametro('SQL_dest').Trim;
  if sSQL.IsEmpty then
  Begin
    Result.Mensagem:=  'Parametro SQL_dest indefinido!';
    Exit;
  End;

  {
  sSQL:=
    'select ' + #13#10 +
    '  ( ' + #13#10 +
    '    CASE WHEN CHAR_LENGTH(IFNULL(CPF_CNPJ, '''')) <= 11 THEN ' + #13#10 +
    '      IFNULL(CPF_CNPJ, '''') ' + #13#10 +
    '  ELSE ' + #13#10 +
    '      '''' ' + #13#10 +
    '    END ' + #13#10 +
    '  ) "CPF", ' + #13#10 +
    '  ( ' + #13#10 +
    '    CASE WHEN CHAR_LENGTH(IFNULL(CPF_CNPJ, '''')) > 11 THEN ' + #13#10 +
    '      IFNULL(CPF_CNPJ, '''') ' + #13#10 +
    '  ELSE ' + #13#10 +
    '      '''' ' + #13#10 +
    '    END ' + #13#10 +
    '  ) "CNPJ" ' + #13#10 +
    'from com_pedido ' + #13#10 +
    'where CPF_CNPJ is not null ' + #13#10 +
    '  and numero = :numero';

  InputQuery('', '', sSQL);
  }

  sSQL:= sSQL.Replace(':numero', pCom_Pedido_Numero.ToString);

  Result:= gerarNodosFilhosDeSelect(pninfNFe, 'dest', sSQL, False);

End;


Function gerardetImposto(pdet: IXMLNode; pCSOSN: Integer; Var pds: TDataSet): TRetorno;
Var
  vimposto, vICMS, vCSOSN: IXMLNode;
Begin
  vimposto:= pdet.AddChild('imposto');
  vICMS   := vimposto.AddChild('ICMS');

  // ICMS
  case pCSOSN of
    102:
    Begin
      vCSOSN:= vICMS.AddChild('ICMSSN102');
      vCSOSN.AddChild('orig').NodeValue := 0;
      vCSOSN.AddChild('CSOSN').NodeValue:= pCSOSN;
    End;

    202:
    Begin
      vCSOSN:= vICMS.AddChild('ICMSSN202');
      vCSOSN.AddChild('orig').NodeValue   := 0;
      vCSOSN.AddChild('CSOSN').NodeValue  := pCSOSN;
      vCSOSN.AddChild('modBCST').NodeValue:= 5; // valor
      // vCSOSN.AddChild('pMVAST').NodeValue := 0; // valor
      vCSOSN.AddChild('vBCST').NodeValue  := 0; // 0.7 * valor total do item
      vCSOSN.AddChild('pICMSST').NodeValue:= pds.FieldByName('AliqICMS').AsFloat;
      vCSOSN.AddChild('vICMSST').NodeValue:=
        pds.FieldByName('AliqICMS').AsFloat/100; // * vBCST
    End;

    500:
    Begin
      vCSOSN:= vICMS.AddChild('ICMSSN500');
      vCSOSN.AddChild('orig').NodeValue   := 0;
      vCSOSN.AddChild('CSOSN').NodeValue  := pCSOSN;
      vCSOSN.AddChild('modBCST').NodeValue:= 5; // valor
      // vCSOSN.AddChild('pMVAST').NodeValue := 0; // valor
      vCSOSN.AddChild('vBCST').NodeValue  := 0; // 0.7 * valor total do item
      vCSOSN.AddChild('pICMSST').NodeValue:= pds.FieldByName('AliqICMS').AsFloat;
      vCSOSN.AddChild('vICMSST').NodeValue:=
        pds.FieldByName('AliqICMS').AsFloat/100; // * vBCST
    End;


    // IPI 53
    // PIS e COFINS 49

  end;


{
102 - Trib. Simples Nacional, SEM permissão de crédito
202 - Trib. SImples Nacional, SEM permissão de crédito, COM cobrança ICMS ST
300 - Imune
400 - Não tributado
500 - ICMS cobrado anteriormente....
}


End;

Function gerardet(pCom_Pedido_Numero: Integer; pninfNFe: IXMLNode): TRetorno;
Var
  sSQL: String;
  vds: TDataSet;
  vi: Integer;
  pdet: IXMLNode;
Begin
  Result.Resultado:= False;

  sSQL:= getValorParametro('SQL_det').Trim;
  if sSQL.IsEmpty then
  Begin
    Result.Mensagem:=  'Parametro SQL_det indefinido!';
    Exit;
  End;

  sSQL:= sSQL.Replace(':numero', pCom_Pedido_Numero.ToString);

  vi:= uDados.uDM.FDC.ExecSQL(sSQL, vds);

  if vds.IsEmpty then
  Begin
    Result.Resultado:= False;
    Result.Mensagem:= 'Não foram encontrados itens neste pedido!';
    Exit;
  End;

  Zerar_ICMSTot;

  vds.First;
  while Not vds.Eof do
  Begin
    pdet:= pninfNFe.AddChild('det');
    pdet.Attributes['nItem']:= vds.FieldByName('nItem').AsString;
    Result:= gerarNodosFilhosDeSelect(pdet, 'prod', EmptyStr, True, vds, 0, 14);
    if Not Result.Resultado then
      Break;

    ICMSTot.vProd:= ICMSTot.vProd + vds.FieldByName('vProd').AsCurrency;
    ICMSTot.vNF  := ICMSTot.vNF   + vds.FieldByName('vProd').AsCurrency;

    gerardetImposto(
      pdet,
      vds.FieldByName('CSOSN').AsInteger,
      vds
    );

    vds.Next;
  End;

  vds.Close;
  vds.Free;
  vds:= Nil;


End;

Function gerartot(pninfNFe: IXMLNode): TRetorno;
Var
  vtotal, vICMSTot: IXMLNode;
Begin
  Result.Resultado:= False;

  vtotal:= pninfNFe.AddChild('total');

  vICMSTot:= vtotal.AddChild('ICMSTot');

  vICMSTot.AddChild('vBC').NodeValue         := 0;
  vICMSTot.AddChild('vICMS').NodeValue       := 0;
  vICMSTot.AddChild('vICMSDeson').NodeValue  := 0;
  vICMSTot.AddChild('vFCPUFDest').NodeValue  := 0;
  vICMSTot.AddChild('vICMSUFDest').NodeValue := 0;
  vICMSTot.AddChild('vICMSUFRemet').NodeValue:= 0;
  vICMSTot.AddChild('vFCP').NodeValue        := 0;
  vICMSTot.AddChild('vBCST').NodeValue       := 0;
  vICMSTot.AddChild('vST').NodeValue         := 0;
  vICMSTot.AddChild('vFCPST').NodeValue      := 0;
  vICMSTot.AddChild('vFCPSTRet').NodeValue   := 0;
  vICMSTot.AddChild('vProd').NodeValue       := ICMSTot.vProd;
  vICMSTot.AddChild('vFrete').NodeValue      := 0;
  vICMSTot.AddChild('vSeg').NodeValue        := 0;
  vICMSTot.AddChild('vDesc').NodeValue       := 0;
  vICMSTot.AddChild('vII').NodeValue         := 0;
  vICMSTot.AddChild('vIPI').NodeValue        := 0;
  vICMSTot.AddChild('vIPIDevol').NodeValue   := 0;
  vICMSTot.AddChild('vPIS').NodeValue        := 0;
  vICMSTot.AddChild('vCOFINS').NodeValue     := 0;
  vICMSTot.AddChild('vOutro').NodeValue      := 0;
  vICMSTot.AddChild('vNF').NodeValue         := ICMSTot.vNF;

  Result.Resultado:= True;
End;

Function gerartransp(pninfNFe: IXMLNode): TRetorno;
Var
  vtransp: IXMLNode;
Begin
  Result.Resultado:= False;

  vtransp:= pninfNFe.AddChild('transp');
  vtransp.AddChild('modFrete').NodeValue:= 9;

  Result.Resultado:= True;
End;

Function gerarpag(pCom_Pedido_Numero: Integer; pninfNFe: IXMLNode): TRetorno;
Var
  sSQL: String;
  vpag, vdetPag, vcard: IXMLNode;
  vds: TDataset;
  I: Integer;
Begin
  Result.Resultado:= False;

  sSQL:= getValorParametro('SQL_pag').Trim;
  if sSQL.IsEmpty then
  Begin
    Result.Mensagem:=  'Parametro SQL_pag indefinido!';
    Exit;
  End;

  sSQL:= sSQL.Replace(':numero', pCom_Pedido_Numero.ToString);

  vpag:= pninfNFe.AddChild('pag');

  uDados.uDM.FDC.ExecSQL(sSQL, vds);

  Result.Resultado:= Not vds.IsEmpty;

  vds.First;

  while Not vds.Eof do
  Begin
    vcard:= Nil;
    vdetPag:= vpag.AddChild('detPag');
    for I:= 0 to vds.FieldCount-1 do
    Begin
      if vds.Fields[I].FieldName.Contains('card.') then
      Begin
        if vcard = Nil then
          vcard:= vdetPag.AddChild('card');

        vcard.AddChild( vds.Fields[I].FieldName.Replace('card.', '') ).NodeValue:=
          vds.Fields[I].AsString;

      End
      Else
        vdetPag.AddChild(vds.Fields[I].FieldName).NodeValue:= vds.Fields[I].AsString;
    End;

    {
    Result:= gerarNodosFilhosDeSelect(vpag, 'detPag', sSQL, False, vds);
    if Not Result.Resultado then
      Break;
    }

    vds.Next;
  End;

  If not Result.Resultado Then
    Result.Mensagem:= 'Não foram encontrados valores de pgtos para o pedido';

End;

Function gerarinfAdic(pCom_Pedido_Numero: Integer; pninfNFe: IXMLNode): TRetorno;
Var
  vinfAdic, vobsCont: IXMLNode;
  sinfAdFisco, sSQL: String;
  vds: TDataset;
  I: Integer;
Begin
  Result.Resultado:= False;

  sinfAdFisco:= getValorParametro('infAdFisco').Trim;

  vinfAdic:= pninfNFe.AddChild('infAdic');
  vinfAdic.AddChild('infAdFisco').NodeValue:= sinfAdFisco;

  sSQL:= getValorParametro('SQL_obsCont').Trim;
  if sSQL.IsEmpty then
  Begin
    Result.Mensagem:=  'Parametro SQL_obsCont indefinido!';
    Exit;
  End;

  sSQL:= sSQL.Replace(':numero', pCom_Pedido_Numero.ToString);

  uDados.uDM.FDC.ExecSQL(sSQL, vds);
  vds.First;
  while Not vds.Eof do
  Begin
    vobsCont:= vinfAdic.AddChild('obsCont');
    vobsCont.Attributes['xCampo']:= vds.FieldByName('xCampo').AsString;
    vobsCont.AddChild('xTexto').NodeValue:= vds.FieldByName('xTexto').AsString;
    vds.Next;
  End;
  vds.Close;
  vds.Free;


  Result.Resultado:= True;
End;

Function gerarInfNFe(pCom_Pedido_Numero: Integer; pNFe: IXMLNode): TRetorno;
Var
  ninfNFe: IXMLNode;
  vNroSerie, vNroNF: Integer;
Begin

  ninfNFe:= pNFe.AddChild('infNFe');
  ninfNFe.Attributes['Id']:= '';

  Result:= gerar_tag(pCom_Pedido_Numero, ninfNFe, 'ide');
  If Not Result.Resultado then
    Exit;

  vNroSerie:= Result.NroSerie;
  vNroNF   := Result.NroNF;

  Result:= geraremit(ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result:= gerardest(pCom_Pedido_Numero, ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result:= gerardet(pCom_Pedido_Numero, ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result:= gerartot(ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result:= gerartransp(ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result:= gerarpag(pCom_Pedido_Numero, ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result:= gerarinfAdic(pCom_Pedido_Numero, ninfNFe);
  if Not Result.Resultado then
    Exit;

  Result.NroSerie:= vNroSerie;
  Result.NroNF   := vNroNF;

End;

Function gerarNFe(pCom_Pedido_Numero: Integer): TRetorno;
Var
  nNFe: IXMLNode;
Begin

  if vxmld = Nil then
    vxmld:= TXMLDocument.Create(uDM);

  vxmld.XML.Text:= EmptyStr;
  vxmld.Active  := True;

  nNFe:= vxmld.AddChild('NFe');

  Result:= gerarInfNFe(pCom_Pedido_Numero, nNFe);

End;



Function getGerarArqXML(pCom_Pedido_Numero: Integer): TRetorno;
Begin
  Result:= gerarNFe(pCom_Pedido_Numero);

  if Not Result.Resultado then
    Exit;

  Result.ArqXML:=
    IncludeTrailingPathDelimiter(vACNFE_TMP) +
    pCom_Pedido_Numero.ToString + '.xml';

  Result.ConteudoXML:= vxmld.XML.Text;

  vxmld.XML.SaveToFile(Result.ArqXML);

  vxmld.Active:= False;

End;

procedure ChamarExecutavel(ProgramName : String; Estado: Integer = SW_HIDE);
var
  StartInfo  : TStartupInfo;
  ProcInfo   : TProcessInformation;
  CreateOK   : Boolean;
  // S: String;
begin
  // S:= GetCurrentDir; InputQuery('Info', 'GetCurrentDir', S);
  // S:= ProgramName; InputQuery('Info', 'ProgramName', S);
  { fill with known state }
  FillChar(StartInfo, SizeOf(TStartupInfo),        #0);
  FillChar(ProcInfo,  SizeOf(TProcessInformation), #0);
  StartInfo.cb          := SizeOf(TStartupInfo);
  StartInfo.dwFlags     := STARTF_USESHOWWINDOW;
  StartInfo.wShowWindow := Estado; // SW_MINIMIZE; // SW_HIDE;
  CreateOK := CreateProcess(nil,
                            PWideChar(WideString(ProgramName)),
                            // PChar(ProgramName),
                            nil,
                            nil,
                            False,
                            0, // CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS,
                            nil,
                            nil,
                            StartInfo,
                            ProcInfo);
  { check to see if successful }
  // if CreateOK then
    //may or may not be needed. Usually wait for child processes
    // WaitForSingleObject(ProcInfo.hProcess, INFINITE); // 10000); //
end;

Procedure EmitirNFCeDeArqXML(ArqXML: String; pCom_Imprimir: Boolean; Var Result: TRetorno); // : TRetorno;
Const
  T: Integer = 1200;
Var
  I: Integer;
  ExecComando, sArqSaida: String;
  sl: TStringList;
Begin
  Result.Resultado:= False;

  sArqSaida:= IncludeTrailingPathDelimiter(vACNFE_TMP); // IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP'));
  if Not DirectoryExists(sArqSaida) then
    ForceDirectories(sArqSaida);

  sArqSaida:= sArqSaida + ChangeFileExt( ExtractFileName(ArqXML), '.tef');
  if System.SysUtils.FileExists(sArqSaida) then
    System.SysUtils.DeleteFile(sArqSaida);

  sArqSaida:= ChangeFileExt(sArqSaida, '.txt');

  ExecComando:=
    '"' + vACNFE_EXE + '"' +
    ' /emitirnf ' +
    '"' + ArqXML + '" -as ' +
    '"' + sArqSaida +  '"' +
    ' -nroimp ';

  if pCom_Imprimir then
    ExecComando:= ExecComando + '1'
  Else
    ExecComando:= ExecComando + '0';

  // InputQuery('', '',  ExecComando);

  System.SysUtils.DeleteFile(sArqSaida);

  ChamarExecutavel( ExecComando );

  I:= 0;
  while Not FileExists(sArqSaida) do
  Begin
    Application.ProcessMessages;
    Sleep(100);
    Inc(I);
    if I > T then
      Break;
  End;

  if Not FileExists(sArqSaida) then
  Begin
    Result.Mensagem:= 'Arquivo de saída não encontrado: ' + sArqSaida;
    Exit;
  End;

  sl:= TStringList.Create;
  sl.LoadFromFile(sArqSaida);
  // ShowMessage(ExecComando);
  Result.Mensagem:= sl.Text;
  Result.Resultado:= Copy(Result.Mensagem, 84, 3) = '100';

  if Not Result.Resultado then
    Exit;

  Result.Chave:= Copy(Result.Mensagem, 39, 44);
  Result.IdArqXML:=
    IncludeTrailingPathDelimiter(vACNFE_XML) +
    Result.Chave +
    '-nfe.xml';
  if FileExists(Result.IdArqXML) then
  Begin
    sl.LoadFromFile(Result.IdArqXML);
    Result.ArqXML:= sl.Text;
  End;


End;

Function AtualizarSituacaoPV(pCom_Pedido_Numero: Integer; Retorno: TRetorno): TRetorno;
Var
  vAtualizou: Boolean;
  sSQL: String;
Begin
  Result:= Retorno;
  vAtualizou:= False;

  if uDM.Pedidos.Active then
  Begin
    if uDM.Pedidos.Locate('Numero', pCom_Pedido_Numero, []) then
    Begin
      uDM.Pedidos.Edit;
      uDM.Pedidos['SrNFCe']:= Retorno.NroSerie;
      uDM.Pedidos['NrNFCe']:= Retorno.NroNF;

      uDM.Pedidos['ArqXML']:= Retorno.ConteudoXML;    // Retorno.ArqXML;

      uDM.PedidosSitPagto.AsInteger := 1;
      uDM.Pedidos.Post;

      vAtualizou:= True;
    End;
  End;

  if Not vAtualizou then
  Begin
    sSQL:=
      'update com_pedido ' +
      'set SrNFCe = :SrNFCe, ' +
      '    NrNFCe = :NrNFCe, ' +
      '    ArqXML = :ArqXML ' +
      'where numero = :numero ';

    sSQL:= sSQL.Replace(':SrNFCe', Retorno.NroSerie.ToString );
    sSQL:= sSQL.Replace(':NrNFCe', Retorno.NroNF.ToString );
    sSQL:= sSQL.Replace(':ArqXML', Retorno.ConteudoXML.QuotedString  );
    sSQL:= sSQL.Replace(':numero', pCom_Pedido_Numero.ToString );

    uDM.FDC.ExecSQL(sSQL);


  End;

End;


Procedure BuscarDadosTEF(Var Result: TRetorno; pCom_Pedido_Numero: Integer);
Begin
  Result.DetPags:=
    uDM.FDC.ExecSQLScalar(
      'select replace(trim(GROUP_CONCAT(Seq)), '','', '';'') Seqs ' +
      'from com_pedidodetpag ' +
      'where tpintegra = 1 ' +
      '  and numero = ' + pCom_Pedido_Numero.ToString +
      '  order by Seq '
    );
End;

Procedure AtualizarDadosTEF(ArqXML: String; Retorno: TRetorno; pCom_Pedido_Numero: Integer);
Var
  sArqSaida: String;
  slDetPags, slRetorno: TStringList;
  I: Integer;
Begin
  sArqSaida:= IncludeTrailingPathDelimiter(vACNFE_TMP);
  sArqSaida:= sArqSaida + ChangeFileExt( ExtractFileName(ArqXML), '.tef');

  if Not FileExists(sArqSaida) then
    Exit;

  slDetPags:= TStringList.Create;
  slDetPags.Text:= Retorno.DetPags.Replace(';', #13#10);

  slRetorno:= TStringList.Create;
  slRetorno.LoadFromFile(sArqSaida);

  for I:= 0 to slRetorno.Count-1 do
  Begin
    if Trim(slRetorno[I]).IsEmpty then
      Continue;

    uDM.FDC.ExecSQL(
      'UPDATE com_pedidodetpag ' +
      'set cAut      = ' + slRetorno[I].Substring(20, 20).Trim.QuotedString + ', ' +
      '    nrCartao  = ' + slRetorno[I].Substring(60, 20).Trim.QuotedString + ', ' +
      '    nrDocto   = ' + slRetorno[I].Substring(00, 20).Trim.QuotedString + ', ' +
      '    codVenda  = ' + slRetorno[I].Substring(20, 20).Trim.QuotedString + ', ' +
      '    tpIntegra = 2 ' +
      'where numero = ' + pCom_Pedido_Numero.ToString +
      '  and seq    = ' + slDetPags[I]
    );



  End;



End;

Function AtualizarRetornoNFC(pCom_Pedido_Numero: Integer; Retorno: TRetorno): TRetorno;
Var
  vAtualizou: Boolean;
  sSQL: String;
Begin
  Result:= Retorno;
  vAtualizou:= False;

  if uDM.Pedidos.Active then
  Begin
    if uDM.Pedidos.Locate('Numero', pCom_Pedido_Numero, []) then
    Begin
      uDM.Pedidos.Edit;
      uDM.Pedidos['ArqXML']  := Retorno.ArqXML;
      uDM.Pedidos['IdArqXML']:= Retorno.IdArqXML;
      uDM.Pedidos['ChaveNFe']:= Retorno.Chave;
      uDM.Pedidos.Post;

      vAtualizou:= True;
    End;
  End;

  if Not vAtualizou then
  Begin
    sSQL:=
      'update com_pedido ' +
      'set ArqXML   = '':ArqXML'', ' +
      '    IdArqXML = '':IdArqXML'', ' +
      '    ChaveNFe = '':ChaveNFe'' ' +
      'where numero = :numero ';

    sSQL:= sSQL.Replace(':ArqXML', Retorno.ArqXML );
    sSQL:= sSQL.Replace(':IdArqXML', Retorno.IdArqXML);
    sSQL:= sSQL.Replace(':ChaveNFe', Retorno.Chave  );
    sSQL:= sSQL.Replace(':numero', pCom_Pedido_Numero.ToString );

    uDM.FDC.ExecSQL(sSQL);


  End;

End;

Function EmitirNFCeDePV(pCom_Pedido_Numero: Integer; pCom_Imprimir: Boolean): TRetorno;
Var
  vNroSerie, vNroNF: Integer;
  vDataXML, vArqXML, vDetPags: String;
Begin
  Result:= ValidarParametrosNFCe(pCom_Pedido_Numero);

  if Not Result.Resultado then
    Exit;

  Result:= getGerarArqXML(pCom_Pedido_Numero);

  if Not Result.Resultado then
    Exit;

  vNroSerie:= Result.NroSerie;
  vNroNF   := Result.NroNF;
  vDataXML := Result.ConteudoXML;

  AtualizarSituacaoPV(pCom_Pedido_Numero, Result);

  BuscarDadosTEF(Result, pCom_Pedido_Numero);

  vDetPags:= Result.DetPags;
  vArqXML:= Result.ArqXML;
  EmitirNFCeDeArqXML(Result.ArqXML, pCom_Imprimir, Result);

  Result.DetPags:= vDetPags;
  AtualizarDadosTEF(vArqXML, Result, pCom_Pedido_Numero);

  // Aq se deve puxar os dados do detpag
  // Caso tiver pgtos TEF ok, estes devem ser atualizados na tabela
  // Mudar o select de detpags para q, caso o mesmo esteja como pago,
  //       o tpIntegra deverá ser igual a 2 para nao mais ser cobrado

  if Not Result.Resultado then
    Exit;

  Result.NroSerie   := vNroSerie;
  Result.NroNF      := vNroNF;
  Result.ConteudoXML:= vDataXML;

  AtualizarRetornoNFC(pCom_Pedido_Numero, Result);

End;

end.
