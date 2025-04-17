unit SFEuPrintFortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLPrinters, RLRichText;
  procedure SetRecordRangeLanche(pModo:Integer);
  //procedure SetRecordRangeCrepe(pModo:Integer);
  //procedure SetRecordRangeFritura(pModo:Integer);
  procedure SetRecordRange_CFS(pTipo:Integer; pModo:Integer);     // 11-Crepe 21-Fritura 31-Shake
  procedure DefinePrinterEtiqueta;
  procedure EmiteEtiquetas(pmtPedido:Integer; pmtItem:Integer; pmtNaoImpressa:Boolean; pmtEtiqBebidas:Boolean; pmtDebug:Boolean);

type
  TFSFEuPrintFortes = class(TForm)
    RLEtiqLanche: TRLReport;
    RLDetLanche: TRLBand;
    RLEtiqBebida: TRLReport;
    RLCabBeb: TRLBand;
    RLCabLanche: TRLBand;
    RLDetBebida: TRLBand;
    RLBebColFooter: TRLBand;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBResult1: TRLDBResult;
    RLDBText2: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel3: TRLLabel;
    RLPanDescr: TRLPanel;
    RLDbDescfr: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText5: TRLDBText;
    RLDbPedido: TRLDBText;
    RLDBText8: TRLDBText;
    RLRodapeLanche: TRLBand;
    RLDbCliente: TRLDBText;
    RLDBText9: TRLDBText;
    RLDbPrensCort: TRLDBText;
    RLPanMaisSemMenos: TRLPanel;
    RLBand1: TRLBand;
    RLDbClienteBeb: TRLDBText;
    RLDBText13: TRLDBText;
    RLColBebida: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLPanSem: TRLPanel;
    RLPanMais: TRLPanel;
    RLPanMenos: TRLPanel;
    RLLabSem: TRLLabel;
    RLLabMais: TRLLabel;
    RLLabMenos: TRLLabel;
    RLDbObserv: TRLDBText;
    RLSem: TRLMemo;
    RLMenos: TRLMemo;
    RLMais: TRLMemo;
    RLEtiq_Crepe: TRLReport;
    RLBand2: TRLBand;
    RLDraw3: TRLDraw;
    RLDBText4: TRLDBText;
    RLDraw4: TRLDraw;
    RLDBMemo2: TRLDBMemo;
    RLBand3: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText19: TRLDBText;
    RLBand4: TRLBand;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLLabParaLevar: TRLLabel;
    RLLabParaLevarCrepe: TRLLabel;
    RLEtiq_Fritura: TRLReport;
    RLBand5: TRLBand;
    RLDraw1: TRLDraw;
    RLDBText14: TRLDBText;
    RLDraw2: TRLDraw;
    RLDBMemo1: TRLDBMemo;
    RLLabel7: TRLLabel;
    RLBand6: TRLBand;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLBand7: TRLBand;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLEtiq_Shake: TRLReport;
    RLBand8: TRLBand;
    RLDraw5: TRLDraw;
    RLDBText25: TRLDBText;
    RLDraw6: TRLDraw;
    RLDBMemo3: TRLDBMemo;
    RLLabel10: TRLLabel;
    RLBand9: TRLBand;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLBand10: TRLBand;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    procedure RLEtiqBebidaBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDetLancheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FSFEuPrintFortes: TFSFEuPrintFortes;
  idPrinter,portaPrt,driverPrt: String;
  indexPrt: Integer;
  lPreview,lDialog: Boolean;
  etqAlt,etqLrg,etqTop,etqEsq,etqDir,etqBot: Integer;
  idPrtEtqLanche,idPrtEtqBebidas,idPrtEtqCFS: String;          // IMPRESSORAS específicas

implementation

{$R *.dfm}

uses uDados, uSysPrinters, FortesReportCtle, uGenericas;

procedure SetRecordRangeLanche(pModo:Integer);
begin
  if pModo = 1 then
    FSFEuPrintFortes.RLEtiqLanche.RecordRange := rrAllRecords
  else
    FSFEuPrintFortes.RLEtiqLanche.RecordRange := rrCurrentOnly;

end;


