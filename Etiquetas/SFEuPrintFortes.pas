unit SFEuPrintFortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLPrinters, RLRichText;
  procedure SetRecordRangeLanche(pModo:Integer);
  procedure DefinePrinterEtiqueta;

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
    RLDBText4: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText5: TRLDBText;
    RLDbPedido: TRLDBText;
    RLDBText8: TRLDBText;
    RLRodapeLanche: TRLBand;
    RLDbCliente: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText6: TRLDBText;
    RLPanSemMaisMenos: TRLPanel;
    RLLabSem: TRLLabel;
    RLLabMais: TRLLabel;
    RLLabMenos: TRLLabel;
    RLSem: TRLMemo;
    RLMais: TRLMemo;
    RLMenos: TRLMemo;
    RLBand1: TRLBand;
    RLDbClienteBeb: TRLDBText;
    RLDBText13: TRLDBText;
    RLColBebida: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
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
  lPreview,lDialog,lEtqFixa: Boolean;
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
    if AnsiUpperCase(ObtemParametro('EtiquetaFixa')) = 'S'  then
      lEtqFixa := True
    else
      lEtqFixa := False;
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


procedure TFSFEuPrintFortes.RLDetLancheBeforePrint(Sender: TObject; var PrintIt: Boolean);
var i,wLeft,nCols: Integer;
    AllExtras,xExtra: String;
begin
  if uDM.PedItensZC_PrensCort.AsString <> '' then
    RLPanDescr.Height := 37
  else
    RLPanDescr.Height := 20;
  if uDM.PedidosNomeCliente.AsString <> '' then
    RLDbCliente.Visible := True
  else
    RLDbCliente.Visible := False;
  //
  AllExtras := uDM.PedItensExtras.AsString;
  RLSem.Lines.Clear;
  RLMais.Lines.Clear;
  RLMenos.Lines.Clear;
  for i := 1 to 24 do
    if AllExtras[i] <> '.' then
      if uDM.Itens.FindKey([2,i])
      then begin
        xExtra := uDM.ItensDescricao.AsString;
        if AllExtras[i] = '0' then RLSem.Lines.Add(xExtra)
        else if AllExtras[i] = '+' then RLMais.Lines.Add(xExtra)
             else RLMenos.Lines.Add(xExtra);
      end;
  nCols := 0;
  wLeft := 0;

  if lEtqFixa then
  begin              // Sempre imprime "SEM" "MAIS" "MENOS"
    RLLabSem.Left := 0;
    RLLabSem.Visible := True;
    RLSem.Left := RLLabSem.Left;
    RLSem.Visible := True;
    RLSem.Font.Size := 11;
    if RLSem.Lines.Count > 8 then
      RLSem.Font.Size := 10;
    RLDraw1.Visible := True;

    RLLabMais.Left := 122;
    RLLabMais.Visible := True;
    RLMais.Left := RLLabMais.Left;
    RLMais.Visible := True;
    RLMais.Font.Size := 11;
    if RLMais.Lines.Count > 8 then
      RLMais.Font.Size := 10;
    RLDraw2.Visible := True;

    RLLabMenos.Visible := True;
    RLLabMenos.Left := 244;
    RLMenos.Visible := True;
    RLMenos.Left := RLLabMenos.Left;
    if RLMenos.Lines.Count > 8 then
      RLMenos.Font.Size := 10;
  end
  else begin                 // Imprime somente "SEM" "MAIS" "MENOS" necrssários
    RLLabSem.Visible := False;
    RLSem.Visible := False;
    if RLSem.Lines.Count > 0 then
    begin
      RLLabSem.Left := wLeft;
      RLLabSem.Visible := True;
      RLSem.Left := wLeft;
      RLSem.Visible := True;
      wLeft := wLeft + 122;
      RLSem.Font.Size := 11;
      if RLSem.Lines.Count > 8 then
        RLSem.Font.Size := 10;
      nCols := nCols + 1;
    end;
    RLLabMais.Visible := False;
    RLMais.Visible := False;
    if RLMais.Lines.Count > 0 then
    begin
      RLLabMais.Left := wLeft;
      RLLabMais.Visible := True;
      RLMais.Left := wLeft;
      RLMais.Visible := True;
      wLeft := wLeft + 122;
      RLMais.Font.Size := 11;
      if RLMais.Lines.Count > 8 then
        RLMais.Font.Size := 10;
      nCols := nCols + 1;
    end;
    RLLabMenos.Visible := False;
    RLMenos.Visible := False;
    if RLMenos.Lines.Count > 0 then
    begin
      RLLabMenos.Left := wLeft;
      RLLabMenos.Visible := True;
      RLMenos.Left := wLeft;
      RLMenos.Visible := True;
      RLMenos.Font.Size := 11;
      if RLMenos.Lines.Count > 8 then
        RLMenos.Font.Size := 10;
      nCols := nCols + 1;
    end;
    RLDraw1.Visible := False;
    RLDraw2.Visible := False;
    if nCols > 0 then
      RLDraw1.Visible := True;
    if nCols > 1 then
      RLDraw2.Visible := True;
  end;
  RLDraw1.Height := RLPanSemMaisMenos.Height;
  RLDraw2.Height := RLPanSemMaisMenos.Height;

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
