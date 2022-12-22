unit uConsPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFuConsPedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GridPed: TDBGrid;
    NavPed: TDBNavigator;
    btImprimePed: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btImprimePedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuConsPedidos: TFuConsPedidos;

implementation

{$R *.dfm}

uses uDados, uImpressoes;

procedure TFuConsPedidos.btImprimePedClick(Sender: TObject);
begin
  if uDM.Pedidos.RecordCount = 0 then Exit;
  ImprimePedido(uDM.PedidosNumero.AsInteger);

end;

procedure TFuConsPedidos.FormShow(Sender: TObject);
begin
  uDM.Pedidos.Last;

end;

end.
