unit U_SpeedFood;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
  FMX.StdCtrls, FMX.Controls.Presentation;

type
  TF_SpeedFood = class(TForm)
    pNav: TPanel;
    Panel1: TPanel;
    bPVs: TButton;
    Panel2: TPanel;
    Button2: TButton;
    Prd: TButton;
    bGP: TButton;
    procedure Button1Click(Sender: TObject);
    procedure bPVsResize(Sender: TObject);
    procedure PrdResize(Sender: TObject);
    procedure bGPResize(Sender: TObject);
    procedure bGPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_SpeedFood: TF_SpeedFood;

implementation

{$R *.fmx}

uses U_Grupoproduto;

procedure TF_SpeedFood.bGPClick(Sender: TObject);
begin
  if FGrupoproduto = Nil then
    Application.CreateForm(TFGrupoproduto, FGrupoproduto);
  FGrupoproduto.Show;

end;

procedure TF_SpeedFood.bGPResize(Sender: TObject);
begin
  With TButton(Sender) Do
  if Width > 50 then
    Text:= 'Grupo de Produtos'
  Else
    Text:= 'GPrd';
end;

procedure TF_SpeedFood.bPVsResize(Sender: TObject);
begin
  With TButton(Sender) Do
  if Width > 50 then
    Text:= 'Pedidos de Vendas'
  Else
    Text:= 'PVs';
end;

procedure TF_SpeedFood.Button1Click(Sender: TObject);
begin
  if pNav.Width = 50 then
    pNav.Width:= 150
  Else
    pNav.Width:= 50;
end;

procedure TF_SpeedFood.PrdResize(Sender: TObject);
begin
  With TButton(Sender) Do
  if Width > 50 then
    Text:= 'Produtos'
  Else
    Text:= 'Prd';

end;

end.