procedure SetRecordRange_CFS(pTipo:Integer; pModo:Integer);     // Crepe Fritura Shake/Gelados
begin
  case pTipo of
    11:if pModo = 1 then
          FSFEuPrintFortes.RLEtiq_Crepe.RecordRange := rrAllRecords
       else
          FSFEuPrintFortes.RLEtiq_Crepe.RecordRange := rrCurrentOnly;
    21:if pModo = 1 then
          FSFEuPrintFortes.RLEtiq_Fritura.RecordRange := rrAllRecords
       else
          FSFEuPrintFortes.RLEtiq_Fritura.RecordRange := rrCurrentOnly;
    else if pModo = 1 then
            FSFEuPrintFortes.RLEtiq_Shake.RecordRange := rrAllRecords
         else
            FSFEuPrintFortes.RLEtiq_Shake.RecordRange := rrCurrentOnly;
  end;


end;

procedure DefinePrinterEtiqueta;
begin
  with FSFEuPrintFortes
  do begin
    idPrinter := uDM.sysEtiquetasPrt;
    if idPrinter = '' then
       idPrinter := ObtemParametro('EtiquetaPrinter');      // Impressora etiquetas, geral
    //
    if ObtemParametro('EtiquetaPreview') = 'S' then
      lPreview := True
    else
      lPreview := False;
    if ObtemParametro('EtiquetaDialogo') = 'S' then
      lDialog := True
    else
      lDialog := False;
    etqAlt := StrToIntDef(ObtemParametro('EtiquetaAltura'),53);
    etqLrg := StrToIntDef(ObtemParametro('EtiquetaLargura'),105);
    etqTop := StrToIntDef(ObtemParametro('EtiquetaMargTopo'),4);
    etqEsq := StrToIntDef(ObtemParametro('EtiquetaMargEsquerda'),6);
    etqDir := StrToIntDef(ObtemParametro('EtiquetaMargDireita'),2);
    etqBot := StrToIntDef(ObtemParametro('EtiquetaMargRodape'),3);
    //
    if not DefineImpressora(True,idPrinter,portaPrt,driverPrt,indexPrt) then
    begin
      lPreview := True;
      lDialog := True;
    end;
    //
    FFRCtle.RLPreviewSetup1.CustomActionText := '';
    RLPrinters.RLPrinter.PrinterName := idPrinter;    // Definir a impressora para cada impressão
    RLPrinters.RLPrinter.Copies := 1;
    //
    idPrtEtqLanche := ObtemParametro('EtiquetaPrinterLanche_'+IntToStr(uDM.sysNumId),idPrinter);
    RLEtiqLanche.PrintDialog := lDialog;
    RLEtiqLanche.PageSetup.PaperHeight := etqAlt;
    RLEtiqLanche.Margins.LeftMargin := etqEsq;
    RLEtiqLanche.Margins.RightMargin := etqDir;
    RLEtiqLanche.Margins.TopMargin := etqTop;
    RLEtiqLanche.Margins.BottomMargin := etqBot;
    //
    idPrtEtqBebidas := ObtemParametro('EtiquetaPrinterBebidas_'+IntToStr(uDM.sysNumId),'');
    RLEtiqBebida.PrintDialog := lDialog;
    RLEtiqBebida.PageSetup.PaperHeight := etqAlt;
    RLEtiqBebida.Margins.LeftMargin := etqEsq;
    RLEtiqBebida.Margins.RightMargin := etqDir;
    RLEtiqBebida.Margins.TopMargin := etqTop;
    RLEtiqBebida.Margins.BottomMargin := etqBot;
    //
    idPrtEtqCFS := ObtemParametro('EtiquetaPrinterCFS_'+IntToStr(uDM.sysNumId),idPrinter);
    RLEtiq_Crepe.PrintDialog := lDialog;
    RLEtiq_Crepe.PageSetup.PaperHeight := etqAlt;
    RLEtiq_Crepe.Margins.LeftMargin := etqEsq;
    RLEtiq_Crepe.Margins.RightMargin := etqDir;
    RLEtiq_Crepe.Margins.TopMargin := etqTop;
    RLEtiq_Crepe.Margins.BottomMargin := etqBot;

    RLEtiq_Fritura.PrintDialog := lDialog;
    RLEtiq_Fritura.PageSetup.PaperHeight := etqAlt;
    RLEtiq_Fritura.Margins.LeftMargin := etqEsq;
    RLEtiq_Fritura.Margins.RightMargin := etqDir;
    RLEtiq_Fritura.Margins.TopMargin := etqTop;
    RLEtiq_Fritura.Margins.BottomMargin := etqBot;

    RLEtiq_Shake.PrintDialog := lDialog;
    RLEtiq_Shake.PageSetup.PaperHeight := etqAlt;
    RLEtiq_Shake.Margins.LeftMargin := etqEsq;
    RLEtiq_Shake.Margins.RightMargin := etqDir;
    RLEtiq_Shake.Margins.TopMargin := etqTop;
    RLEtiq_Shake.Margins.BottomMargin := etqBot;

  end;
