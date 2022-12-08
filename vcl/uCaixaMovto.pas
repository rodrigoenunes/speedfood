unit uCaixaMovto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, System.UITypes;
  Procedure CaixaMovimentacao(pAtual:Boolean=False);

type
  TFuCaixaMovto = class(TForm)
    PanTurnos: TPanel;
    Label1: TLabel;
    cbTurnos: TComboBox;
    btProsseguir: TBitBtn;
    btSair: TBitBtn;
    PanLanctos: TPanel;
    PanRodape: TPanel;
    DBNavigator1: TDBNavigator;
    LabNRegs: TLabel;
    GridLctos: TDBGrid;
    PanResumo: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    dbSdoIni: TDBEdit;
    dbEntradas: TDBEdit;
    dbSaidas: TDBEdit;
    dbSdoFinal: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    dbEQtd: TDBEdit;
    dbSQtd: TDBEdit;
    btRecalc1: TBitBtn;
    Label17: TLabel;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label16: TLabel;
    btFechar: TBitBtn;
    btResumo: TBitBtn;
    btIncluir: TBitBtn;
    btImprimir: TBitBtn;
    btAlterar: TBitBtn;
    btRecalc2: TBitBtn;
    btExcluir: TBitBtn;
    BitBtn7: TBitBtn;
    PanManutLcto: TPanel;
    LabOperacao: TLabel;
    btManutOk: TBitBtn;
    btManutCan: TBitBtn;
    dbOperacao: TDBRadioGroup;
    dbMeio: TDBRadioGroup;
    edValor: TDBEdit;
    Label2: TLabel;
    edHistorico: TDBEdit;
    Label3: TLabel;
    gbDetal: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edReais: TDBEdit;
    edCDeb: TDBEdit;
    edCCred: TDBEdit;
    edPIX: TDBEdit;
    edOutros: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btProsseguirClick(Sender: TObject);
    procedure PanTurnosEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btRecalc1Click(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btResumoClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btManutCanClick(Sender: TObject);
    procedure dbOperacaoClick(Sender: TObject);
    procedure btManutOkClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuCaixaMovto: TFuCaixaMovto;
  xTurno: String;

implementation

{$R *.dfm}

uses uDados, uGenericas, uCaixa;

Procedure CaixaMovimentacao(pAtual:Boolean=False);
begin
  FuCaixaMovto := TFuCaixaMovto.Create(nil);
  with FuCaixaMovto
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
    if pAtual then
      cbTurnos.Enabled := False             // Somente movto do dia
    else
      cbTurnos.Enabled := True;             // Todas as datas disponiveis
    ShowModal;
  end;
  FuCaixaMovto.Free;

end;


procedure TFuCaixaMovto.btRecalc1Click(Sender: TObject);
begin
  GridLctos.Visible := False;
  CalculaSaldoCaixa(uDM.RegCaixaTurno.AsInteger);
  GridLctos.Visible := True;

end;

procedure TFuCaixaMovto.btResumoClick(Sender: TObject);
begin
  PanTurnos.Enabled := False;
  PanRodape.Enabled := False;
  PanResumo.Top  := 40;
  PanResumo.Left := 80;
  PanResumo.Visible := True;
  btRecalc1.SetFocus;

end;

procedure TFuCaixaMovto.btAlterarClick(Sender: TObject);
begin
  if uDM.LctCaixa.RecordCount = 0 then Exit;
  if uDM.LctCaixaOperacao.AsInteger = 0 then
  begin
    MessageDlg('Para alterar o saldo inicial utilize a "Abertura do caixa"',mtWarning,[mbOk],0);
    Exit;
  end;
  {
  if uDM.LctCaixaTipo.AsString <> 'M' then
  begin
    MessageDlg('Lançamento automático, alteração não permitida',mtError,[mbOk],0);
    Exit;
  end;
  }
  Try
    uDM.LctCaixa.Edit;
  Except
    MessageDlg('Registro em uso, tente mais tarde',mtWarning,[mbOk],0);
    Exit;
  End;
  PanTurnos.Enabled    := False;
  PanRodape.Enabled    := False;
  PanManutLcto.Top     := 40;
  PanManutLcto.Left    := 80;
  PanManutLcto.Width   := 560;
  PanManutLcto.Visible := True;
  dbMeio.Visible       := False;
  gbDetal.Visible      := False;
  if uDM.LctCaixaOperacao.AsInteger = 1 then
  begin
    dbMeio.Visible := True;
    if uDM.LctCaixaMeioPgt.AsInteger = 5 then
      gbDetal.Visible := True;
   end;
  btManutCan.SetFocus;

end;

procedure TFuCaixaMovto.btExcluirClick(Sender: TObject);
begin
  if uDM.LctCaixa.RecordCount = 0 then Exit;
  if uDM.LctCaixaTipo.AsString <> 'M' then
  begin
    MessageDlg('Lançamento automático, exclusão não permitida',mtError,[mbOk],0);
    Exit;
  end;
  if MessageDlg('Excluir lançamento ?',mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) <> mrYes then Exit;

end;

procedure TFuCaixaMovto.btFecharClick(Sender: TObject);
begin
  PanTurnos.Enabled := True;
  PanRodape.Enabled := True;
  PanResumo.Visible := False;

end;

procedure TFuCaixaMovto.btIncluirClick(Sender: TObject);
var nSeq: Integer;
begin
  uDM.LctCaixa.Last;
  nSeq := uDM.LctCaixaSequencia.AsInteger + 1;
  uDM.LctCaixa.Append;
  uDM.LctCaixaTurno.AsInteger := uDM.RegCaixaTurno.AsInteger;
  uDM.LctCaixaSequencia.AsInteger := nSeq;
  uDM.LctCaixaOperacao.AsInteger := -1;

  PanTurnos.Enabled    := False;
  PanRodape.Enabled    := False;
  PanManutLcto.Top     := 40;
  PanManutLcto.Left    := 80;
  PanManutLcto.Width   := 560;
  PanManutLcto.Visible := True;
  dbMeio.Visible       := False;
  gbDetal.Visible      := False;
  dbOperacao.SetFocus;

end;

procedure TFuCaixaMovto.btManutCanClick(Sender: TObject);
begin
  uDM.LctCaixa.Cancel;
  PanManutLcto.Visible := False;
  PanTurnos.Enabled    := True;
  PanRodape.Enabled    := True;

end;

procedure TFuCaixaMovto.btManutOkClick(Sender: TObject);
begin
  if dbOperacao.ItemIndex <> 0 then
  begin
    uDM.LctCaixaMeioPgt.AsInteger := 0;
    uDM.LctCaixaPgtReais.AsCurrency := uDM.LctCaixaValor.AsCurrency;
    uDM.LctCaixaPgtCDeb.Clear;
    uDM.LctCaixaPgtCCred.Clear;
    uDM.LctCaixaPgtPIX.Clear;
    uDM.LctCaixaPgtOutros.Clear;
  end;
  uDM.LctCaixa.Post;
  PanManutLcto.Visible := False;

end;

procedure TFuCaixaMovto.btProsseguirClick(Sender: TObject);
var i,nTurno: Integer;
begin
  i := Pos(' ',cbTurnos.Text) - 1;
  nTurno := StrToIntDef(Copy(cbTurnos.Text,1,i),0);
  if nTurno = 0 then
  begin
    MessageDlg('Turno inválido [' + Copy(cbTurnos.Text,1,i) + ']',mtError,[mbOk],0);
    btSair.SetFocus;
    Exit;
  end;
  if not uDM.RegCaixa.FindKey([nTurno])
  then begin
    MessageDlg('Turno inexistente [' + Copy(cbTurnos.Text,1,i) + ']',mtError,[mbOk],0);
    btSair.SetFocus;
    Exit;
  end;
  //
  uDM.LctCaixa.Refresh;
  uDM.LctCaixa.First;
  LabNRegs.Caption := IntToStr(uDM.LctCaixa.RecordCount) + ' lanctos';
  PanLanctos.Visible := True;
  FormResize(nil);

end;

procedure TFuCaixaMovto.btSairClick(Sender: TObject);
begin
  FuCaixaMovto.Close;

end;

procedure TFuCaixaMovto.dbOperacaoClick(Sender: TObject);
begin
  if dbOperacao.ItemIndex = 0 then
  begin
    dbMeio.Visible := True;
  end
  else begin
    dbMeio.Visible  := False;
    gbDetal.Visible := False;
  end;
end;

procedure TFuCaixaMovto.FormResize(Sender: TObject);
begin
  GridLctos := DefineGrid(GridLctos,[0.03, 0.05, 0.07, 0.05, 0.08, 0.33, 0.07, 0.07, 0.07, 0.07, 0.07, 0.05, 0.10], 5, 0);

end;

procedure TFuCaixaMovto.FormShow(Sender: TObject);
begin
  FuCaixaMovto.Align := alClient;
  FormResize(nil);
  btProsseguir.SetFocus;

end;

procedure TFuCaixaMovto.PanTurnosEnter(Sender: TObject);
begin
  PanLanctos.Visible := False;

end;

end.
