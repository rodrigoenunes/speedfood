unit uImpressoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, System.UITypes, RLPrinters;
  Procedure ImprimePedido(pNroPedido:Integer);
  Procedure GeraImprimeNFCe(pNroPedido:Integer);
  Procedure ImprimeCaixa(pSequencia: Integer);


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
    procedure RLCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuImpressoes: TFuImpressoes;

implementation

{$R *.dfm}

uses uDados, uBiblioteca;


Procedure ImprimePedido(pNroPedido:Integer);
begin
  ShowMessage('Imprime pedido nr: ' + IntToStr(pNroPedido));

end;

Procedure GeraImprimeNFCe(pNroPedido:Integer);
begin
  With uBiblioteca.EmitirNFCeDePV(1, uDM.Pedidos.FieldByName('numero').AsInteger ) Do
  Begin
    if Not Resultado then
    Begin
      ShowMessage(Mensagem);
      Exit;
    End;
  End;


end;

Procedure ImprimeCaixa(pSequencia: Integer);
var nAltura,tmPagina: Integer;
    tmMax: Integer;
    idPrinter: String;
begin
  if not uDM.RegCaixa.FindKey([pSequencia]) then
  begin
    MessageDlg('Registro de caixa Turno ' + IntToStr(pSequencia) + ' não encontrado',mtError,[mbOk],0);
    Exit;
  end;
  tmMax := StrToIntDef(ObtemParametro('CaixaTamMax'),300);
  idPrinter := ObtemParametro('CaixaPrinter');

  uDM.LctCaixa.Refresh;
  with FuImpressoes
  do begin
    nAltura := RLCx_Cabec.Height + RLCx_Cols.Height +
               (uDM.LctCaixa.RecordCount * RLCx_Detal.Height) +
               RLCx_Sum.Height + 60;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 100 then tmPagina := 100;
    if tmPagina > tmMax then tmPagina := tmMax;
    RLCaixa.PageSetup.PaperHeight := tmPagina;
    RLPrinters.RLPrinter.PrinterName := idPrinter;

    RLCaixa.Preview;

  end;

end;

procedure TFuImpressoes.RLCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin


  RLLabEmis.Caption := 'Emissão: ' + DateTimeToStr(Now);

end;

end.