end;


Procedure EmiteEtiquetas(pmtPedido:Integer; pmtItem:Integer; pmtNaoImpressa:Boolean; pmtEtiqBebidas:Boolean; pmtDebug:Boolean);
var filAnt: Boolean;
    filTxtAnt: String;
    i: Integer;
const
    tpProds: array[1..3] of String = ('11','21','31');
begin
  if not uDM.Pedidos.FindKey([pmtPedido]) then
  begin
    MessageDlg('Pedido nr ' + IntToStr(pmtPedido) + ' não encontrado', mtError,[mbOk], 0);
    Exit;
  end;
  FSFEuPrintFortes := TFSFEuPrintFortes.Create(nil);
  DefinePrinterEtiqueta;       // Define... define idPrinter, lPreview e lDialog das etiquetas
  DebugMensagem(pmtDebug,'Impressoras definidas' + #13 +
                         'Lanches='+ idPrtEtqLanche + #13 +
                         'Bebidas=' + idPrtEtqBebidas + #13 +
                         'CFS=' + idPrtEtqCFS);
  FSFEuPrintFortes.RLLabParaLevar.Visible := False;
  FSFEuPrintFortes.RLLabParaLevarCrepe.Visible := False;

  if uDM.PedidosParaLevar.AsInteger = 1 then
  begin
    FSFEuPrintFortes.RLLabParaLevar.Caption := ObtemParametro('PedidoTxtParaLevarPrint','-- Para levar --');
    FSFEuPrintFortes.RLLabParaLevarCrepe.Caption := FSFEuPrintFortes.RLLabParaLevar.Caption;
  end;
  if uDM.PedidosOrigem.AsInteger = 1 then
  begin
    if FSFEuPrintFortes.RLLabParaLevar.Caption <> '' then
       FSFEuPrintFortes.RLLabParaLevar.Caption := FSFEuPrintFortes.RLLabParaLevar.Caption + '    ';
    FSFEuPrintFortes.RLLabParaLevar.Caption := FSFEuPrintFortes.RLLabParaLevar.Caption + 'WhatsApp'
  end;
  if FSFEuPrintFortes.RLLabParaLevar.Caption <> '' then
    FSFEuPrintFortes.RLLabParaLevar.Visible := True;
  if FSFEuPrintFortes.RLLabParaLevarCrepe.Caption <> '' then
    FSFEuPrintFortes.RLLabParaLevarCrepe.Visible := True;

  //
  if pmtItem <> 0
  then begin
    if uDM.PedItens.FindKey([pmtPedido,pmtItem])
    then begin
      SetRecordRangeLanche(0);      // rrCurrentOnly;
      case uDM.PedItensTpProd.AsInteger of
          1,4:if idPrtEtqLanche <> '' then
              begin
                if not DefineImpressora(True,idPrtEtqLanche,portaPrt,driverPrt,indexPrt) then
                begin
                  lPreview := True;
                  lDialog := True;
                end;
                DebugMensagem(pmtDebug,'IT Lanche 1-PrinterName=' + RLPrinters.RLPrinter.PrinterName);
                RLPrinters.RLPrinter.PrinterName := idPrtEtqLanche;
                DebugMensagem(pmtDebug,'IT Lanche 2-PrinterName=' + RLPrinters.RLPrinter.PrinterName + '  id=' + idPrtEtqLanche);
                if lPreview then
                   FSFEuPrintFortes.RLEtiqLanche.Preview
                else
                   FSFEuPrintFortes.RLEtiqLanche.Print;
              end;
          3:if idPrtEtqBebidas <> '' then           // Todas as bebidas em uma unica etiqueta
              begin
                if not DefineImpressora(True,idPrtEtqBebidas,portaPrt,driverPrt,indexPrt) then
                begin
                  lPreview := True;
                  lDialog := True;
                end;
                DebugMensagem(pmtDebug,'IT Bebidas 1-PrinterName=' + RLPrinters.RLPrinter.PrinterName);
                RLPrinters.RLPrinter.PrinterName := idPrtEtqBebidas;
                DebugMensagem(pmtDebug,'IT Bebidas 2-PrinterName='+ RLPrinters.RLPrinter.PrinterName + '  id=' + idPrtEtqBebidas);
                filAnt := uDM.PedItens.Filtered;
                filTxtAnt := uDM.PedItens.Filter;
                uDM.PedItens.Filtered := True;
                uDM.PedItens.Filter := 'TpProd=3';
                uDM.PedItens.Refresh;
                if lPreview then
                   FSFEuPrintFortes.RLEtiqBebida.Preview
                else
                   FSFEuPrintFortes.RLEtiqBebida.Print;
                uDM.PedItens.First;
                while not uDM.PedItens.Eof do
                begin
                  uDM.PedItens.Edit;
                  uDM.PedItensEtqImpressa.AsInteger := 1;
                  uDM.PedItens.Post;
                  uDM.PedItens.Next;
                end;
                uDM.PedItens.Filtered := filAnt;
                uDM.PedItens.Filter := filTxtAnt;
                uDM.PedItens.Refresh;
              end;
          11:if idPrtEtqCFS <> '' then
              begin
                if not DefineImpressora(True,idPrtEtqCFS,portaPrt,driverPrt,indexPrt) then
                begin
                  lPreview := True;
                  lDialog := True;
                end;
                SetRecordRange_CFS(11,0);
                DebugMensagem(pmtDebug,'IT CFS 1-PrinterName=' + RLPrinters.RLPrinter.PrinterName);
                RLPrinters.RLPrinter.PrinterName := idPrtEtqCFS;
                DebugMensagem(pmtDebug,'IT CFS 2-PrinterName='+ RLPrinters.RLPrinter.PrinterName + '  id=' + idPrtEtqCFS);
                if lPreview then
                   FSFEuPrintFortes.RLEtiq_Crepe.Preview
                else
                   FSFEuPrintFortes.RLEtiq_Crepe.Print;
              end;
          21:if idPrtEtqCFS <> '' then
              begin
                if not DefineImpressora(True,idPrtEtqCFS,portaPrt,driverPrt,indexPrt) then
                begin
                  lPreview := True;
                  lDialog := True;
                end;
                SetRecordRange_CFS(21,0);
                DebugMensagem(pmtDebug,'IT CFS 1-PrinterName=' + RLPrinters.RLPrinter.PrinterName);
                RLPrinters.RLPrinter.PrinterName := idPrtEtqCFS;
                DebugMensagem(pmtDebug,'IT CFS 2-PrinterName='+ RLPrinters.RLPrinter.PrinterName + '  id=' + idPrtEtqCFS);
                if lPreview then
                   FSFEuPrintFortes.RLEtiq_Fritura.Preview
                else
                   FSFEuPrintFortes.RLEtiq_Fritura.Print;
              end;
          31:if idPrtEtqCFS <> '' then
              begin
                if not DefineImpressora(True,idPrtEtqCFS,portaPrt,driverPrt,indexPrt) then
                begin
                  lPreview := True;
                  lDialog := True;
                end;
                SetRecordRange_CFS(31,0);
                DebugMensagem(pmtDebug,'IT CFS 1-PrinterName=' + RLPrinters.RLPrinter.PrinterName);
                RLPrinters.RLPrinter.PrinterName := idPrtEtqCFS;
                DebugMensagem(pmtDebug,'IT CFS 2-PrinterName='+ RLPrinters.RLPrinter.PrinterName + '  id=' + idPrtEtqCFS);
                if lPreview then
                   FSFEuPrintFortes.RLEtiq_Shake.Preview
                else
                   FSFEuPrintFortes.RLEtiq_Shake.Print;
              end;
     end;
    end
    else MessageDlg('Item não encontrado' + #13 +
                    'Pedido: ' + IntToStr(pmtPedido) + ' item: ' + IntToStr(pmtItem) + #13 +
                    'Emissão impossibilitada',mtError,[mbOk],0);
  end
  else begin     // Todas as etiquetas
    filAnt := uDM.PedItens.Filtered;
    filTxtAnt := uDM.PedItens.Filter;
    // Lanches
    uDM.PedItens.Filtered := False;
    uDM.PedItens.Filter := 'TpProd=1 or TpProd=4';
    if pmtNaoImpressa then
       uDM.PedItens.Filter := '(TpProd=1 or TpProd=4) and EtqImpressa=0';
    uDM.PedItens.Filtered := True;
    uDM.PedItens.Refresh;
    if (uDM.PedItens.RecordCount > 0) and (idPrtEtqLanche <> '') then
    begin
      uDM.PedItens.First;
      SetRecordRangeLanche(1);      // rrAllRecords;
      DebugMensagem(pmtDebug,'Todos Lanche 1-PrinterName=' + RLPrinters.RLPrinter.PrinterName);
      if not DefineImpressora(True,idPrtEtqLanche,portaPrt,driverPrt,indexPrt) then
      begin
        lPreview := True;
        lDialog := True;
      end;
      RLPrinters.RLPrinter.PrinterName := idPrtEtqLanche;
      DebugMensagem(pmtDebug,'Todos Lanche 2-PrinterName=' + RLPrinters.RLPrinter.PrinterName + '  id=' + idPrtEtqLanche);
      if lPreview then
        FSFEuPrintFortes.RLEtiqLanche.Preview
      else
        FSFEuPrintFortes.RLEtiqLanche.Print;
    end;
    //   Bebidas
    if pmtEtiqBebidas and (idPrtEtqBebidas <> '')
    then begin
      uDM.PedItens.Filtered := False;
      SetRecordRangeLanche(0);      // rrCurrentOnly;
      uDM.PedItens.Filter := 'TpProd=3';
      if pmtNaoImpressa then
         uDM.PedItens.Filter := uDM.PedItens.Filter + ' and EtqImpressa=0';
      uDM.PedItens.Filtered := True;
      uDM.PedItens.Refresh;
      DebugMensagem(pmtDebug,'Todos Bebidas 1-PrinterName=' + RLPrinters.RLPrinter.PrinterName);
      if not DefineImpressora(True,idPrtEtqBebidas,portaPrt,driverPrt,indexPrt) then
      begin
        lPreview := True;
        lDialog := True;
      end;
      RLPrinters.RLPrinter.PrinterName := idPrtEtqBebidas;
      DebugMensagem(pmtDebug,'Todos Bebidas 2-PrinterName='+ RLPrinters.RLPrinter.PrinterName + '  id=' + idPrtEtqBebidas);
      if uDM.PedItens.RecordCount > 0 then
      begin      // Imprime TODAS as bebidas em uma etiqueta
        uDM.PedItens.First;
        if lPreview then
          FSFEuPrintFortes.RLEtiqBebida.Preview
        else
          FSFEuPrintFortes.RLEtiqBebida.Print;
      end;
    end;
    // Crepes(11), Frituras(21), Gelados(31)
    //ShowMessage('Impressora CFS=[' + idPrtEtqCFS + ']');
    if idPrtEtqCFS <> '' then
    begin
      DebugMensagem(pmtDebug,'Todos CFS 1-PrinterName=' + RLPrinters.RLPrinter.PrinterName);
      if not DefineImpressora(True,idPrtEtqCFS,portaPrt,driverPrt,indexPrt) then
      begin
        lPreview := True;
        lDialog := True;
      end;
      RLPrinters.RLPrinter.PrinterName := idPrtEtqCFS;
      DebugMensagem(pmtDebug,'Todos CFS 2-PrinterName='+ RLPrinters.RLPrinter.PrinterName + '  id=' + idPrtEtqCFS);
      for i := 1 to 3 do     // Array "tpProds"  (11,21,31)
      begin
        uDM.PedItens.Filtered := False;
        uDM.PedItens.Filter := 'TpProd=' + tpProds[i];
        if pmtNaoImpressa then
           uDM.PedItens.Filter := 'TpProd=' + tpProds[i] + ' and EtqImpressa=0';
        uDM.PedItens.Filtered := True;
        uDM.PedItens.Refresh;
        uDM.PedItens.First;
        if uDM.PedItens.RecordCount > 0 then
        begin
          uDM.PedItens.First;
          DebugMensagem(pmtDebug,'CFS 3-PrinterName='+ RLPrinters.RLPrinter.PrinterName + '  id=' + idPrtEtqCFS +
                                 '  TpProd=' + tpProds[i]);
          if tpProds[i] = '11' then
          begin
            SetRecordRange_CFS(11,1);      // rrAllRecords;
            if lPreview then
              FSFEuPrintFortes.RLEtiq_Crepe.Preview
            else
              FSFEuPrintFortes.RLEtiq_Crepe.Print;
          end;
          if tpProds[i] = '21' then
          begin
            SetRecordRange_CFS(21,1);      // rrAllRecords;
            if lPreview then
              FSFEuPrintFortes.RLEtiq_Fritura.Preview
            else
              FSFEuPrintFortes.RLEtiq_Fritura.Print;
          end;
          if tpProds[i] = '31' then
          begin
            SetRecordRange_CFS(31,1);      // rrAllRecords;
            if lPreview then
              FSFEuPrintFortes.RLEtiq_Shake.Preview
            else
              FSFEuPrintFortes.RLEtiq_Shake.Print;
          end;
        end;
      end;
    end;
    // Restaura filtros
    uDM.PedItens.Filtered := filAnt;
    uDM.PedItens.Filter := filTxtAnt;
    uDM.PedItens.Refresh;
  end;
  FSFEuPrintFortes.Free;

