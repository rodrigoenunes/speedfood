unit uImpressoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, System.UITypes, RLPrinters, uBiblioteca,
  Data.DB, Datasnap.DBClient;
  Procedure ImprimePedido(pNroPedido:Integer; pSys:Boolean = True);
  Procedure ImprimePedidoLst(pNroPedido:Integer);
  Function EmiteNFCe(pNroPedido:Integer;pImprimir:Boolean;var pStatus:Boolean): TRetorno;
  Procedure ImprimeCaixa(pTurno,pCaixa,pCxSeq: Integer);
  Procedure ImprimeResumo(pIni,pFim:String;pVlr:array of Currency; pQtd:array of Integer;
                                           pVlrDoc:array of Currency; pqtdDoc:array of Integer;
                                           pIdCaixa:String);

type
  TFuImpressoes = class(TForm)
    RLCaixa: TRLReport;
    RLCx_Cabec: TRLBand;
    RLDBText2: TRLDBText;
    RLLabEmis: TRLLabel;
    RLDBText3: TRLDBText;
    RLPanel1: TRLPanel;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLCx_Cols: TRLBand;
    RLLabel2: TRLLabel;
    RLCx_Detal: TRLBand;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDbCxHist: TRLDBText;
    RLDbCxVlr: TRLDBText;
    RLLabel3: TRLLabel;
    RLDbCxSdo: TRLDBText;
    RLLabCxSdo: TRLLabel;
    RLLabCxVlr: TRLLabel;
    RLLabel6: TRLLabel;
    RLCx_Sum: TRLBand;
    RLPanel3: TRLPanel;
    RLLabel8: TRLLabel;
    RLDBText9: TRLDBText;
    RLDbCxVlrEnt: TRLDBText;
    RLDbCxQtdEnt: TRLDBText;
    RLDbCxVlrSai: TRLDBText;
    RLDbCxQtdSai: TRLDBText;
    RLLabCxSdoFin: TRLLabel;
    RLDbCxSdoFin: TRLDBText;
    RLLabel7: TRLLabel;
    RLPanel2: TRLPanel;
    RLLabel12: TRLLabel;
    RLPanel4: TRLPanel;
    RLDBResult1: TRLDBResult;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabCxEnt: TRLLabel;
    RLLabCxSai: TRLLabel;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLPanel5: TRLPanel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLLabel22: TRLLabel;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    RLPedido: TRLReport;
    RLPedCab: TRLBand;
    RLPanId: TRLPanel;
    RLDBText33: TRLDBText;
    RLPedColCab: TRLBand;
    RLPedDetal: TRLBand;
    RLPedSum: TRLBand;
    RLPedFoot: TRLBand;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabUnitItem: TRLLabel;
    RLLabTotalItem: TRLLabel;
    RLDBText35: TRLDBText;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLDbDescrItem: TRLDBText;
    RLDbUnitItem: TRLDBText;
    RLDbTotalItem: TRLDBText;
    RLDbPedido: TRLDBText;
    RLDbDataPedido: TRLDBText;
    RLDBText41: TRLDBText;
    RLLabel32: TRLLabel;
    RLMemoItem: TRLMemo;
    RLDbTotalPed: TRLDBText;
    RLDBText43: TRLDBText;
    RLLabel30: TRLLabel;
    RLPanel6: TRLPanel;
    RLDBText44: TRLDBText;
    RLLabel31: TRLLabel;
    RLDBText45: TRLDBText;
    RLResumo: TRLReport;
    RLRes_Cabec: TRLBand;
    RLPanel7: TRLPanel;
    RLDBText46: TRLDBText;
    RLLabel33: TRLLabel;
    RLLabTurnoIni: TRLLabel;
    RLLabTurnoFim: TRLLabel;
    RLRes_Cols: TRLBand;
    RLRes_Detal: TRLBand;
    RLRes_Sum: TRLBand;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabResQtd: TRLLabel;
    RLLabResTotal: TRLLabel;
    RLDBText47: TRLDBText;
    RLDbResDescr: TRLDBText;
    RLDbResQtd: TRLDBText;
    RLDbResTotal: TRLDBText;
    RLDbSenha: TRLDBText;
    RLRes_Footer: TRLBand;
    RLLabel27: TRLLabel;
    RLCx_Footer: TRLBand;
    RLLabId_RLCaixa: TRLLabel;
    RLPanel8: TRLPanel;
    RLLabel39: TRLLabel;
    RLLabReais: TRLLabel;
    RLLabQtdReais: TRLLabel;
    RLLabel40: TRLLabel;
    RLLabCDeb: TRLLabel;
    RLLabQtdCDeb: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabCCred: TRLLabel;
    RLLabQtdCCred: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabPIX: TRLLabel;
    RLLabQtdPIX: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabOutros: TRLLabel;
    RLLabQtdOutros: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabMisto: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabTotal: TRLLabel;
    RLLabQtdMisto: TRLLabel;
    RLLabQtdTotal: TRLLabel;
    RLLabel38: TRLLabel;
    RLAngleLabel1: TRLAngleLabel;
    RLPanel9: TRLPanel;
    RLLabel4: TRLLabel;
    RLLabNFCe: TRLLabel;
    RLLabQtdNFCe: TRLLabel;
    RLLabQtdDocs: TRLLabel;
    RLLabDocs: TRLLabel;
    RLLabel18: TRLLabel;
    RLAngleLabel2: TRLAngleLabel;
    RLLabel5: TRLLabel;
    RLLabTotVlrDocs: TRLLabel;
    RLLabTotQtdDocs: TRLLabel;
    CDPed: TClientDataSet;
    CDPedNumero: TStringField;
    CDPedSenha: TStringField;
    CDPedCliente: TStringField;
    CDPedDataHora: TStringField;
    CDPedMeioPagto: TStringField;
    CDDet: TClientDataSet;
    CDDetDescricao: TStringField;
    SCDDet: TDataSource;
    SCDPed: TDataSource;
    CDPedTotal: TStringField;
    CDDetNrLcto: TStringField;
    CDDetTipo: TStringField;
    CDDetQuant: TStringField;
    CDDetUnitar: TStringField;
    CDDetTotal: TStringField;
    CDDetExtras: TStringField;
    CDDetObserv: TStringField;
    CDDetPrensado: TSmallintField;
    CDDetCortado: TSmallintField;
    RLPedTexto: TRLReport;
    SCDTexto: TDataSource;
    CDTexto: TClientDataSet;
    CDTextoLinha: TStringField;
    RLBandLinha: TRLBand;
    RLLabel11: TRLLabel;
    RLLabCxMov: TRLLabel;
    RLLabPedido: TRLLabel;
    RLLabResumo: TRLLabel;
    RLDbLinha: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabCaixas: TRLLabel;
    RLLabel19: TRLLabel;
    RLRes_Fill: TRLLabel;
    RLCx_Fill: TRLLabel;
    procedure RLCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLPedDetalBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLPedidoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLPedidoAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RLResumoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    lDSImpressao: Boolean;

  end;


