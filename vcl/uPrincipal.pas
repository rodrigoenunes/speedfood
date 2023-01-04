unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Midaslib;

type
  TFuPrincipal = class(TForm)
    Image1: TImage;
    btSuporte: TBitBtn;
    btSair: TBitBtn;
    btAbrirCaixa: TBitBtn;
    btPedidos: TBitBtn;
    btUsuario: TBitBtn;
    btAdmin: TBitBtn;
    PanTurno: TPanel;
    LabInicio: TLabel;
    LabFinal: TLabel;
    LabTurno: TLabel;
    btConsPedidos: TBitBtn;
    procedure btSairClick(Sender: TObject);
    procedure btSuporteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAbrirCaixaClick(Sender: TObject);
    procedure btPedidosClick(Sender: TObject);
    procedure btUsuarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConsPedidosClick(Sender: TObject);
    procedure btAdminClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuPrincipal: TFuPrincipal;

implementation

{$R *.dfm}

uses uItens, uDados, uGenericas, uCaixa, uPedidos, uImpressoes, uUsuario,
  uConsPedidos, FortesReportCtle, uAdministrativo;

procedure TFuPrincipal.btAbrirCaixaClick(Sender: TObject);
begin
  AberturaDeCaixa(True);

end;

procedure TFuPrincipal.btAdminClick(Sender: TObject);
begin
  Administrativo;

end;

procedure TFuPrincipal.btConsPedidosClick(Sender: TObject);
begin
  ConsultarPedidos;

end;

procedure TFuPrincipal.btPedidosClick(Sender: TObject);
begin
  if ObtemParametro('UsaCorItem') = 'S' then uDM.usaCorItem := True
     else uDM.usaCorItem := False;
  uDM.topLanche := StrToIntDef(ObtemParametro('TelaPedidoTopLanche'),44);
  uDM.topBebida := StrToIntDef(ObtemParametro('TelaPedidoTopBebida'),52);
  uDM.topExtra  := StrToIntDef(ObtemParametro('TelaPedidoTopExtra'),16);
  uDM.leftExtra := StrToIntDef(ObtemParametro('TelaPedidoLeftExtra'),20);

  LancamentoPedidos;

end;

procedure TFuPrincipal.btSairClick(Sender: TObject);
begin
{
  CalculaSaldoCaixa(uDM.RegCaixaTurno.AsInteger);
  if MessageDlg('Imprimir fechamento de caixa ?',mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
     then ImprimeCaixa(uDM.RegCaixaTurno.AsInteger);
}
  FuPrincipal.Close;

end;

procedure TFuPrincipal.btSuporteClick(Sender: TObject);
begin
  ManutencaoProdutos;
  ContaExtras;

end;

procedure TFuPrincipal.btUsuarioClick(Sender: TObject);
begin
  ManutencaoUsuario;

end;

procedure TFuPrincipal.FormActivate(Sender: TObject);
var arqimg: String;
    i: Integer;
begin
  if uDM = Nil then
  begin
    uDM := TuDM.Create(nil);
    uDM.FDC.Connected    := True;
    uDM.SisPessoa.Active := True;
    uDM.Itens.Active     := True;
    uDM.RegCaixa.Active  := True;
    uDM.LctCaixa.Active  := True;
    uDM.Pedidos.Active   := True;
    uDM.PedItens.Active  := True;
    Image1.Visible       := False;
    uDM.pathImagens      := IncludeTrailingPathDelimiter(uDM.SisPessoaPathImagens.AsString);
    arqimg               := uDM.pathImagens + 'ImgFundo.BMP';
    if FileExists(arqimg)
    then begin
      Image1.Picture.LoadFromFile(arqimg);
      Image1.Align   := alClient;
      Image1.Stretch := True;
      Image1.Visible := True;
    end;
    FGen.lSalvaForm := True;
    FGen.pathSalvaForm := ExtractFilePath(Application.ExeName);
    FFRCtle.RLPreviewSetup1.ZoomFactor := StrToIntDef(ObtemParametro('FortesZoomFactor'),100);
    ContaExtras;                  // Obtem qtd de ítens 'extras'
    AberturaDeCaixa;

  end;

end;

procedure TFuPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  uDM.PedItens.Active  := False;
  uDM.Pedidos.Active   := False;
  uDM.LctCaixa.Active  := False;
  uDM.RegCaixa.Active  := False;
  uDM.Itens.Active     := False;
  uDM.SisPessoa.Active := False;
  uDM.FDC.Connected    := False;
  //
  Application.Terminate;

end;

procedure TFuPrincipal.FormCreate(Sender: TObject);
begin
  FuPrincipal.Width  := (Screen.Width div 5) * 2;
  FuPrincipal.Height := FuPrincipal.Width;
  FuPrincipal.Top    := 20;
  FuPrincipal.Left   := 40;
  FuPrincipal.Image1.Visible := False;

end;

end.
