unit SFEuPrintFortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;
  procedure SetaRegsEtqLanches(pmtModo:Integer);

type
  TFSFEuPrintFortes = class(TForm)
    RLEtiqLanche: TRLReport;
    RLDetLanche: TRLBand;
    RLDBMemo1: TRLDBMemo;
    RLPanel3: TRLPanel;
    RLDBText4: TRLDBText;
    RLPanel4: TRLPanel;
    RLPanel5: TRLPanel;
    RLSem: TRLMemo;
    RLPanel6: TRLPanel;
    RLMais: TRLMemo;
    RLPanel7: TRLPanel;
    RLMenos: TRLMemo;
    RLNadaSem: TRLImage;
    RLNadaMais: TRLImage;
    RLNadaMenos: TRLImage;
    RLAngleLabel1: TRLAngleLabel;
    RLAngleLabel2: TRLAngleLabel;
    RLAngleLabel3: TRLAngleLabel;
    RLEtiqBebida: TRLReport;
    RLCabBeb: TRLBand;
    RLPanel8: TRLPanel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLPanel9: TRLPanel;
    RLDBText7: TRLDBText;
    RLCabLanche: TRLBand;
    RLPanel2: TRLPanel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLPanel1: TRLPanel;
    RLDBText3: TRLDBText;
    RLDetBebida: TRLBand;
    RLBebFooter: TRLBand;
    RLBebColFooter: TRLBand;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBText9: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabPrensado: TRLLabel;
    RLLabCortado: TRLLabel;
    procedure RLEtiqLancheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSFEuPrintFortes: TFSFEuPrintFortes;

implementation

{$R *.dfm}

uses uDados;

procedure SetaRegsEtqLanches(pmtModo:Integer);
begin
  if pmtModo = 1 then
    FSFEuPrintFortes.RLEtiqLanche.RecordRange := rrAllRecords
  else
    FSFEuPrintFortes.RLEtiqLanche.RecordRange := rrCurrentOnly;

end;

procedure TFSFEuPrintFortes.RLEtiqLancheBeforePrint(Sender: TObject; var PrintIt: Boolean);
var i: Integer;
    AllExtras,xExtra: String;
    wImgVazio: String;
begin
  with FSFEuPrintFortes
  do begin
    wImgVazio := ObtemParametro('imgVazio');
    if FileExists(wImgVazio) then
    begin
      RLNadaSem.Picture.LoadFromFile(wImgVazio);
      RLNadaMais.Picture.LoadFromFile(wImgVazio);
      RLNadaMenos.Picture.LoadFromFile(wImgVazio);
    end;
    RLSem.Lines.Clear;
    RLMais.Lines.Clear;
    RLMenos.Lines.Clear;
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
    if RLSem.Lines.Count = 0 then
      RLNadaSem.Visible := True;
    if RLMais.Lines.count = 0 then
      RLNadaMais.Visible := True;
    if RLMenos.Lines.Count = 0 then
      RLNadaMenos.Visible := True;
    if uDM.PedItensPrensado.AsInteger <> 0 then
      RLLabPrensado.Visible := True;
    if uDM.PedItensCortado.AsInteger <> 0 then
      RLLabCortado.Visible := True;

   end;

end;

end.