var
  FuImpressoes: TFuImpressoes;
  nAltura,tmPagina,nAltLinha: Integer;
  idPrinter: String;
  portaPrt,driverPrt: String;
  indexPrt: Integer;
  tmMax,margEsq,margDir,margTop,margBot,copias: Integer;
  lstAction: String;
  lPreview,lDialog: Boolean;
  nPontos,nDesloc: Integer;

  tamLinha,tamFonte: Integer;
  xNegrito: String;
  negrito: Boolean;

implementation

{$R *.dfm}

uses uDados, uGenericas, uSysPrinters, FortesReportCtle;

{
Function MontaTextoImpressao_Orig: Integer;
var xExtra,txtAux: String;
    i:Integer;
begin
  Result := 0;
  FuImpressoes.RLMemoItem.Lines.Clear;
  FuImpressoes.RLMemoItem.Visible := False;
  if (uDM.PedItensTpProd.AsInteger <> 1) and
     (uDM.PedItensTpProd.AsInteger <> 4) then Exit;
  if uDM.PedItensExtras.AsString = stringFiller('.',24) then Exit;
  xExtra := uDM.PedItensExtras.AsString;

  if uDM.PedItensTpProd.AsInteger= 1 then
  begin
    if Pos('0',xExtra) > 0 then
    begin       // Há indicação SEM
      txtAux := 'SEM ';
      for i := 1 to 24 do
      if xExtra[i] = '0' then
        if uDM.Itens.FindKey([2,i]) then
          txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
      FuImpressoes.RLMemoItem.Lines.Add(txtAux);
    end;
    if (Pos('+',xExtra) > 0) or (Pos('1',xExtra) > 0) or (Pos('2',xExtra) > 0)
    then begin       // Há indicação MAIS
      txtAux := 'MAIS ';
      for i := 1 to 24 do
      if (xExtra[i] = '+') or (xExtra[i] = '1') or (xExtra[i] = '2') then
        if uDM.Itens.FindKey([2,i]) then
          txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
      FuImpressoes.RLMemoItem.Lines.Add(txtAux);
    end;
    if Pos('-',xExtra) > 0 then
    begin       // Há indicação MENOS
      txtAux := 'MENOS ';
      for i := 1 to 24 do
      if xExtra[i] = '-' then
        if uDM.Itens.FindKey([2,i]) then
          txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
        FuImpressoes.RLMemoItem.Lines.Add(txtAux);
    end;
  end
  else begin
    if Pos('+',xExtra) > 0
    then begin       // Há indicação MAIS
      txtAux := 'COM ';
      for i := 1 to 24 do
      if xExtra[i] = '+' then
        if uDM.Itens.FindKey([5,i]) then
          txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
      FuImpressoes.RLMemoItem.Lines.Add(txtAux);
    end;
  end;

  if uDM.PedItensObservacao.AsString <> '' then
    FuImpressoes.RLMemoItem.Lines.Add(uDM.PedItensObservacao.AsString);
  txtAux := '';
  if uDM.PedItensPrensado.AsInteger > 0 then
    txtAux := '     PRENSADO';
  if uDM.PedItensCortado.AsInteger > 0 then
    txtAux := txtAux + '     CORTADO';
  if txtAux <> '' then
    FuImpressoes.RLMemoItem.Lines.Add(txtAux);
  //
  if FuImpressoes.RLMemoItem.Lines.Count > 0
  then begin
    FuImpressoes.RLMemoItem.Visible := True;
    Result := FuImpressoes.RLMemoItem.Lines.Count * 15;
  end;

end;
}

Function MontaTextoImpressao: Integer;
var xExtra,txtAux: String;
    i,nPos:Integer;
