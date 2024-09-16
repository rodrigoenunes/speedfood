unit uTeclado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Touch.Keyboard, Vcl.StdCtrls,
  Vcl.Mask;
  Function Teclado(pTop,pLeft:Integer; pTipo:String): String;

type
  TFuTeclado = class(TForm)
    edInform: TMaskEdit;
    LabInform: TLabel;
    Teclado: TTouchKeyboard;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuTeclado: TFuTeclado;

implementation

{$R *.dfm}

Function Teclado(pTop,pLeft:Integer; pTipo:String): String;
begin
  FuTeclado  := TFuTeclado.Create(nil);
  with FuTeclado
  do begin
    Teclado.Layout  := pTipo;
    if pTipo = 'NumPad' then
    begin
      ClientWidth     := 196;
      ClientHeight    := 280;  //188;
      Teclado.Width   := 180;
      Teclado.Height  := 180;
    end
    else begin
      ClientWidth     := 576;
      ClientHeight    := 280; //188;
      Teclado.Width   := 560;
      Teclado.Height  := 180;
    end;
    Teclado.Top     := 54;
    Teclado.Left    := 8;
  end;

end;


end.
