unit SFEuPrintFortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLPrinters, RLRichText;
  procedure SetRecordRangeLanche(pModo:Integer);
  procedure DefinePrinterEtiqueta;
  procedure EmiteEtiquetas(pmtPedido:Integer; pmtItem:Integer; pmtPreview:Boolean=False);

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

implementation

{$R *.dfm}

uses uDados, uSysPrinters, FortesReportCtle;

procedure SetRecordRangeLanche(pModo:Integer);
begin
  if pModo = 1 then
    FSFEuPrintFortes.RLEtiqLanche.RecordRange := rrAllRecords
  else
    FSFEuPrintFortes.RLEtiqLanche.RecordRange := rrCurrentOnly;

end;

procedure DefinePrinterEtiqueta;
begin
  with FSFEuPrintFortes
  do begin
    idPrinter := ObtemParametro('EtiquetaPrinter');
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
    if not DefineImpressora(True,idPrinter,portaPrt,driverPrt,indexPrt) then
    begin
      lPreview := True;
      lDialog := True;
    end;
    //
    FFRCtle.RLPreviewSetup1.CustomActionText := '';
    RLPrinters.RLPrinter.PrinterName := idPrinter;
    RLPrinters.RLPrinter.Copies := 1;
    //
    RLEtiqLanche.PrintDialog := lDialog;
    RLEtiqLanche.PageSetup.PaperHeight := etqAlt;
    RLEtiqLanche.Margins.LeftMargin := etqEsq;
    RLEtiqLanche.Margins.RightMargin := etqDir;
    RLEtiqLanche.Margins.TopMargin := etqTop;
    RLEtiqLanche.Margins.BottomMargin := etqBot;
    //
    RLEtiqBebida.PrintDialog := lDialog;
    RLEtiqBebida.PageSetup.PaperHeight := etqAlt;
    RLEtiqBebida.Margins.LeftMargin := etqEsq;
    RLEtiqBebida.Margins.RightMargin := etqDir;
    RLEtiqBebida.Margins.TopMargin := etqTop;
    RLEtiqBebida.Margins.BottomMargin := etqBot;

  end;
end;


Procedure EmiteEtiquetas(pmtPedido:Integer; pmtItem:Integer; pmtPreview:Boolean=False);
var filAnt: Boolean;
    filTxtAnt: String;
begin
  FSFEuPrintFortes := TFSFEuPrintFortes.Create(nil);
  DefinePrinterEtiqueta;
//  if AnsiUpperCase(ObtemParametro('EtiquetaPreview')) = 'S' then
//    lPreview := True
//  else
//    lPreview := False;
  //
  if pmtPreview then lPreview := True;
  //
  if pmtItem <> 0
  then begin
    if uDM.PedItens.FindKey([pmtPedido,pmtItem])
    then begin
      SetRecordRangeLanche(0);      // rrCurrentOnly;
      case uDM.PedItensTpProd.AsInteger of
        1,4:if lPreview then
               FSFEuPrintFortes.RLEtiqLanche.Preview
            else
               FSFEuPrintFortes.RLEtiqLanche.Print;
          3:begin
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
      end;
    end
    else MessageDlg('Item não encontrado' + #13 +
                    'Pedido: ' + IntToStr(pmtPedido) + ' item: ' + IntToStr(pmtItem) + #13 +
                    'Emissão impossibilitada',mtError,[mbOk],0);
  end
  else begin     // Todas as etiquetas
    filAnt := uDM.PedItens.Filtered;
    filTxtAnt := uDM.PedItens.Filter;
    uDM.PedItens.Filtered := True;
    uDM.PedItens.Filter := 'TpProd=1 or TpProd=4';
    uDM.PedItens.Refresh;
    if uDM.PedItens.RecordCount > 0 then
    begin
      uDM.PedItens.First;
      SetRecordRangeLanche(1);      // rrAllRecords;
      if lPreview then
        FSFEuPrintFortes.RLEtiqLanche.Preview
      else
        FSFEuPrintFortes.RLEtiqLanche.Print;
    end;
    SetRecordRangeLanche(0);      // rrCurrentOnly;
    uDM.PedItens.Filter := 'TpProd=3';
    uDM.PedItens.Refresh;
    if uDM.PedItens.RecordCount > 0 then
    begin      // Imprime TODAS as bebidas em uma etiqueta
      uDM.PedItens.First;
      if lPreview then
        FSFEuPrintFortes.RLEtiqBebida.Preview
      else
        FSFEuPrintFortes.RLEtiqBebida.Print;
    end;
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
             else RLMais.Lines.Add(xExtra);
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