const x0DA: char = chr(13); 
begin
  Result := 0;
  FuImpressoes.RLMemoItem.Lines.Clear;
  FuImpressoes.RLMemoItem.Visible := False;
  if (FuImpressoes.CDDetTipo.AsString <> 'L')                  // Lanche
     and (FuImpressoes.CDDetTipo.AsString <> 'M')              // Lanche montado
     and (FuImpressoes.CDDetTipo.AsString <> 'C')              // Crepe
     and (FuImpressoes.CDDetTipo.AsString <> 'F')              // Fritura
     and (FuImpressoes.CDDetTipo.AsString <> 'S')              // Shake / Gelados
     and (FuImpressoes.CDDetTipo.AsString <> 'B')              // Buffet
  then Exit;
  //
  if (FuImpressoes.CDDetTipo.AsString = 'L')                   // Lanche
     or (FuImpressoes.CDDetTipo.AsString = 'M')                // Lanche montado
  then if FuImpressoes.CDDetExtras.AsString = stringFiller('.',24) then
          Exit;
  //
  xExtra := FuImpressoes.CDDetExtras.AsString;
  if FuImpressoes.CDDetTipo.AsString = 'L' then
  begin
    if Pos('0',xExtra) > 0 then
    begin       // Há indicação SEM
      txtAux := 'SEM ';
      for i := 1 to 24 do
      if xExtra[i] = '0' then
        if uDM.Itens.FindKey([2,i]) then
          txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
      FuImpressoes.RLMemoItem.Lines.Add(txtAux);
    end;
    if (Pos('+',xExtra) > 0) or (Pos('1',xExtra) > 0) or (Pos('2',xExtra) > 0)
    then begin       // Há indicação MAIS
      txtAux := 'MAIS ';
      for i := 1 to 24 do
      if (xExtra[i] = '+') or (xExtra[i] = '1') or (xExtra[i] = '2') then
        if uDM.Itens.FindKey([2,i]) then
          txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
      FuImpressoes.RLMemoItem.Lines.Add(txtAux);
    end;
    if Pos('-',xExtra) > 0 then
    begin       // Há indicação MENOS
      txtAux := 'MENOS ';
      for i := 1 to 24 do
      if xExtra[i] = '-' then
        if uDM.Itens.FindKey([2,i]) then
          txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
        FuImpressoes.RLMemoItem.Lines.Add(txtAux);
    end;
  end;
  //
  if FuImpressoes.CDDetTipo.AsString = 'M' then         // Lanche montado
  begin
    if Pos('+',xExtra) > 0 then
    begin       // Há indicação MAIS
      txtAux := 'COM ';
      for i := 1 to 24 do
        if xExtra[i] = '+' then
           if uDM.Itens.FindKey([5,i]) then
             txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
      FuImpressoes.RLMemoItem.Lines.Add(txtAux);
    end;
  end;
  //
  if (FuImpressoes.CDDetTipo.AsString = 'C') or           // Crepes
     (FuImpressoes.CDDetTipo.AsString = 'F') then         // Frituras
  begin
    txtAux := Trim(FuImpressoes.CDDetObserv.AsString);
    nPos := Pos(x0DA,txtAux);
    while nPos > 0 do
    begin
      FuImpressoes.RLMemoItem.Lines.Add(Copy(txtAux,1,nPos-1));
      txtAux := Copy(txtAux,nPos+1,Length(txtAux)-nPos);
      nPos := Pos(x0DA,txtAux);
    end;
    if txtAux <> '' then
       FuImpressoes.RLMemoItem.Lines.Add(txtAux);
  end
  else if FuImpressoes.CDDetObserv.AsString <> '' then
         FuImpressoes.RLMemoItem.Lines.Add(FuImpressoes.CDDetObserv.AsString);
  //
  txtAux := '';
  if FuImpressoes.CDDetPrensado.AsInteger > 0 then
    txtAux := '     PRENSADO';
  if FuImpressoes.CDDetCortado.AsInteger > 0 then
    txtAux := txtAux + '     CORTADO';
  if txtAux <> '' then
    FuImpressoes.RLMemoItem.Lines.Add(txtAux);
  //
  if FuImpressoes.RLMemoItem.Lines.Count > 0
  then begin
    FuImpressoes.RLMemoItem.Visible := True;
    Result := FuImpressoes.RLMemoItem.Lines.Count * 15;
  end;

end;


Function MontaTextoLst: String;
var xExtra,txtSem,txtMais,txtMenos,txtObs: String;
    i:Integer;
begin
  Result := '';
  if (uDM.PedItensTpProd.AsString <> '1')                  // Lanche
     and (uDM.PedItensTpProd.AsString <> '4')              // Lanche montado
  then Exit;
{PedItensTpProd.AsInteger
    1:PedItensZC_Tp.AsString := 'L';
    3:PedItensZC_Tp.AsString := 'B';
    4:PedItensZC_Tp.AsString := 'M';
    6:PedItensZC_Tp.AsString := 'D';
    else PedItensZC_Tp.AsString := '';}
  if uDM.PedItensExtras.AsString = stringFiller('.',24) then Exit;
  //
  xExtra := uDM.PedItensExtras.AsString;
  txtSem := '';
  txtMais := '';
  txtMenos := '';
  txtObs := '';
  if uDM.PedItensTpProd.AsString = 'L' then
  begin
    if Pos('0',xExtra) > 0 then
    begin       // Há indicação SEM
      txtSem := 'SEM ';
      for i := 1 to 24 do
      if xExtra[i] = '0' then
        if uDM.Itens.FindKey([2,i]) then
          txtSem := txtSem + uDM.ItensDescricao.AsString + '; ';
    end;
    if (Pos('+',xExtra) > 0) or (Pos('1',xExtra) > 0) or (Pos('2',xExtra) > 0)
    then begin       // Há indicação MAIS
      txtMais := 'MAIS ';
      for i := 1 to 24 do
      if (xExtra[i] = '+') or (xExtra[i] = '1') or (xExtra[i] = '2') then
        if uDM.Itens.FindKey([2,i]) then
          txtMais := txtMais + uDM.ItensDescricao.AsString + '; ';
    end;
    if Pos('-',xExtra) > 0 then
    begin       // Há indicação MENOS
      txtMenos := 'MENOS ';
      for i := 1 to 24 do
      if xExtra[i] = '-' then
        if uDM.Itens.FindKey([2,i]) then
          txtMenos := txtMenos + uDM.ItensDescricao.AsString + '; ';
    end;
  end
  else begin         // Lanche montado
    if Pos('+',xExtra) > 0
    then begin       // Há indicação MAIS
      txtMais := 'COM ';
      for i := 1 to 24 do
      if xExtra[i] = '+' then
        if uDM.Itens.FindKey([5,i]) then
          txtMais := txtMais + uDM.ItensDescricao.AsString + '; ';
    end;
  end;
  //
  if uDM.PedItensObservacao.AsString <> '' then
    txtObs := uDM.PedItensObservacao.AsString + ';';
  if uDM.PedItensPrensado.AsInteger > 0 then
    txtObs := txtObs + ' <PRENSADO>';
  if uDM.PedItensCortado.AsInteger > 0 then
    txtObs := txtObs + ' <CORTADO>';
  //
  Result := txtSem + ' ' + txtMais + ' ' + txtMenos + ' ' + txtObs;

