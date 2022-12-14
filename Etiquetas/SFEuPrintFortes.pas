unit SFEuPrintFortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TFSFEuPrintFortes = class(TForm)
    RLEtiqueta: TRLReport;
    RLDetalhe: TRLBand;
    RLLabel4: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    RLPanel1: TRLPanel;
    RLDBText3: TRLDBText;
    RLPanel2: TRLPanel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLPanel3: TRLPanel;
    RLDBText4: TRLDBText;
    RLPanel4: TRLPanel;
    RLPanel5: TRLPanel;
    RLLabel1: TRLLabel;
    RLSem: TRLMemo;
    RLPanel6: TRLPanel;
    RLLabel2: TRLLabel;
    RLMais: TRLMemo;
    RLPanel7: TRLPanel;
    RLLabel3: TRLLabel;
    RLMenos: TRLMemo;
    RLNadaSem: TRLImage;
    RLNadaMais: TRLImage;
    RLNadaMenos: TRLImage;
    procedure RLEtiquetaBeforePrint(Sender: TObject; var PrintIt: Boolean);
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

procedure TFSFEuPrintFortes.RLEtiquetaBeforePrint(Sender: TObject; var PrintIt: Boolean);
var i: Integer;
    AllExtras,xExtra: String;
begin
  with FSFEuPrintFortes
  do begin
    RLSem.Lines.Clear;
    RLMais.Lines.Clear;
    RLMenos.Lines.Clear;
    AllExtras := uDM.EtqItensExtras.AsString;
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
   end;

end;

end.
