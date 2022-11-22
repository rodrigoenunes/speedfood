unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFuPrincipal = class(TForm)
    Image1: TImage;
    btSuporte: TBitBtn;
    btSair: TBitBtn;
    btAbrirCaixa: TBitBtn;
    btPedidos: TBitBtn;
    procedure btSairClick(Sender: TObject);
    procedure btSuporteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAbrirCaixaClick(Sender: TObject);
    procedure btPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuPrincipal: TFuPrincipal;
  wPathWork: String;

implementation

{$R *.dfm}

uses uItens, uDados, uGenericas, uCaixa, uPedidos;

procedure TFuPrincipal.btAbrirCaixaClick(Sender: TObject);
begin
  AberturaDeCaixa;

end;

procedure TFuPrincipal.btPedidosClick(Sender: TObject);
begin
  LancamentoPedidos;

end;

procedure TFuPrincipal.btSairClick(Sender: TObject);
begin
  uDM.PedItens.Active := False;
  uDM.Pedidos.Active := False;
  uDM.LctCaixa.Active := False;
  uDM.RegCaixa.Active := False;
  uDM.Itens.Active := False;
  uDM.FDC.Connected := False;
  //
  Application.Terminate;

end;

procedure TFuPrincipal.btSuporteClick(Sender: TObject);
begin
  ManutencaoProdutos;
  ContaExtras;

end;

procedure TFuPrincipal.FormActivate(Sender: TObject);
begin
  if uDM = Nil then
  begin
    uDM := TuDM.Create(nil);
    uDM.FDC.Connected := True;
    uDM.Itens.Active := True;
    uDM.RegCaixa.Active := True;
    uDM.LctCaixa.Active := True;
    uDM.Pedidos.Active := True;
    uDM.PedItens.Active := True;
    FGen.lSalvaForm := True;
    FGen.pathSalvaForm := wPathWork;
    uDM.pathWork := wPathWork;
    ContaExtras;                  // Obtem qtd de ítens 'extras'
    AberturaDeCaixa(False);

  end;

end;

procedure TFuPrincipal.FormCreate(Sender: TObject);
begin
  wPathWork := ExtractFilePath(Application.ExeName);
  FuPrincipal.Width := Screen.Width div 3;
  FuPrincipal.Height := FuPrincipal.Width;
  FuPrincipal.Top := 20;
  FuPrincipal.Left := 40;
  FuPrincipal.Image1.Align := alClient;
  FuPrincipal.Image1.Picture.LoadFromFile(wPathWork + 'ImgFundo.BMP');
  FuPrincipal.Image1.Stretch := True;

end;

end.