end;


Function CriaArqTmp: Boolean;
begin
  Result := False;
  with FuImpressoes
  do begin
    if lDSImpressao then
    begin
      Result := True;
      Exit;
    end;
    CDPed.Active := False;
    CDPed.FieldDefs.Add('Numero', ftString, 10);
    CDPed.FieldDefs.Add('Senha', ftString, 10);
    CDPed.FieldDefs.Add('Cliente', ftString, 50);
    CDPed.FieldDefs.Add('DataHora', ftString, 30);
    CDPed.FieldDefs.Add('Total', ftString, 15);
    CDPed.FieldDefs.Add('MeioPagto', ftString, 20);
    CDPed.IndexDefs.Clear;
    CDPed.CreateDataSet;
    Try
      CDPed.Active := True;
      CDPed.Active := False;
    Except
      Exit;
    End;
    //
    CDDet.Active := False;
    CDDet.FieldDefs.Add('NrLcto', ftString, 2);
    CDDet.FieldDefs.Add('Tipo', ftString, 1);
    CDDet.FieldDefs.Add('Quant', ftString, 3);
    CDDet.FieldDefs.Add('Descricao', ftString, 40);
    CDDet.FieldDefs.Add('Unitar', ftString, 12);
    CDDet.FieldDefs.Add('Total', ftString, 12);
    CDDet.FieldDefs.Add('Extras', ftString, 100);
    CDDet.FieldDefs.Add('Observ', ftString, 120);
    CDDet.FieldDefs.Add('Prensado', ftSmallint);
    CDDet.FieldDefs.Add('Cortado', ftSmallint);
    CDDet.IndexDefs.Clear;
    CDDet.CreateDataSet;
    Try
      CDDet.Active := True;
      CDDet.Active := False;
    Except
      Exit;
    End;
    //
    CDTexto.Active := False;
    CDTexto.FieldDefs.Add('Linha', ftString, 120);
    CDTexto.CreateDataSet;
    Try
      CDTexto.Active := True;
      CDTexto.Active := False;
    Except
      Exit;
    End;

    lDSImpressao := True;
    Result := True;
  end;

end;

Procedure ImprimePedidoLst(pNroPedido:Integer);
var lstPedido: TStringList;
    xQuant,xDescr,xUnit,xTotal: String;
    meiaLinha,tamDescr,nTam,i: Integer;
    arqPedidoTxt: String;
