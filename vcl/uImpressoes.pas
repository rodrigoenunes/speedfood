unit uImpressoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, System.UITypes, RLPrinters, uBiblioteca;
  Procedure ImprimePedido(pNroPedido:Integer; pSys:Boolean = True);
  Function EmiteNFCe(pNroPedido:Integer;pImprimir:Boolean;var pStatus:Boolean): TRetorno;
  Procedure ImprimeCaixa(pSequencia: Integer);
  Procedure ImprimeResumo(pIni,pFim:String;pVlr:array of Currency; pQtd:array of Integer;
                                           pVlrDoc:array of Currency; pqtdDoc:array of Integer);

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
    Res_Footer: TRLBand;
    RLLabel27: TRLLabel;
    RLBand2: TRLBand;
    RLLabel28: TRLLabel;
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
    procedure RLCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLPedDetalBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLPedidoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FuImpressoes: TFuImpressoes;
  nAltura,tmPagina: Integer;
  idPrinter: String;
  portaPrt,driverPrt: String;
  indexPrt: Integer;
  tmMax,margEsq,margDir,margTop,margBot,copias: Integer;
  lstAction: String;
  lPreview,lDialog: Boolean;
  nPontos,nDesloc: Integer;

implementation

{$R *.dfm}

uses uDados, uGenericas, uSysPrinters, FortesReportCtle;

Function MontaTextoImpressao: Integer;
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


Procedure ImprimePedido(pNroPedido:Integer; pSys:Boolean = True);
var filTxtAnt: String;
    filAnt: Boolean;
    i: Integer;
    lSeparador: Boolean;
begin
  if not uDM.Pedidos.FindKey([pNroPedido]) then Exit;
  if ObtemParametro('PedidoLinhaSep') = 'S' then lSeparador := True
    else lSeparador := False;
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
  DebugMensagem(uDM.lDebug,'ImprimePedido nro: ' + uDM.PedidosNumero.AsString +
                           '  Senha:' + uDM.PedidosPlaca.AsString);
  if uDM.PedidosNumero.AsInteger <> pNroPedido then
  begin
    DebugMensagem(uDM.lDebug,'Nro errado');
    if not uDM.Pedidos.FindKey([pNroPedido]) then
    begin
      DebugMensagem(uDM.lDebug,'Nro errado de novo......');
      Exit;
    end;

  end;



  uDM.PedItens.Filtered := False;
  uDM.PedItens.Refresh;
  //FuImpressoes := TFuImpressoes.Create(nil);
  //if FuImpressoes = Nil then
  //  Application.CreateForm(TFuImpressoes, FuImpressoes);
  with FuImpressoes
  do begin
    //RLDbPedido.Left := 185 - nDesloc;
    //RLDbDataPedido.Left := 168 - nDesloc;
    RLLabUnitItem.Left := 180 - nDesloc;
    RLLabTotalItem.Left := 220 - nDesloc;
    RLDbDescrItem.Width := 132 - nDesloc;     // WIDTH está correto !!!!!
    RLDbUnitItem.Left := 180 - nDesloc;
    RLDbTotalItem.Left := 220 - nDesloc;
    RLMemoItem.Width := 261 - nDesloc;        // WIDTH está correto !!!!!
    RLDbTotalPed.Left := 186 - nDesloc;
    nAltura := RLPedCab.Height + RLPedColCab.Height + RLPedSum.Height + RLPedFoot.Height +
               (uDM.PedItens.RecordCount * 16);
    //filTxtAnt := uDM.PedItens.Filter;
    //filAnt := uDM.PedItens.Filtered;
    //uDM.PedItens.Filter := 'TpProd=1';
    //uDM.PedItens.Filtered := True;

    uDM.PedItens.First;
    while not uDM.PedItens.Eof do
    begin
      nAltura := nAltura + MontaTextoImpressao;
      if uDM.PedItensTpProd.AsInteger = 2
         then nAltura := nAltura + 15;
      uDM.PedItens.Next;
    end;
    //uDM.PedItens.Filter :='';
    //uDM.PedItens.Filtered := False;
    //uDM.PedItens.First;
    //
    nAltura := nAltura + 60;
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


   // RLPedSum.Borders.DrawTop := False;
   // if not lSeparador then RLPedSum.Borders.DrawTop := True;

{
    if uDM.PedidosPlaca.AsString <> '' then
    begin
      RLDbPlaca.Visible := True;
      RLDbNrPedido.Font.Size := 10;
      RLDbNrPedido.Font.Style := [];
    end
    else begin
      RLDbPlaca.Visible := False;
      RLDbNrPedido.Font.Size := 12;
      RLDbNrPedido.Font.Style := [fsBold];
    end;
}
    RLPedido.PrintDialog := lDialog;
    RLPrinters.RLPrinter.PrinterName := idPrinter;
    RLPrinters.RLPrinter.Copies := 1;

   if lPreview then RLPedido.Preview
      else for i := 1 to copias
           do RLPedido.Print;
  end;
  //FuImpressoes.Free;

  uDM.PedItens.Filter := filTxtAnt;
  uDM.PedItens.Filtered := filAnt;

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

Procedure ImprimeCaixa(pSequencia: Integer);
var i: Integer;
begin
  if not uDM.RegCaixa.FindKey([pSequencia]) then
  begin
    MessageDlg('Registro de caixa Turno ' + IntToStr(pSequencia) + ' não encontrado',mtError,[mbOk],0);
    Exit;
  end;
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
  //FuImpressoes := TFuImpressoes.Create(nil);
  with FuImpressoes
  do begin
    nAltura := RLCx_Cabec.Height + RLCx_Cols.Height +
               (uDM.LctCaixa.RecordCount * RLCx_Detal.Height) +
               RLCx_Sum.Height + 60;
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
  //FuImpressoes.Free;

end;

Procedure ImprimeResumo(pIni,pFim:String;pVlr:array of Currency; pQtd:array of Integer;
                                         pVlrDoc:array of Currency; pqtdDoc:array of Integer);
var i: Integer;
begin
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
 // FuImpressoes := TFuImpressoes.Create(nil);
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
               RLRes_Sum.Height + 60;
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
  //FuImpressoes.Free;

end;


procedure TFuImpressoes.RLCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLLabEmis.Caption := 'Emissão: ' + DateTimeToStr(Now);

end;

procedure TFuImpressoes.RLPedDetalBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLPedDetal.Height := 15 + MontaTextoImpressao;

end;

procedure TFuImpressoes.RLPedidoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  DebugMensagem(uDM.lDebug,'RLPedidoBeforePrint: ' + uDM.PedidosNumero.AsString);

end;

end.
