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
    RLDbClienteBeb: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabSem: TRLLabel;
    RLLabMais: TRLLabel;
    RLLabMenos: TRLLabel;
    RLSem: TRLMemo;
    RLMais: TRLMemo;
    RLMenos: TRLMemo;
    RLLabel3: TRLLabel;
    RLPanel1: TRLPanel;
    RLDBText4: TRLDBText;
    RLDbCliente: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDbPedido: TRLDBText;
    RLDbPlaca: TRLDBText;
    RLDBText8: TRLDBText;
    RLDbPlacaBeb: TRLDBText;
    procedure RLEtiqLancheBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLEtiqBebidaBeforePrint(Sender: TObject; var PrintIt: Boolean);
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


procedure TFSFEuPrintFortes.RLEtiqBebidaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  with FSFEuPrintFortes
  do begin
    if uDM.PedidosNomeCliente.AsString <> '' then
      RLDbClienteBeb.Visible := True
    else
      RLDbClienteBeb.Visible := False;
    if uDM.PedidosPlaca.AsString <> '' then
      RLDbPlacaBeb.Visible := True
    else
      RLDbPlacaBeb.Visible := False;
  end;

end;

procedure TFSFEuPrintFortes.RLEtiqLancheBeforePrint(Sender: TObject; var PrintIt: Boolean);
var i: Integer;
    AllExtras,xExtra: String;
begin
  with FSFEuPrintFortes
  do begin
    if uDM.PedidosPlaca.AsString <> '' then
       RLDbPlaca.Visible := True
    else
       RLDbPlaca.Visible := False;

    if uDM.PedidosNomeCliente.AsString <> '' then
      RLDbCliente.Visible := True
    else
      RLDbCliente.Visible := False;
    //
    AllExtras := uDM.PedItensExtras.AsString;
    for i := 1 to 24 do
      if AllExtras[i] <> '.' then
         if uDM.Itens.FindKey([2,i])
         then begin
           xExtra := uDM.ItensDescricao.AsString;
           if AllExtras[i] = '0' then RLSem.Lines.Add(xExtra)
           else if AllExtras[i] = '+' then RLMais.Lines.Add(xExtra)
                else RLMenos.Lines.Add(xExtra);
         end;

    RLLabSem.Visible := False;
    RLSem.Visible := False;
    if RLSem.Lines.Count > 0 then
    begin
      RLLabSem.Visible := True;
      RLSem.Visible := True;
    end;
    RLLabMais.Visible := False;
    RLMais.Visible := False;
    if RLMais.Lines.Count > 0 then
    begin
      RLLabMais.Visible := True;
      RLMais.Visible := True;
    end;
    RLLabMenos.Visible := False;
    RLMenos.Visible := False;
    if RLMenos.Lines.Count > 0 then
    begin
      RLLabMenos.Visible := True;
      RLMenos.Visible := True;
    end;

   end;

end;

end.
