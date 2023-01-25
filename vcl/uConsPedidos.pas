unit uConsPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;
  Procedure ConsultarPedidos;

type
  TFuConsPedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GridPed: TDBGrid;
    NavPed: TDBNavigator;
    btImprimir: TBitBtn;
    btEmitirNFCe: TBitBtn;
    btSair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btEmitirNFCeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuConsPedidos: TFuConsPedidos;

implementation

{$R *.dfm}

uses uDados, uImpressoes, uGenericas;

Procedure ConsultarPedidos;
begin
  FuConsPedidos := TFuConsPedidos.Create(nil);
  FuConsPedidos.Height := Screen.Height - 60;
  FuConsPedidos.Top := 10;
  FuConsPedidos.Width := Trunc(Screen.Width * 0.60);
  FuConsPedidos.Left := 40;
  FuConsPedidos.ShowModal;
  FuConsPedidos.Free;

end;

procedure TFuConsPedidos.btEmitirNFCeClick(Sender: TObject);
var xImpressao: String;
begin
  if uDM.Pedidos.RecordCount = 0 then Exit;
  xImpressao := 'N';
  if uDM.PedidosNrNFCe.AsInteger > 0 then xImpressao := 'S'
  else if MessageDlg('Geração / Emissão de NFCe' + #13 +
                     'Pedido: ' + uDM.PedidosNumero.AsString + #13 +
                     'Valor: ' + FloatToStrF(uDM.PedidosValor.AsCurrency,ffNumber,15,2) + #13 +
                     'Meio pagamento: ' + uDM.PedidosZC_MPExtenso.AsString,
                     mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
       then xImpressao := 'S';
  if xImpressao = 'S' then
     EmiteNFCe(uDM.PedidosNumero.AsInteger);

end;

procedure TFuConsPedidos.btImprimirClick(Sender: TObject);
begin
  if uDM.Pedidos.RecordCount = 0 then Exit;
  ImprimePedido(uDM.PedidosNumero.AsInteger);  //, False);

end;

procedure TFuConsPedidos.btSairClick(Sender: TObject);
begin
  FuConsPedidos.Close;

end;

procedure TFuConsPedidos.FormResize(Sender: TObject);
begin
  if FuConsPedidos.Width < 670 then FuConsPedidos.Width := 670;
  if FuConsPedidos.Height < 480 then FuConsPedidos.Height := 480;
  GridPed := DefineGrid(GridPed,[0.08,0.15,0.06,0.10,0.33,0.05,0.06,0.08,0.04],4,0);

end;

procedure TFuConsPedidos.FormShow(Sender: TObject);
begin
  uDM.Pedidos.Last;

end;

end.
