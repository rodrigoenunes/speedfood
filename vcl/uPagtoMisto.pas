unit uPagtoMisto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Touch.Keyboard;
  Procedure PagamentoMisto(pmtTop,pmtLeft,pmtHeight,pmtWidth:Integer;
                           var pmtReais,pmtCCred,pmtCDeb,pmtPIX,pmtOutros: Currency);

type
  TFuPagtoMisto = class(TForm)
    PanTopo: TPanel;
    PanRodape: TPanel;
    btFechar: TBitBtn;
    PanValor: TPanel;
    Label1: TLabel;
    PanVlrRestante: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    btMais: TBitBtn;
    btMenos: TBitBtn;
    PanValores: TPanel;
    LabRestante: TLabel;
    PanPgto: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edValor: TDBEdit;
    dbFormaPgto: TDBRadioGroup;
    DBGrid1: TDBGrid;
    NavWrk: TDBNavigator;
    PanLeft: TPanel;
    PanRight: TPanel;
    btConfValor: TBitBtn;
    DBText2: TDBText;
    Teclado: TTouchKeyboard;
    procedure btFecharClick(Sender: TObject);
    procedure btMaisClick(Sender: TObject);
    procedure dbFormaPgtoClick(Sender: TObject);
    procedure btConfValorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btMenosClick(Sender: TObject);
    procedure edValorEnter(Sender: TObject);
    procedure edValorExit(Sender: TObject);
    procedure edValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuPagtoMisto: TFuPagtoMisto;
  vlrInfo,vlrRestante: Currency;
  vlReais,vlCCred,vlCDeb,vlPIX,vlOutros: Currency;

implementation

{$R *.dfm}

uses uDados;

Procedure PagamentoMisto(pmtTop,pmtLeft,pmtHeight,pmtWidth:Integer;
                            var pmtReais,pmtCCred,pmtCDeb,pmtPIX,pmtOutros: Currency);
begin
  FuPagtoMisto := TFuPagtoMisto.Create(nil);
  with FuPagtoMisto
  do begin
    Top := pmtTop;
    Left := pmtLeft;
    Height := pmtHeight;
    Width := pmtWidth;
    PanValor.Width := PanTopo.Width div 2;
    vlrInfo := 0;
    vlrRestante := uDM.PedidosValor.AsCurrency;
    LabRestante.Caption := FloatToStrF(vlrRestante,ffNumber,15,2);
    PanVlrRestante.Color := clRed;
    uDM.DetpagWrk.EmptyDataSet;
    ShowModal;
    pmtReais := vlReais;
    pmtCCred := vlCCred;
    pmtCDeb := vlCDeb;
    pmtPIX := vlPIX;
    pmtOutros := vlOutros;
  end;

  FuPagtoMisto.Free;
end;


procedure TFuPagtoMisto.btConfValorClick(Sender: TObject);
var wSeq: Integer;
begin
  if uDM.DetpagWrkValor.AsCurrency > vlrRestante
  then begin
    MessageDlg('Valor informado excede o valor pendente, reinforme',mtError,[mbOk],0);
    edValor.SetFocus;
    Exit;
  end;
  //
  uDM.DetpagWrk.Post;
  wSeq := uDM.DetpagWrkSeq.AsInteger;
  uDM.DetpagWrk.First;
  vlrInfo := 0;
  while not uDM.DetpagWrk.Eof do
  begin
    vlrInfo := vlrInfo + uDM.DetpagWrkValor.AsCurrency;
    uDM.DetpagWrk.Next;
  end;
  uDM.DetpagWrk.FindKey([wSeq]);
  vlrRestante := uDM.PedidosValor.AsCurrency - vlrInfo;
  LabRestante.Caption := FloatToStrF(vlrRestante,ffNumber,15,2);
  if vlrRestante > 0 then
  begin
    PanVlrRestante.Color := clRed;
    btMaisClick(nil);
    Exit;
  end;
  PanVlrRestante.Color := $0000FF80;
  PanPgto.Enabled := False;
  PanRodape.Enabled := True;
  btFechar.SetFocus;

end;

procedure TFuPagtoMisto.btFecharClick(Sender: TObject);
var nPag: Integer;
begin
  vlReais := 0;
  vlCCred := 0;
  vlCDeb := 0;
  vlPIX := 0;
  vlOutros := 0;
  uDM.DetpagWrk.First;
  while not uDM.DetpagWrk.Eof do
  begin
    nPag := StrToIntDef(uDM.DetpagWrktPag.AsString,99);
    case nPag of
      1:vlReais := vlReais + uDM.DetpagWrkValor.AsCurrency;         // Dinheiro
      3:vlCCred := vlCCred + uDM.DetpagWrkValor.AsCurrency;         // C.Credito
      4:vlCDeb := vlCDeb + uDM.DetpagWrkValor.AsCurrency;           // C.Debito
      17:vlPIX := vlPIX + uDM.DetpagWrkValor.AsCurrency;            // PIX
      else vlOutros := vlOutros + uDM.DetpagWrkValor.AsCurrency;    // Outros
    end;
    uDM.DetpagWrk.Next;
  end;
  FuPagtoMisto.Close;

end;

procedure TFuPagtoMisto.btMaisClick(Sender: TObject);
var nSeq: Integer;
begin
  uDM.DetpagWrk.Last;
  nSeq := uDM.DetpagWrkSeq.AsInteger + 1;
  uDM.DetpagWrk.Append;
  uDM.DetpagWrkSeq.AsInteger := nSeq;
  uDM.DetpagWrkValor.AsCurrency := vlrRestante;
  uDM.DetpagWrktPag.AsString := '';
  PanRodape.Enabled := False;
  PanPgto.Enabled := True;
  edValor.SetFocus;

end;

procedure TFuPagtoMisto.btMenosClick(Sender: TObject);
var wSeq: Integer;
begin
  if MessageDlg('Excluir valor ?',mtCOnfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) <> mrYes
     then Exit;
  uDM.DetpagWrk.Delete;
  wSeq := uDM.DetpagWrkSeq.AsInteger;
  uDM.DetpagWrk.First;
  vlrInfo := 0;
  while not uDM.DetpagWrk.Eof do
  begin
    vlrInfo := vlrInfo + uDM.DetpagWrkValor.AsCurrency;
    uDM.DetpagWrk.Next;
  end;
  uDM.DetpagWrk.FindKey([wSeq]);
  vlrRestante := uDM.PedidosValor.AsCurrency - vlrInfo;
  LabRestante.Caption := FloatToStrF(vlrRestante,ffNumber,15,2);
  PanVlrRestante.Color := clRed;

end;

procedure TFuPagtoMisto.dbFormaPgtoClick(Sender: TObject);
begin
  SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPagtoMisto.edValorEnter(Sender: TObject);
var tvLeft,tvTop: Integer;
begin
  tvLeft := edValor.Left + edValor.Width + 4;
  tvTop := 8;
  Teclado.Visible := uDM.SisPessoaTecladoVirtual.AsBoolean;

end;

procedure TFuPagtoMisto.edValorExit(Sender: TObject);
begin
  Teclado.Visible := False;

end;

procedure TFuPagtoMisto.edValorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_Return then SelectNext((Sender as TwinControl), True, True);

end;

procedure TFuPagtoMisto.FormActivate(Sender: TObject);
begin
  btMaisClick(nil);

end;

end.
