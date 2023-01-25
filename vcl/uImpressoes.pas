unit uImpressoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, System.UITypes, RLPrinters;
  Procedure ImprimePedido(pNroPedido:Integer; pSys:Boolean = True);
  Procedure EmiteNFCe(pNroPedido:Integer);
  Procedure ImprimeCaixa(pSequencia: Integer);
  Procedure ImprimeResumo(pIni,pFim:String;pVlr:array of Currency; pQtd:array of Integer);


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
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLCx_Sum: TRLBand;
    RLPanel3: TRLPanel;
    RLLabel8: TRLLabel;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText14: TRLDBText;
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
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
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
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLDBText35: TRLDBText;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLDBText38: TRLDBText;
    RLDBText39: TRLDBText;
    RLDBText40: TRLDBText;
    RLDbPedido: TRLDBText;
    RLDBText34: TRLDBText;
    RLDBText41: TRLDBText;
    RLLabel32: TRLLabel;
    RLMemo1: TRLMemo;
    RLDBText42: TRLDBText;
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
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLDBText47: TRLDBText;
    RLDBText48: TRLDBText;
    RLDBText49: TRLDBText;
    RLDBText50: TRLDBText;
    RLLabel39: TRLLabel;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLAngleLabel1: TRLAngleLabel;
    RLLabReais: TRLLabel;
    RLLabCDeb: TRLLabel;
    RLLabCCred: TRLLabel;
    RLLabPIX: TRLLabel;
    RLLabOutros: TRLLabel;
    RLLabMisto: TRLLabel;
    RLLabTotal: TRLLabel;
    RLLabQtdReais: TRLLabel;
    RLLabQtdCDeb: TRLLabel;
    RLLabQtdCCred: TRLLabel;
    RLLabQtdPIX: TRLLabel;
    RLLabQtdOutros: TRLLabel;
    RLLabQtdMisto: TRLLabel;
    RLLabQtdTotal: TRLLabel;
    RLLabel38: TRLLabel;
    RLDbSenha: TRLDBText;
    procedure RLCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLPedDetalBeforePrint(Sender: TObject; var PrintIt: Boolean);
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


implementation

{$R *.dfm}

uses uDados, uBiblioteca, uGenericas, uSysPrinters, FortesReportCtle;

Function MontaTextoImpressao: Integer;
var xExtra,txtAux: String;
    i:Integer;
begin
  Result := 0;
  FuImpressoes.RLMemo1.Lines.Clear;
  FuImpressoes.RLMemo1.Visible := False;
  if uDM.PedItensTpProd.AsInteger <> 1 then Exit;
  if uDM.PedItensExtras.AsString = stringFiller('.',24) then Exit;
  xExtra := uDM.PedItensExtras.AsString;
  if Pos('0',xExtra) > 0 then
  begin       // Há indicação SEM
    txtAux := 'SEM ';
    for i := 1 to 24 do
    if xExtra[i] = '0' then
      if uDM.Itens.FindKey([2,i]) then
        txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
    FuImpressoes.RLMemo1.Lines.Add(txtAux);
  end;
  if (Pos('+',xExtra) > 0) or (Pos('1',xExtra) > 0) or (Pos('2',xExtra) > 0)
  then begin       // Há indicação MAIS
    txtAux := 'MAIS ';
    for i := 1 to 24 do
    if (xExtra[i] = '+') or (xExtra[i] = '1') or (xExtra[i] = '2') then
      if uDM.Itens.FindKey([2,i]) then
        txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
    FuImpressoes.RLMemo1.Lines.Add(txtAux);
  end;
  if Pos('-',xExtra) > 0 then
  begin       // Há indicação MENOS
    txtAux := 'MENOS ';
    for i := 1 to 24 do
    if xExtra[i] = '-' then
      if uDM.Itens.FindKey([2,i]) then
        txtAux := txtAux + uDM.ItensDescricao.AsString + '; ';
      FuImpressoes.RLMemo1.Lines.Add(txtAux);
  end;
  if uDM.PedItensObservacao.AsString <> '' then
    FuImpressoes.RLMemo1.Lines.Add(uDM.PedItensObservacao.AsString);
  txtAux := '';
  if uDM.PedItensPrensado.AsInteger > 0 then
    txtAux := '     PRENSADO';
  if uDM.PedItensCortado.AsInteger > 0 then
    txtAux := txtAux + '     CORTADO';
  if txtAux <> '' then
    FuImpressoes.RLMemo1.Lines.Add(txtAux);
  //
  if FuImpressoes.RLMemo1.Lines.Count > 0
  then begin
    FuImpressoes.RLMemo1.Visible := True;
    Result := FuImpressoes.RLMemo1.Lines.Count * 15;
  end;

end;


Procedure ImprimePedido(pNroPedido:Integer; pSys:Boolean = True);
var filTxtAnt: String;
    filAnt: Boolean;
    i: Integer;
    lSeparador: Boolean;