begin
  FuImpressoes := TFuImpressoes.Create(nil);
  if not CriaArqTmp
  then begin
    MessageDlg('Erro criação ArqTmp',mtError,[mbOk],0);
    FuImpressoes.Free;
    Exit;
  end;
  DebugMensagem(uDM.lDebug,'Localizando pedido nr:' + IntToStr(pNroPedido));
  if not uDM.Pedidos.FindKey([pNroPedido])
  then begin
    FuImpressoes.Free;
    Exit;
  end;
  DebugMensagem(uDM.lDebug,'Achou o pedido nr:' + IntToStr(pNroPedido));
  //
  idPrinter := uDM.sysPedidosPrt;
  if idPrinter = '' then
     idPrinter := ObtemParametro('PedidoPrinter');
  tmMax := StrToIntDef(ObtemParametro('PedidoTamMax'),300);
  if ObtemParametro('PedidoPreview') = 'S' then lPreview := True
    else lPreview := False;
  if ObtemParametro('PedidoDialogo') = 'S' then lDialog := True
    else lDialog := False;
  if not DefineImpressora(True,idPrinter,portaPrt,driverPrt,indexPrt) then
    lPreview := True;
  tamLinha := StrToIntDef(ObtemParametro('PedidoLstLinha'),45);
  tamFonte := StrToIntDef(ObtemParametro('PedidoLstFonte'),6);
  xNegrito := ObtemParametro('PedidoLstNegrito');
  if xNegrito = 'S' then negrito := True
  else begin
    xNegrito := 'N';
    negrito := False;
  end;
  meiaLinha := (tamLinha div 2) - 1;
  tamDescr := tamLinha - 21;    // Quant(3) + Unit(8) + Total(8) + espaco(1)
  //
  lstPedido := TStringList.Create;
  lstPedido.Add(stringCompleta('Cachorro Quente do Carlão','C',' ',tamLinha));
  lstPedido.Add('');
  lstPedido.Add(stringCompleta('Senha: '+ uDM.PedidosPlaca.AsString,'D',' ',meiaLinha) +
                stringCompleta('Pedido: '+ uDM.PedidosZC_NroLst.AsString,'E',' ',meiaLinha));
  lstPedido.Add('Cliente: ' + uDM.PedidosNomeCliente.AsString);
  lstPedido.Add('DH: ' + uDM.PedidosZC_DataHora.AsString);
  lstPedido.Add(stringCompleta('Detalhes','C','-',tamLinha));
  uDM.PedItens.First;
  while not uDM.PedItens.Eof
  do begin
    xQuant := stringCompleta(uDM.PedItensQuant.AsString,'E',' ',2);
    xUnit := FloatToStrF(uDM.PedItensVlrUnitario.AsCurrency,ffNumber,7,2);
    xUnit := stringCompleta(xUnit,'E',' ',8);
    xTotal := FloatToStrF(uDM.PedItensVlrTotal.ASCurrency,ffNumber,7,2);
    xTotal := stringCompleta(xTotal,'E',' ',8);
    xDescr := stringCompleta(uDM.PedItensZC_Descricao.AsString,'D',' ',tamDescr);
    lstPedido.Add(xQuant + ' ' + xDescr + xUnit + xTotal);
    xDescr := MontaTextoLst;
    while xDescr <> ''
    do begin
      nTam := Length(xDescr);
      if nTam > tamDescr then
        nTam := tamDescr;
      lstPedido.Add(Copy(xDescr,1,nTam));
      xDescr := Copy(xDescr,nTam+1,Length(xDescr)-nTam);
    end;
    uDM.PedItens.Next;
  end;
  xTotal := 'Total: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,7,2);
  lstPedido.Add(stringCompleta(stringFiller('-',Length(xTotal)),'E',' ',tamLinha-2));
  lstPedido.Add(stringCompleta(xTotal,'E',' ',tamLinha-2));
  lstPedido.Add(stringCompleta('Forma de pagamento: ' + uDM.PedidosZC_MPExtenso.AsString,'E',' ',tamLinha-2));
  lstPedido.Add(stringFiller('-',tamLinha));
  lstPedido.Add('Est: ' + uDM.sysCPUId);
  lstPedido.Add('...');
  lstPedido.Add('..');
  lstPedido.Add('.');
  lstPedido.Add('.');
  lstPedido.Add('.');
  lstPedido.Add('.');

  arqPedidoTxt := ObtemParametro('PedidoTexto','Pedido.Txt');
  Try
    lstPedido.SaveToFile(arqPedidoTxt);     // Nome completo de pedido.txt .............
  Except
  End;
  //
  with FuImpressoes
  do begin
    CDTexto.Active := True;
    CDTexto.EmptyDataSet;
    for i := 0 to lstPedido.Count-1
    do begin
      CDTexto.Append;
      CDTextoLinha.AsString := lstPedido[i];
      CDTexto.Post;
    end;
    RLPedTexto.Font.Size := tamFonte;
    if negrito then RLPedTexto.Font.Style := [fsBold]
      else  RLPedTexto.Font.Style := [];
    RLBandLinha.Font.Size := tamFonte;
    if negrito then RLBandLinha.Font.Style := [fsBold]
      else  RLBandLinha.Font.Style := [];
    RLDbLinha.ParentFont := True;
    if tamFonte <= 6 then RLDbLinha.Height := 12
                     else RLDbLinha.Height := 14;
    tmPagina := (CDTexto.RecordCount * RLDbLinha.Height) + 60;
    {
    RLMemoTxt.Lines.Clear;
    RLMemoTxt.Lines.LoadFromFile(arqPedidoTxt);
    RLBandLinha.Height := lstPedido.Count * 10;
    tmPagina := RLMemoTxt.Height + 120;    // (CDTexto.RecordCount * RLBandLinha.Height) + 60;
    }
    tmPagina := Trunc(tmPagina / 3.7795) + 1;
    if tmPagina < 60 then tmPagina := 60
       else if tmPagina > tmMax then tmPagina := tmMax;
    RLPedTexto.PageSetup.PaperHeight := tmPagina;
    RLPedTexto.PrintDialog := lDialog;

    FFRCtle.RLPreviewSetup1.CustomActionText := '';
    RLPrinters.RLPrinter.PrinterName := idPrinter;
    RLPrinters.RLPrinter.Copies := 1;

   if lPreview then RLPedTexto.Preview
      else RLPedTexto.Print;

   //CDTexto.EmptyDataSet;
   CDTexto.Active := False;

  end;
  FuImpressoes.Free;
  
end;

Procedure ImprimePedido(pNroPedido:Integer; pSys:Boolean = True);
var i: Integer;
    lSeparador: Boolean;
