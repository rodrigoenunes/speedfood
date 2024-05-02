unit uHelpSpeedFood;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;
  Procedure AjudaSpeedFood(pTpAjuda:Integer; pModo:Boolean = False);

type
  TFuHelpSpeedFood = class(TForm)
    PanCtle: TPanel;
    PanTexto: TPanel;
    Memo1: TMemo;
    btSalvar: TBitBtn;
    btSair: TBitBtn;
    procedure btSairClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuHelpSpeedFood: TFuHelpSpeedFood;
  arqTexto: String;

implementation

{$R *.dfm}

Procedure AjudaSpeedFood(pTpAjuda:Integer; pModo:Boolean = False);
begin
  //FuHelpSpeedFood := TFuHelpSpeedFood.Create(nil);
  with FuHelpSpeedFood
  do begin
    Top := 20;
    Height := Screen.Height - 60;
    Left := 40;
    Width := Screen.Width div 2 + 20;
    Caption := 'Ajuda SpeedFood - ';
    Memo1.Lines.Clear;
    Memo1.ReadOnly := True;
    btSalvar.Visible := False;
    case pTpAjuda of
      1:begin           // Ajuda Parametros
          arqTexto := 'HelpGeral.Txt';
          Caption := Caption + 'Parametros gerais do sistema (' + arqTexto + ')';
        end;
      2:begin           // Ajuda ARGOX
          arqTexto := 'HelpArgox.Txt';
          Caption := Caption + 'Etiquetas / Argox2140 (' + arqTexto + ')';
        end;
    end;
    if FileExists(arqTexto) then
      Memo1.Lines.LoadFromFile(arqTexto)
    else
      pModo := True;
    if pModo then
    begin
      Memo1.ReadOnly := False;
      btSalvar.Visible := True;
    end;
    ShowModal;
    //Free;
  end;

end;

procedure TFuHelpSpeedFood.btSairClick(Sender: TObject);
begin
  FuHelpSpeedFood.Close;

end;

procedure TFuHelpSpeedFood.btSalvarClick(Sender: TObject);
begin
  Memo1.Lines.SaveToFile(arqTexto);

end;

end.