begin
  if not uDM.Pedidos.FindKey([pNroPedido]) then Exit;

  if AnsiUpperCase(ObtemParametro('PedidoLinhaSep')) = 'S' then lSeparador := True
    else lSeparador := False;
  idPrinter := ObtemParametro('PedidoPrinter');
  tmMax := StrToIntDef(ObtemParametro('PedidoTamMax'),300);
  margEsq := StrToIntDef(ObtemParametro('PedidoMargEsquerda'),5);
  margDir := StrToIntDef(ObtemParametro('PedidoMargDireita'),5);
  margTop := StrToIntDef(ObtemParametro('PedidoMargTopo'),5);
  margBot := StrToIntDef(ObtemParametro('PedidoMargRodape'),5);
  copias := StrToIntDef(ObtemParametro('PedidoCopias'),1);
  lstAction := ObtemParametro('PedidoAction');
  if AnsiUpperCase(ObtemParametro('PedidoPreview')) = 'S' then lPreview := True
    else lPreview := False;
  if AnsiUpperCase(ObtemParametro('PedidoDialogo')) = 'S' then lDialog := True
    else lDialog := False;
  if not DefineImpressora(True,idPrinter,portaPrt,driverPrt,indexPrt) then
    lPreview := True;

  if not pSys then lPreview := True;


  uDM.PedItens.Filtered := False;
  uDM.PedItens.Refresh;
  FuImpressoes := TFuImpressoes.Create(nil);
  with FuImpressoes
  do begin
    nAltura := RLPedCab.Height + RLPedColCab.Height + RLPedSum.Height + RLPedFoot.Height +
               (uDM.PedItens.RecordCount * 16);
    filTxtAnt := uDM.PedItens.Filter;
    filAnt := uDM.PedItens.Filtered;
    uDM.PedItens.Filter := 'TpProd=1';
    uDM.PedItens.Filtered := True;
    uDM.PedItens.First;
    while not uDM.PedItens.Eof do
    begin
      nAltura := nAltura + MontaTextoImpressao;
      uDM.PedItens.Next;
    end;
    uDM.PedItens.Filter :='';
    uDM.PedItens.Filtered := False;
    uDM.PedItens.First;
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
  FuImpressoes.Free;

  uDM.PedItens.Filter := filTxtAnt;
  uDM.PedItens.Filtered := filAnt;

end;

Procedure EmiteNFCe(pNroPedido:Integer);
begin
  ShowMessage('Geração e emissão de NFCe ou re-emissão/visualização');
  {
  With uBiblioteca.EmitirNFCeDePV(1, uDM.Pedidos.FieldByName('numero').AsInteger ) Do
  Begin
    if Not Resultado then
    Begin
      ShowMessage(Mensagem);
      Exit;
    End;
  End;
  }

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
  if AnsiUpperCase(ObtemParametro('CaixaPreview')) = 'S' then lPreview := True
    else lPreview := False;
  if AnsiUpperCase(ObtemParametro('CaixaDialogo')) = 'S' then lDialog := True
    else lDialog := False;
  if not DefineImpressora(True,idPrinter,portaPrt,driverPrt,indexPrt) then
    lPreview := True;
  //
  uDM.LctCaixa.Refresh;
  FuImpressoes := TFuImpressoes.Create(nil);
  with FuImpressoes
  do begin
    nAltura := RLCx_Cabec.Height + RLCx_Cols.Height +
               (uDM.LctCaixa.RecordCount * RLCx_Detal.Height) +
               RLCx_Sum.Height + 60;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 100 then tmPagina := 100;
    if tmPagina > tmMax then tmPagina := tmMax;

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

Procedure ImprimeResumo(pIni,pFim:String; pVlr:array of Currency; pQtd:array of Integer);
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
  if AnsiUpperCase(ObtemParametro('ResumoPreview')) = 'S' then lPreview := True
    else lPreview := False;
  if AnsiUpperCase(ObtemParametro('ResumoDialogo')) = 'S' then lDialog := True
    else lDialog := False;
  if not DefineImpressora(True,idPrinter,portaPrt,driverPrt,indexPrt) then
    lPreview := True;
  //
  uDM.Resvendas.First;
  FuImpressoes := TFuImpressoes.Create(nil);
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

    nAltura := RLRes_Cabec.Height + RLRes_Cols.Height +
               (uDM.ResVendas.RecordCount * RLRes_Detal.Height) +
               RLRes_Sum.Height + 60;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 100 then tmPagina := 100;
    if tmPagina > tmMax then tmPagina := tmMax;

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


procedure TFuImpressoes.RLCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLLabEmis.Caption := 'Emissão: ' + DateTimeToStr(Now);

end;

procedure TFuImpressoes.RLPedDetalBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLPedDetal.Height := 15 + MontaTextoImpressao;

end;

end.
