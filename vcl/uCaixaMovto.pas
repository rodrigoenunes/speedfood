unit uCaixaMovto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, System.UITypes;
  Procedure CaixaMovimentacao(pTodasDatas:Boolean=True);

type
  TFuCaixaMovto = class(TForm)
    PanTurnos: TPanel;
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
    btRecalcular: TBitBtn;
    btExcluir: TBitBtn;
    btSair2: TBitBtn;
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
    sbAnterior: TSpeedButton;
    sbAtual: TSpeedButton;
    sbProximo: TSpeedButton;
    GroupBox3: TGroupBox;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    LabIdCaixa: TLabel;
    cbTurnoCaixa: TCheckBox;
    PanSaldo: TPanel;
    Label1: TLabel;
    Label23: TLabel;
    edSaldoInicial: TDBEdit;
    btGravaSaldo: TBitBtn;
    btCancSaldo: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btProsseguirClick(Sender: TObject);
    procedure PanTurnosEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btResumoClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btManutCanClick(Sender: TObject);
    procedure dbOperacaoClick(Sender: TObject);
    procedure btManutOkClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure edValorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbMeioClick(Sender: TObject);
    procedure btRecalcularClick(Sender: TObject);
    procedure sbAtualClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure cbTurnosChange(Sender: TObject);
    procedure cbTurnosEnter(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btSair2Click(Sender: TObject);
    procedure cbTurnoCaixaClick(Sender: TObject);
    procedure btGravaSaldoClick(Sender: TObject);
    procedure btCancSaldoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuCaixaMovto: TFuCaixaMovto;
  wTurnos,wSeqs: TStringList;
  lProsseguiu: Boolean;
  wrkTurno,wrkCxSeq: Integer;

implementation

{$R *.dfm}

uses uDados, uGenericas, uCaixa, uImpressoes;

Procedure CaixaMovimentacao(pTodasDatas:Boolean=True);
// pTodos
var turnoTxt: String;
begin
  lProsseguiu := False;
  wTurnos := TStringList.Create;
  wSeqs := TStringList.Create;
  with FuCaixaMovto
  do begin
    LabIdCaixa.Caption := 'Caixa: ' + IntToStr(uDM.sysNrCaixa)  +  ' /Seq: ' + IntToStr(uDM.sysCaixaSeq) +
                          '  [' + uDM.sysCPUId + '-' + IntToStr(uDM.sysNumId) + ']' +
                          stringFiller(' ',15) + 'Turno atual: ' + IntToStr(uDM.turnoCorrente);
    cbTurnos.Clear;
    uDM.RegCaixa.Last;
    while not uDM.RegCaixa.Bof do
    begin
      turnoTxt := 'T:' + stringCompleta(uDM.RegCaixaTurno.AsString,'E',' ',5) +
                  ' Seq:' + stringCompleta(uDM.RegCaixaCaixaSeq.AsString,'E',' ',3) + ' [ ' +
                  DataHoraString(uDM.RegCaixaDtHrInicio.AsDateTime,2,4) + ' ] [ ';
      if uDM.RegCaixaSituacao.AsString <> 'F' then
        turnoTxt := turnoTxt + '... aberto ... ]'
      else
        turnoTxt := turnoTxt + DataHoraString(uDM.RegCaixaDtHrFim.AsDateTime,2,4) + ' ]';
      cbTurnos.AddItem(turnoTxt,nil);
      wTurnos.Add(uDM.RegCaixaTurno.AsString);
      wSeqs.Add(uDM.RegCaixaCaixaSeq.AsString);
      if not pTodasDatas then
         uDM.RegCaixa.First;
      uDM.RegCaixa.Prior;
    end;
    cbTurnos.ItemIndex := 0;
    //cbTurnos.Enabled := pTodasDatas;     // Se TODOS=True Todas as datas,  senão Somente o último
    ShowModal;
  end;
  wTurnos.Free;
  wSeqs.Free;

end;


Procedure PreparaTelaLanctos(pOcultaExibe:Boolean);
begin
  with FuCaixaMovto
  do begin
    PanTurnos.Enabled := pOcultaExibe;
    PanRodape.Enabled := pOcultaExibe;
    GridLctos.Enabled := pOcultaExibe;
  end;

end;


procedure TFuCaixaMovto.btRecalcularClick(Sender: TObject);
begin
  GridLctos.Visible := False;
  CalculaSaldoCaixa(wrkTurno, uDM.sysNrCaixa, wrkCxSeq, False);
  GridLctos.Visible := True;

end;

procedure TFuCaixaMovto.btResumoClick(Sender: TObject);
begin
  btRecalcularClick(nil);
  PanTurnos.Enabled := False;
  PanRodape.Enabled := False;
  PanResumo.Top     := 40;
  PanResumo.Left    := 80;
  PanResumo.Visible := True;
  btFechar.SetFocus;

end;

procedure TFuCaixaMovto.btAlterarClick(Sender: TObject);
begin
  if uDM.LctCaixa.RecordCount = 0 then Exit;
  if ((uDM.LctCaixaTipo.AsString = 'A') or  (uDM.LctCaixaOperacao.AsInteger = 0))
     and (not uDM.sysAltLctos) then
  begin
    MessageDlg('Lançamento automático ou informação de saldo inicial' + #13 +
               'Alteração não permitida [CaixaAltLctos]',mtError,[mbOk],0);
    Exit;
  end;
  //
  Try
    uDM.LctCaixa.Edit;
  Except
    MessageDlg('Registro em uso, tente mais tarde',mtWarning,[mbOk],0);
    Exit;
  End;
  //
  PreparaTelaLanctos(False);
  if uDM.LctCaixaOperacao.AsInteger = 0 then
  begin                          // Alteração de saldo incial
    PanSaldo.Top := 40;
    PanSaldo.Left := 80;
    PanSaldo.Visible := True;
    btCancSaldo.SetFocus;
  end
  else begin                     // Alteração de lançamento
    LabOperacao.Caption := 'Alteração';
    PanManutLcto.Top := 40;
    PanManutLcto.Left := 80;
    PanManutLcto.Width := 560;
    dbOperacao.Enabled := False;
    if uDM.LctCaixaOperacao.AsInteger = 1 then
      dbMeio.Visible := True
    else
      dbMeio.Visible := False;
    gbDetal.Visible := dbMeio.Visible;
    PanManutLcto.Visible := True;
    btManutCan.SetFocus;
  end;

end;

procedure TFuCaixaMovto.btCancSaldoClick(Sender: TObject);
begin
  uDM.LctCaixa.Cancel;
  PanSaldo.Visible := False;
  PreparaTelaLanctos(True);

end;

procedure TFuCaixaMovto.btExcluirClick(Sender: TObject);
begin
  if uDM.LctCaixa.RecordCount = 0 then Exit;
  if uDM.LctCaixaOperacao.AsInteger = 0 then
  begin
    MessageDlg('"Saldo inicial não pode ser excluído',mtWarning,[mbOk],0);
    Exit;
  end;
  if uDM.LctCaixaTipo.AsString = 'A' then
  begin
    if not uDM.sysAltLctos then     // NÃO tem permissão para alterar/excluir lançamento automaticos
    begin
      MessageDlg('Lançamento automático, exclusão não permitida',mtError,[mbOk],0);
      Exit;
    end;
  end;
  if MessageDlg('Excluir lançamento ?',mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) <> mrYes then Exit;
  uDM.LctCaixa.Delete;
  uDM.LctCaixa.Refresh;

end;

procedure TFuCaixaMovto.btFecharClick(Sender: TObject);
begin
  PanTurnos.Enabled := True;
  PanRodape.Enabled := True;
  PanResumo.Visible := False;

end;

procedure TFuCaixaMovto.btGravaSaldoClick(Sender: TObject);
begin
  uDM.LctCaixaSaldo.AsCurrency := uDM.LctCaixaValor.AsCurrency;
  uDM.LctCaixa.Post;
  PanSaldo.Visible := False;
  PreparaTelaLanctos(True);
  btRecalcularClick(nil);

end;

procedure TFuCaixaMovto.btImprimirClick(Sender: TObject);
begin
  btRecalcularClick(nil);
  ImprimeCaixa(wrkTurno, uDM.sysNrCaixa, wrkCxSeq);

end;

procedure TFuCaixaMovto.btIncluirClick(Sender: TObject);
var nSeq: Integer;
begin
  uDM.LctCaixa.Last;
  nSeq := uDM.LctCaixaLctoSeq.AsInteger + 1;
  uDM.LctCaixa.Append;
  uDM.LctCaixaNrCaixa.AsInteger := uDM.sysNrCaixa;
  uDM.LctCaixaCaixaSeq.AsInteger := wrkCxSeq;
  uDM.LctCaixaLctoSeq.AsInteger := nSeq;
  uDM.LctCaixaOperacao.AsInteger := -1;
  uDM.LctCaixaTipo.AsString := 'M';          // Manual
  PreparaTelaLanctos(False);
  LabOperacao.Caption := 'Inclusão';
  PanManutLcto.Top := 40;
  PanManutLcto.Left := 80;
  PanManutLcto.Width := 560;
  dbOperacao.Enabled := True;
  PanManutLcto.Visible := True;
  dbOperacao.SetFocus;

end;

procedure TFuCaixaMovto.btManutCanClick(Sender: TObject);
begin
  uDM.LctCaixa.Cancel;
  PanManutLcto.Visible := False;
  PreparaTelaLanctos(True);

end;

procedure TFuCaixaMovto.btManutOkClick(Sender: TObject);
begin
  if uDM.LctCaixaValor.AsCurrency <> uDM.LctCaixaZC_SomaMP.AsCurrency then
  begin
    MessageDlg('Soma dos meios de pagamento difere do valor total',mtError,[mbOk],0);
    edReais.SetFocus;
    Exit;
  end;
  uDM.LctCaixa.Post;
  PanManutLcto.Visible := False;
  PreparaTelaLanctos(True);
  btRecalcularClick(nil);

end;

procedure TFuCaixaMovto.btProsseguirClick(Sender: TObject);
var i: Integer;
    xIdTurno: String;
begin
  i := cbTurnos.ItemIndex;
  wrkTurno := StrToIntDef(wTurnos[i],0);
  wrkCxSeq := StrToIntDef(wSeqs[i],0);
  xIdTurno := ' [T:' + wTurnos[i] + ' Cx:' + IntToStr(uDM.sysNrCaixa) + ' Sq:' + wSeqs[i] + ']';
  if (wrkTurno = 0) or (wrkCxSeq = 0) then
  begin
    MessageDlg('Turno/Caixa/CxSeq inválido' + xIdTurno,mtError,[mbOk],0);
    btSair.SetFocus;
    Exit;
  end;
  if not uDM.RegCaixa.FindKey([wrkTurno,uDM.sysNrCaixa,wrkCxSeq])
  then begin
    MessageDlg('Turno/Caixa/Seq não encontrado' + xIdTurno,mtError,[mbOk],0);
    btSair.SetFocus;
    Exit;
  end;
  //
  btIncluir.Enabled := True;
  if cbTurnos.ItemIndex <> 0 then
    btIncluir.Enabled := False;
  btAlterar.Enabled := btIncluir.Enabled;
  btExcluir.Enabled := btIncluir.Enabled;

  uDM.LctCaixa.Refresh;
  uDM.LctCaixa.Last;
  LabNRegs.Caption := IntToStr(uDM.LctCaixa.RecordCount) + ' lanctos';
  PanLanctos.Visible := True;
  FormResize(nil);
  btRecalcularClick(nil);
  lProsseguiu := True;

end;

procedure TFuCaixaMovto.btSair2Click(Sender: TObject);
begin
  FuCaixaMovto.Close;

end;

procedure TFuCaixaMovto.btSairClick(Sender: TObject);
begin
  FuCaixaMovto.Close;

end;

procedure TFuCaixaMovto.cbTurnoCaixaClick(Sender: TObject);
begin
  FuCaixaMovto.FormResize(nil);

end;

procedure TFuCaixaMovto.cbTurnosChange(Sender: TObject);
begin
  if cbTurnos.ItemIndex = 0 then
    btIncluir.Enabled := True       // Permite lançamentos no caixa corrente
  else
    btIncluir.Enabled := False;
  btAlterar.Enabled := btIncluir.Enabled;
  btExcluir.Enabled := btIncluir.Enabled;
  btProsseguir.SetFocus;


end;

procedure TFuCaixaMovto.cbTurnosEnter(Sender: TObject);
begin
  PanLanctos.Visible := False;

end;

procedure TFuCaixaMovto.dbMeioClick(Sender: TObject);
begin
  gbDetal.Enabled := False;
  uDM.LctCaixaPgtReais.Clear;
  uDM.LctCaixaPgtCDeb.Clear;
  uDM.LctCaixaPgtCCred.Clear;
  uDM.LctCaixaPgtPIX.Clear;
  uDM.LctCaixaPgtOutros.Clear;
  case dbMeio.ItemIndex of
    0:uDM.LctCaixaPgtReais.AsCurrency  := uDM.LctCaixaValor.AsCurrency;
    1:uDM.LctCaixaPgtCDeb.AsCurrency   := uDM.LctCaixaValor.AsCurrency;
    2:uDM.LctCaixaPgtCCred.AsCurrency  := uDM.LctCaixaValor.AsCurrency;
    3:uDM.LctCaixaPgtPIX.AsCurrency    := uDM.LctCaixaValor.AsCurrency;
    4:uDM.LctCaixaPgtOutros.AsCurrency := uDM.LctCaixaValor.AsCurrency;
    5:gbDetal.Enabled := True;
  end;

end;

procedure TFuCaixaMovto.dbOperacaoClick(Sender: TObject);
begin
  dbMeio.Enabled  := False;
  gbDetal.Enabled := False;
  case dbOperacao.ItemIndex of
    0:begin
      dbMeio.Enabled := True;
      gbDetal.Enabled := True;
      if (uDM.LctCaixaHistorico.AsString = '') or
         (uDM.LctCaixaHistorico.AsString = 'Suprimento') or
         (uDM.LctCaixaHistorico.AsString = 'Pagar') or
         (uDM.LctCaixaHistorico.AsString = 'Sangria')
       then
         uDM.LctCaixaHistorico.AsString := 'Receber ';
    end;
    1:begin
      uDM.LctCaixaHistorico.AsString := 'Suprimento';
    end;
    2:begin
      if (uDM.LctCaixaHistorico.AsString = '') or
         (uDM.LctCaixaHistorico.AsString = 'Suprimento') or
         (uDM.LctCaixaHistorico.AsString = 'Receber') or
         (uDM.LctCaixaHistorico.AsString = 'Sangria')
      then
         uDM.LctCaixaHistorico.AsString := 'Pagar ';
    end;
    3:begin
      uDM.LctCaixaHistorico.AsString := 'Sangria';
    end;
  end;

end;

procedure TFuCaixaMovto.edValorExit(Sender: TObject);
begin
  if uDM.LctCaixaOperacao.AsInteger <> 1 then
  begin
    uDM.LctCaixaPgtReais.AsCurrency := uDM.LctCaixaValor.AsCurrency;
    uDM.LctCaixaPgtCDeb.Clear;
    uDM.LctCaixaPgtCCred.Clear;
    uDM.LctCaixaPgtPIX.Clear;
    uDM.LctCaixaPgtOutros.Clear;
    uDM.LctCaixaMeioPgt.AsInteger := 0;
  end;

end;

procedure TFuCaixaMovto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if lProsseguiu then
  begin
    GridLctos.Visible := False;
    //CalculaSaldoCaixa(uDM.RegCaixaTurno.AsInteger);
    GridLctos.Visible := True;
  end;

end;

procedure TFuCaixaMovto.FormResize(Sender: TObject);
begin
  if FuCaixaMovto.Width < 995 then FuCaixaMovto.Width := 995;
  if FuCaixaMovto.Height < 550 then FuCaixaMovto.Width := 550;
  cbTurnos.Width := Trunc(FuCaixaMovto.Width * 0.60);
  if cbTurnos.Width < 530 then cbTurnos.Width := 530
  else if cbTurnos.Width > 800 then cbTurnos.Width := 800;
  sbAnterior.Left := cbTurnos.Left + cbTurnos.Width + 6;
  sbAtual.Left := sbAnterior.Left + sbAnterior.Width + 5;
  sbProximo.Left := sbAtual.Left + sbAtual.Width + 5;
  if cbTurnoCaixa.Checked then
  begin
    GridLctos.Columns[0].Visible := True;
    GridLctos.Columns[1].Visible := True;
    GridLctos := DefineGrid(GridLctos,[0.03, 0.04, 0.04, 0.05, 0.07, 0.05, 0.08, 0.33, 0.07, 0.07, 0.07, 0.07, 0.07, 0.05, 0.10], 7, 0);
  end
  else begin
    GridLctos.Columns[0].Visible := False;
    GridLctos.Columns[1].Visible := False;
    GridLctos := DefineGrid(GridLctos,[0.00, 0.04, 0.04, 0.05, 0.07, 0.05, 0.08, 0.33, 0.07, 0.07, 0.07, 0.07, 0.07, 0.05, 0.10], 7, 0);
  end;
  //GridLctos := DefineGrid(GridLctos,[0.03, 0.05, 0.03, 0.05, 0.07, 0.05, 0.08, 0.33, 0.07, 0.07, 0.07, 0.07, 0.07, 0.05, 0.10], 7, 0);

end;

procedure TFuCaixaMovto.FormShow(Sender: TObject);
begin
  FuCaixaMovto.Align := alClient;
  FormResize(nil);
  cbTurnosChange(nil);

end;

procedure TFuCaixaMovto.PanTurnosEnter(Sender: TObject);
begin
  PanLanctos.Visible := False;

end;

procedure TFuCaixaMovto.sbAnteriorClick(Sender: TObject);
begin
  PanLanctos.Visible := False;
  if cbTurnos.ItemIndex < (cbTurnos.Items.Count-1) then
    cbTurnos.ItemIndex := cbTurnos.ItemIndex + 1;

end;

procedure TFuCaixaMovto.sbAtualClick(Sender: TObject);
begin
  PanLanctos.Visible := False;
  cbTurnos.ItemIndex := 0;

end;

procedure TFuCaixaMovto.sbProximoClick(Sender: TObject);
begin
  PanLanctos.Visible := False;
  if cbTurnos.ItemIndex > 0 then
    cbTurnos.ItemIndex := cbTurnos.ItemIndex - 1;

end;

end.