end;



procedure TFSFEuPrintFortes.RLDetLancheBeforePrint(Sender: TObject; var PrintIt: Boolean);
var i: Integer;
    AllExtras,xExtra: String;
    wTamFonte,wLargura: Integer;
    wTp: Integer;
    //linMais,linSem,linMenos: Integer;
begin
  if uDM.PedidosNomeCliente.AsString <> '' then
    RLDbCliente.Visible := True
  else
    RLDbCliente.Visible := False;
  //
  wTamFonte := 10;
  wLargura := 122;
  AllExtras := uDM.PedItensExtras.AsString;
  RLMais.Lines.Clear;
  RLSem.Lines.Clear;
  RLMenos.Lines.Clear;
  //
  if uDM.PedItensTpProd.AsInteger = 1
  then begin
    wTp := 2;     // Extras de lanches normais
    RLLabMais.Caption := 'MAIS';
    RLLabSem.Caption := 'SEM';
    RLLabMenos.Caption := 'MENOS';
  end
  else begin
    wTp := 5;
    RLLabMais.Caption := 'COM ***';
    RLLabSem.Caption := '';
    RLLabMenos.Caption := '';
  end;
  for i := 1 to 24 do
    if AllExtras[i] <> '.' then
      if uDM.Itens.FindKey([wTp,i])
      then begin
        xExtra := Trim(uDM.ItensDescricao.AsString);
        if AllExtras[i] = '0' then RLSem.Lines.Add(xExtra)
        else if AllExtras[i] = '-' then RLMenos.Lines.Add(xExtra)
             else begin
               if AllExtras[i] <> '1' then xExtra := xExtra + ' (' + AllExtras[i] + ')';
               RLMais.Lines.Add(xExtra);
             end;
      end;
  RLPanMais.Width := wLargura;
  RLPanMais.Borders.DrawRight := True;
  RLPanMais.Visible := True;
  RLMais.Font.Size := wTamFonte;
  if RLMais.Lines.Count > 7 then
     RLMais.Font.Size := 9;

  RLPanSem.Width := wLargura;
  RLPanSem.Borders.DrawRight := True;
  RLPanSem.Visible := True;
  RLSem.Font.Size := wTamFonte;
  if RLSem.Lines.Count > 7 then
     RLSem.Font.Size := 9;

  RLPanMenos.Width := wLargura;
  RLPanMenos.Visible := True;
  RLMenos.Font.Size := wTamFonte;
  if RLMenos.Lines.Count > 7 then
     RLMenos.Font.Size := 9;

  RLPanMaisSemMenos.Height := 152;

end;

procedure TFSFEuPrintFortes.RLEtiqBebidaBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  with FSFEuPrintFortes
  do begin
    if uDM.PedidosNomeCliente.AsString <> '' then
      RLDbClienteBeb.Visible := True
    else
      RLDbClienteBeb.Visible := False;
  end;

end;

end.