begin
  if ObtemParametro('PedidoLinhaSep') = 'S' then lSeparador := True
    else lSeparador := False;
  if not uDM.Pedidos.FindKey([pNroPedido])
  then begin
    Exit;
  end;
  //
  FuImpressoes := TFuImpressoes.Create(nil);
  if not CriaArqTmp
  then begin
    MessageDlg('Erro criação ArqTmp',mtError,[mbOk],0);
    FuImpressoes.Free;
    Exit;
  end;
  with FuImpressoes
  do begin
    // Copia pedido e lancamentos para área de trabalho (CDDdet)
    CDPed.Active := True;
    CDPed.EmptyDataSet;
    CDDet.Active := True;
    CDDet.EmptyDataSet;
    CDPed.Append;
    CDPedNumero.AsString := uDM.PedidosZC_NroLst.AsString;
    CDPedSenha.AsString := uDM.PedidosZC_Senha.AsString;
    CDPedCliente.AsString := uDM.PedidosNomeCliente.AsString;
    CDPedDataHora.AsString := uDM.PedidosZC_DataHora.AsString;
    CDPedTotal.AsString := FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,15,2);
    CDPedMeioPagto.AsString := uDM.PedidosZC_MPExtenso.AsString;
    CDPed.Post;
    uDM.PedItens.First;
    while not uDM.PedItens.Eof
    do begin
      CDDet.Append;
      CDDetNrLcto.AsString := uDM.PedItensZC_SeqLcto.AsString;
      CDDetTipo.AsString := uDM.PedItensZC_Tp.AsString;               // Lanche Bebida Montagem Diversos Crepes   ....
      CDDetQuant.AsString := uDM.PedItensQuant.AsString;
      CDDetDescricao.AsString := uDM.PedItensZC_Descricao.AsString;
      CDDetUnitar.AsString := FloatToStrF(uDM.PedItensVlrUnitario.AsCurrency,ffNumber,12,2);
      CDDetTotal.AsString := FloatToStrF(uDM.PedItensVlrTotal.AsCurrency,ffNumber,12,2);
      CDDetExtras.AsString := uDM.PedItensExtras.AsString;
      CDDetObserv.AsString := uDM.PedItensObservacao.AsString;
      CDDetPrensado.AsInteger := uDM.PedItensPrensado.AsInteger;
      CDDetCortado.AsInteger := uDM.PedItensCortado.AsInteger;
      if uDM.PedItensZC_Tp.AsString = 'V' then    // Buffet sorvetes
      begin
        CDDetDescricao.AsString := uDM.PedItensObservacao.AsString;
        CDDetObserv.Clear;
      end;
      CDDet.Post;
      uDM.PedItens.Next;
    end;

  end;
  //
  idPrinter := uDM.sysPedidosPrt;
  if idPrinter = '' then
     idPrinter := ObtemParametro('PedidoPrinter');
  tmMax := StrToIntDef(ObtemParametro('PedidoTamMax'),300);
  margEsq := StrToIntDef(ObtemParametro('PedidoMargEsquerda'),5);
  margDir := StrToIntDef(ObtemParametro('PedidoMargDireita'),5);
  margTop := StrToIntDef(ObtemParametro('PedidoMargTopo'),5);
  margBot := StrToIntDef(ObtemParametro('PedidoMargRodape'),5);
  copias := StrToIntDef(ObtemParametro('PedidoCopias'),1);
  lstAction := ObtemParametro('PedidoAction');
  if ObtemParametro('PedidoPreview') = 'S' then lPreview := True
    else lPreview := False;
  if ObtemParametro('PedidoDialogo') = 'S' then lDialog := True
    else lDialog := False;
  if not DefineImpressora(True,idPrinter,portaPrt,driverPrt,indexPrt) then
    lPreview := True;
  nDesloc := 0;
  nPontos := StrToIntDef(ObtemParametro('PixelHorizontal'),4);
  if (margEsq+margDir) > 10 then
    nDesloc := ((margEsq+margDir)-10) * nPontos;
  //
  if not pSys then lPreview := True;
  //
  with FuImpressoes
  do begin
    RLLabUnitItem.Left := 180 - nDesloc;
    RLLabTotalItem.Left := 220 - nDesloc;
    RLDbDescrItem.Width := 132 - nDesloc;
    RLDbUnitItem.Left := 180 - nDesloc;
    RLDbTotalItem.Left := 220 - nDesloc;
    RLMemoItem.Width := 261 - nDesloc;
    RLDbTotalPed.Left := 186 - nDesloc;
    nAltura := RLPedCab.Height + RLPedColCab.Height + RLPedSum.Height + RLPedFoot.Height;
               // + (uDM.PedItens.RecordCount * 16);
    CDDet.First;
    while not CDDet.Eof do
    begin
      nAltLinha := 16 + MontaTextoImpressao;     // Altura da linha padrão + comentarios, observações, etc...
      nAltura := nAltura + nAltLinha;
      if CDDetTipo.AsString = 'M'
         then nAltura := nAltura + 15;
      CDDet.Next;
    end;
    //
    nAltura := nAltura + (CDDet.RecordCount * 10);         //  120;     // XXXXXXXXXX
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 80 then tmPagina := 80
    else if tmPagina > tmMax then tmPagina := tmMax;
    RLPedido.PageSetup.PaperHeight := tmPagina;
    RLPedido.Margins.LeftMargin := margEsq;
    RLPedido.Margins.RightMargin := margDir;
    RLPedido.Margins.TopMargin := margTop;
    RLPedido.Margins.BottomMargin := margBot;
    RLPedDetal.Borders.DrawBottom := lSeparador;
    FFRCtle.RLPreviewSetup1.CustomActionText := lstAction;

    RLPedido.PrintDialog := lDialog;
    RLPrinters.RLPrinter.PrinterName := idPrinter;
    RLPrinters.RLPrinter.Copies := 1;

   if lPreview then RLPedido.Preview
      else for i := 1 to copias
           do RLPedido.Print;

    CDPed.Active := False;
    CDDet.Active := False;

    FuImpressoes.Free;

  end;

end;

