unit uImpressoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
  Procedure ImprimePedido(pNroPedido:Integer);
  Procedure GeraImprimeNFCe(pNroPedido:Integer);
  Procedure ImprimeCaixa(pSequencia: Integer);


type
  TFuImpressoes = class(TForm)
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
begin
  ShowMessage('Imprime fechamento de caixa');

end;

end.
