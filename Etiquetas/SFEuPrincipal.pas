unit SFEuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFuPrincipalEtq = class(TForm)
    PanTurnos: TPanel;
    Label1: TLabel;
    cbTurnos: TComboBox;
    btProsseguir: TBitBtn;
    btSair: TBitBtn;
    btCarrega: TBitBtn;
    Panel1: TPanel;
    GridEtqs: TDBGrid;
    LabNrEtqs: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btCarregaClick(Sender: TObject);
    procedure btProsseguirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuPrincipalEtq: TFuPrincipalEtq;
  wPathWork: String;

implementation

{$R *.dfm}

uses uDados;

procedure CarregaTurnos;
var xTurno: String;
begin
  with FuPrincipalEtq
  do begin
    cbTurnos.Clear;
    uDM.RegCaixa.Last;
    while not uDM.RegCaixa.Bof do
    begin
      xTurno := uDM.RegCaixaTurno.AsString + '  ' +
                uDM.RegCaixaDtHrInicio.AsString + ' - ' + uDM.RegCaixaDtHrFim.AsString;
      cbTurnos.AddItem(xTurno,nil);
      uDM.RegCaixa.Prior;
    end;
    cbTurnos.ItemIndex := 0;
  end;

end;

procedure TFuPrincipalEtq.btCarregaClick(Sender: TObject);
begin
  CarregaTurnos;

end;

procedure TFuPrincipalEtq.btProsseguirClick(Sender: TObject);
var nPos: Integer;
    xTurno,txtSQL: String;
begin
  nPos := Pos(' ',cbTurnos.Text);
  xTurno := Copy(cbTurnos.Text,1,nPos-1);
  if StrToIntDef(xTurno,-1) < 0 then
  begin
    MessageDlg('Erro na informação do turno, reinforme',mtError,[mbOk],0);
    cbTurnos.SetFocus;
    Exit;
  end;
  //
  uDM.EtqItens.Filtered := True;
  uDM.EtqItens.Filter := 'Turno=' + xTurno + ' and TpProd=1 and EtqImpressa=0';
  uDM.EtqItens.Active := True;
  LabNrEtqs.Caption := 'Etiquetas à imprimir: ' + intToStr(uDM.EtqItens.RecordCount);
  GridEtqs.Visible := True;

{
  uDM.FDQuery1.SQL.Clear;
  txtSQL := 'Select * from com_pedidoitem where turno = ' + xTurno +
            ' and  etqimpressa = 0 and tpprod = 1';
  uDM.FDQuery1.sql.Add(txtSQL);
  uDM.FDQuery1.Active := True;
  nPos :=uDM.fdquery1.RecordCount;
  SHowMessage('Regs: ' + intToStr(nPos));
}
end;

procedure TFuPrincipalEtq.btSairClick(Sender: TObject);
begin
  FuPrincipalEtq.Close;

end;

procedure TFuPrincipalEtq.FormActivate(Sender: TObject);
begin
  if uDM = Nil then
  begin
    uDM := TuDM.Create(nil);
    uDM.FDC.Connected    := True;
    uDM.SisPessoa.Active := True;
    uDM.Itens.Active     := True;
    uDM.RegCaixa.Active  := True;
    uDM.pathWork         := wPathWork;
  end;
  CarregaTurnos;

end;

procedure TFuPrincipalEtq.FormCreate(Sender: TObject);
begin
  wPathWork := ExtractFilePath(Application.ExeName);
  //FuPrincipalEtq.Align := alClient;

end;

end.