Function EmiteNFCe(pNroPedido:Integer;pImprimir:Boolean;var pStatus:Boolean): TRetorno;
begin
  Result := EmitirNFCeDePV(pNroPedido,pImprimir);
  pStatus := Result.Resultado;
  if Not Result.Resultado then
    Application.MessageBox(
     PChar(Result.Mensagem),
      'Erro',
      16
    )
  Else
    Application.MessageBox(
     'Cupom Fiscal Emitido com sucesso!',
      'Info',
      64
    );

end;

Procedure ImprimeCaixa(pTurno,pCaixa,pCxSeq:Integer);
var i: Integer;
begin
  if not uDM.RegCaixa.FindKey([pTurno,pCaixa,pCxSeq]) then
  begin
    MessageDlg('Registro não encontrado' + #13 +
               'Turno:' + IntToStr(pTurno) +
               '   Caixa:' + IntToStr(pCaixa) +
               '   CxSeq:' + IntToStr(pCxSeq) + #13 +
               'Impressão cancelada',mtError,[mbOk],0);
    Exit;
  end;

  FuImpressoes := TFuImpressoes.Create(nil);
  idPrinter := uDM.sysCaixaPrt;
  if idPrinter = '' then
     idPrinter := ObtemParametro('CaixaPrinter');
  tmMax := StrToIntDef(ObtemParametro('CaixaTamMax'),300);
  margEsq := StrToIntDef(ObtemParametro('CaixaMargEsquerda'),5);
  margDir := StrToIntDef(ObtemParametro('CaixaMargDireita'),5);
  margTop := StrToIntDef(ObtemParametro('CaixaMargTopo'),5);
  margBot := StrToIntDef(ObtemParametro('CaixaMargRodape'),5);
  copias := StrToIntDef(ObtemParametro('CaixaCopias'),1);
  lstAction := ObtemParametro('CaixaAction');
  if ObtemParametro('CaixaPreview') = 'S' then lPreview := True
    else lPreview := False;
  if ObtemParametro('CaixaDialogo') = 'S' then lDialog := True
    else lDialog := False;
  if not DefineImpressora(True,idPrinter,portaPrt,driverPrt,indexPrt) then
    lPreview := True;
  //
  uDM.LctCaixa.Refresh;
  with FuImpressoes
  do begin
    nAltura := RLCx_Cabec.Height + RLCx_Cols.Height +
               (uDM.LctCaixa.RecordCount * RLCx_Detal.Height) +
               RLCx_Sum.Height + RLCx_Footer.Height + 60;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 100 then tmPagina := 100;
    if tmPagina > tmMax then tmPagina := tmMax;

    nDesloc := 0;
    nPontos := StrToIntDef(ObtemParametro('PixelHorizontal'),4);
    if (margEsq+margDir) > 10 then
       nDesloc := ((margEsq+margDir)-10) * nPontos;
    RLLabCxVlr.Left := 154 - nDesloc;
    RLLabCxSdo.Left := 209 - nDesloc;
    RLDbCxHist.Width := 111 - nDesloc;      // WIDTH está correto
    RLDbCxVlr.Left := 154 - nDesloc;
    RLDbCxSdo.Left := 209 - nDesloc;

    RLCaixa.PageSetup.PaperHeight := tmPagina;
    RLCaixa.Margins.LeftMargin := margEsq;
    RLCaixa.Margins.RightMargin := margDir;
    RLCaixa.Margins.TopMargin := margTop;
    RLCaixa.Margins.BottomMargin := margBot;
    RLCaixa.PrintDialog := lDialog;
    RLPrinters.RLPrinter.PrinterName := idPrinter;
    RLPrinters.RLPrinter.Copies := 1;
    FFRCtle.RLPreviewSetup1.CustomActionText := lstAction;

    if lPreview then RLCaixa.Preview
      else for i := 1 to copias
           do RLCaixa.Print;
  end;
  FuImpressoes.Free;

end;

Procedure ImprimeResumo(pIni,pFim:String;pVlr:array of Currency; pQtd:array of Integer;
                                         pVlrDoc:array of Currency; pqtdDoc:array of Integer;
                                         pIdCaixa:String);
var i: Integer;
begin
  FuImpressoes := TFuIMpressoes.Create(nil);
  idPrinter := uDM.sysResumoPrt;
  if idPrinter = '' then
     idPrinter := ObtemParametro('ResumoPrinter');

  tmMax := StrToIntDef(ObtemParametro('ResumoTamMax'),300);
  margEsq := StrToIntDef(ObtemParametro('ResumoMargEsquerda'),5);
  margDir := StrToIntDef(ObtemParametro('ResumoMargDireita'),5);
  margTop := StrToIntDef(ObtemParametro('ResumoMargTopo'),5);
  margBot := StrToIntDef(ObtemParametro('ResumoMargRodape'),5);
  copias := StrToIntDef(ObtemParametro('ResumoCopias'),1);
  lstAction := ObtemParametro('ResumoAction');
  if ObtemParametro('ResumoPreview') = 'S' then lPreview := True
    else lPreview := False;
  if ObtemParametro('ResumoDialogo') = 'S' then lDialog := True
    else lDialog := False;
  if not DefineImpressora(True,idPrinter,portaPrt,driverPrt,indexPrt) then
    lPreview := True;
  //
  uDM.Resvendas.First;
  with FuImpressoes
  do begin
    if pIni = pFim then
    begin
      RLLabTurnoIni.Caption := 'Turno: ' + pIni;
      RLLabTurnoFim.Visible := False;
    end
    else begin
      RLLabTurnoIni.Caption := 'Turno inicial: ' + pIni;
      RLLabTurnoFim.Caption := 'Turno final: ' + pFim;
    end;
    RLLabCaixas.Caption := pIdCaixa;
    RLLabReais.Caption := FloatToStrF(pVlr[0],ffNumber,15,2);
    RLLabCDeb.Caption := FloatToStrF(pVlr[1],ffNumber,15,2);
    RLLabCCred.Caption := FloatToStrF(pVlr[2],ffNumber,15,2);
    RLLabPIX.Caption := FloatToStrF(pVlr[3],ffNumber,15,2);
    RLLabOutros.Caption := FloatToStrF(pVlr[4],ffNumber,15,2);
    RLLabMisto.Caption := FloatToStrF(pVlr[5],ffNumber,15,2);
    RLLabTotal.Caption := FloatToStrF(pVlr[6],ffNumber,15,2);

    RLLabQtdReais.Caption := IntToStr(pQtd[0]);
    RLLabQtdCDeb.Caption := IntToStr(pQtd[1]);
    RLLabQtdCCred.Caption := IntToStr(pQtd[2]);
    RLLabQtdPIX.Caption := IntToStr(pQtd[3]);
    RLLabQtdOutros.Caption := IntToStr(pQtd[4]);
    RLLabQtdMisto.Caption := IntToStr(pQtd[5]);
    RLLabQtdTotal.Caption := IntToStr(pQtd[6]);

    RLLabNFCe.Caption := FloatToStrf(pVlrDoc[0],ffNumber,15,2);
    RLLabQtdNFCe.Caption := IntToSTr(pQtdDoc[0]);
    RLLabDocs.Caption := FloatToStrF(pVlrDoc[1],ffNumber,15,2);
    RLLabQtdDocs.Caption := IntToSTr(pQtdDoc[1]);
    RLLabTotVlrDocs.Caption := FloatToStrF(pVlrDoc[2],ffNumber,15,2);
    RLLabTotQtdDocs.Caption := IntToStr(pQtdDoc[2]);

    nAltura := RLRes_Cabec.Height + RLRes_Cols.Height +
               (uDM.ResVendas.RecordCount * RLRes_Detal.Height) +
               RLRes_Sum.Height + RLRes_Footer.Height + 60;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 100 then tmPagina := 100;
    if tmPagina > tmMax then tmPagina := tmMax;

    nDesloc := 0;
    nPontos := StrToIntDef(ObtemParametro('PixelHorizontal'),4);
    if (margEsq+margDir) > 10 then
       nDesloc := ((margEsq+margDir)-10) * nPontos;

    RLLabResQtd.Left := 174 - nDesloc;
    RLLabResTotal.Left := 204 - nDesloc;
    RLDbResDescr.Width := 144 - nDesloc;      // WIDTH está correto !!!!!
    RLDbResQtd.Left := 174 - nDesloc;
    RLDbResTotal.Left := 204 - nDesloc;

    RLResumo.PageSetup.PaperHeight := tmPagina;
    RLResumo.Margins.LeftMargin := margEsq;
    RLResumo.Margins.RightMargin := margDir;
    RLResumo.Margins.TopMargin := margTop;
    RLResumo.Margins.BottomMargin := margBot;
    RLResumo.PrintDialog := lDialog;
    RLPrinters.RLPrinter.PrinterName := idPrinter;
    RLPrinters.RLPrinter.Copies := 1;
    FFRCtle.RLPreviewSetup1.CustomActionText := lstAction;

    if lPreview then RLResumo.Preview
      else for i := 1 to copias
           do RLResumo.Print;

  end;
  FuImpressoes.Free;

end;


procedure TFuImpressoes.FormCreate(Sender: TObject);
begin
  lDSImpressao := False;

end;

procedure TFuImpressoes.RLCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLLabEmis.Caption := 'Emissão: ' + DataHoraString(Now,2,4);
  RLLabCxMov.Caption := 'Cx-' + IntToStr(uDM.sysNrCaixa) + '  Est:' + uDM.sysCPUId;
  RLLabId_RLCaixa.Caption := 'RLCaixa - SpeedFood ' + ObtemParametro('VersaoSpeedFood','1.1');

end;

procedure TFuImpressoes.RLPedDetalBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLPedDetal.Height := 15 + MontaTextoImpressao;

end;

procedure TFuImpressoes.RLPedidoAfterPrint(Sender: TObject);
var nrPedido: Integer;
    xMsg: String;
begin
  nrPedido := uDM.PedidosNumero.AsInteger;
  uDM.PedItens.Active := False;
  uDM.Pedidos.Active := False;
  //
  uDM.Pedidos.Active := True;
  uDM.PedItens.Active := True;
  if uDM.Pedidos.FindKey([nrPedido])
    then xMsg := 'Achou ' + IntToStr(nrPedido)
    else xMsg := 'Não achou ' + IntToStr(nrPedido) + ' - ' + uDM.PedidosNumero.AsString;
  DebugMensagem(uDM.lDebug,'Apos impressão ' + xMsg);

end;

procedure TFuImpressoes.RLPedidoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  uDM.Pedidos.Refresh;
  DebugMensagem(uDM.lDebug,'RLPedidoBeforePrint: ' + uDM.PedidosNumero.AsString);
  RLLabPedido.Caption := 'Cx-' + IntToStr(uDM.sysNrCaixa) + '  Est:' + uDM.sysCPUId;

end;

procedure TFuImpressoes.RLResumoBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLLabResumo.Caption := 'Cx-' + IntToStr(uDM.sysNrCaixa) + '  Est:' + uDM.sysCPUId;

end;

end.
