unit SFuEtiqPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  IniFiles, Vcl.Mask;

type
  TFuEtiqPrincipal = class(TForm)
    PanTopo: TPanel;
    Label1: TLabel;
    LabConexao: TLabel;
    PanTurnos: TPanel;
    Label2: TLabel;
    cbTurnos: TComboBox;
    btUsarTurno: TBitBtn;
    btSair: TBitBtn;
    FDQPedidos: TFDQuery;
    DSPedidos: TDataSource;
    FDQPedidosLanctos: TIntegerField;
    FDQPedidosEtqImpressas: TIntegerField;
    FDQPedidosNomeCliente: TStringField;
    FDQPedidosTurno: TIntegerField;
    FDQPedidosPlaca: TStringField;
    FDQPedidosSitPagto: TIntegerField;
    FDQPedidosZC_SitPagto: TStringField;
    FDQPedidosZC_Impresso: TStringField;
    FDQPedidosNumero: TLongWordField;
    FDQPedidosValor: TBCDField;
    FDQLctos: TFDQuery;
    PanWork: TPanel;
    GridPedidos: TDBGrid;
    PanLctos: TPanel;
    PanCtle: TPanel;
    LabNRegs: TLabel;
    rgEtiqs: TRadioGroup;
    rgPagto: TRadioGroup;
    rgSenha: TRadioGroup;
    NavPedidos: TDBNavigator;
    btSelPadrao: TBitBtn;
    dbNumero: TDBEdit;
    Panel1: TPanel;
    btEtiqueta: TBitBtn;
    btTodas: TBitBtn;
    NavLctos: TDBNavigator;
    GridLctos: TDBGrid;
    DSLctos: TDataSource;
    LabLancamentos: TLabel;
    FDQLctosTpProd: TIntegerField;
    FDQLctosCodProd: TIntegerField;
    FDQLctosEtqImpressa: TIntegerField;
    FDQLctosZC_Descricao: TStringField;
    FDQLctosZC_Impressa: TStringField;
    FDQLctosNrLcto: TIntegerField;
    Timer1: TTimer;
    PanBtSelec: TPanel;
    btSelecionar: TBitBtn;
    FDQLctosZC_TpProd: TStringField;
    sbTamanhoForm: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btUsarTurnoClick(Sender: TObject);
    procedure FDQPedidosCalcFields(DataSet: TDataSet);
    procedure btSelecionarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btSelPadraoClick(Sender: TObject);
    procedure dbNumeroChange(Sender: TObject);
    procedure FDQLctosCalcFields(DataSet: TDataSet);
    procedure btEtiquetaClick(Sender: TObject);
    procedure btTodasClick(Sender: TObject);
    procedure cbTurnosEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sbTamanhoFormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuEtiqPrincipal: TFuEtiqPrincipal;
  wNrTurno: Integer;
  wrkIniFile: String;
  wIniFile: TIniFile;

  wOpcEtq,wOpcPgt,wOpcSen: Integer;
  wProporcao: String;
  wDiv,wMult: Integer;
  lBebidas,lMsgFinal,lAtlzDados,lModoExec: Boolean;
  lDebug: Boolean;
  nRegs: Integer;

implementation

{$R *.dfm}

uses uDados, uGenericas, FortesReportCtle, SFEuPrintFortes;

Function SelecionaPedidos(pmtTurno:Integer;pmtEtiqs:Integer;pmtPagto:Integer;pmtSenha:Integer): Integer;
// pmtTurno: Turno a ser utilizado
// pmtEtiqs: 0-Não impressas, 1-Impressas, 2-Todas
// pmtPagto: 0-NÃO pagos,     1-pagos,     2-Todos
// pmtSenha: 0-Sem senha,     1-Com senha, 2-Todos
var xCampos,xCondic,xVazio: String;
    nOcorr: Integer;
begin
  Result := 0;
  xVazio := chr(39) + chr(39);
  if pmtTurno = 0 then
  begin
    MessageDlg('Nro de turno não pode ser ZERO',mtError,[mbOk],0);
    Exit;
  end;
  with FuEtiqPrincipal do
  begin
    if FDQPedidos.Connection = Nil then
      FDQPedidos.Connection := uDM.FDC;
    FDQPedidos.Close;
    //
    xCampos := 'Numero, Lanctos, Valor, EtqImpressas, NomeCliente, Turno, Placa, SitPagto ';
    xCondic := 'Turno=' + IntToStr(pmtTurno);
    if pmtEtiqs <> 2 then
      xCondic := xCondic + ' and EtqImpressas=' + IntToStr(pmtEtiqs);
    if pmtPagto <> 2 then
      xCondic := xCondic + ' and SitPagto=' + IntToStr(pmtPagto);
    case pmtSenha of
      0:xCondic := xCondic + ' and Placa=' + xVazio;      // Sem senha
      1:xCondic := xCondic + ' and Placa<>' + xVazio;     // Com senha
    end;
    //
    FDQPedidos.SQL.Text := 'Select ' + xCampos +
                           ' from ' + uDM.Pedidos.TableName +
                           ' where ' + xCondic;
    FDQPedidos.Open;
    FDQPedidos.First;
    //
    Result := FDQPedidos.RecordCount;
    if Result > 0 then
      LabNRegs.Caption := IntToStr(Result) + ' pedidos relacionados'
    else
      LabNRegs.Caption := 'Não há pedidos relacionados';

  end;

end;

procedure TFuEtiqPrincipal.btSelPadraoClick(Sender: TObject);
begin
  if lAtlzDados then
  begin
    rgEtiqs.ItemIndex := 0;            // Etiquetas não impressas
    rgSenha.ItemIndex := 2;            // Todos
    rgPagto.ItemIndex := 1;            // Somente pedidos pagos
  end
  else begin
    rgEtiqs.ItemIndex := wOpcEtq;      // Cfe .ini
    rgSenha.ItemIndex := wOpcSen;      // Cfe .ini
    rgPagto.ItemIndex := wOpcPgt;      // Cfe .ini
  end;
  btSelecionarClick(nil);

end;

procedure TFuEtiqPrincipal.btTodasClick(Sender: TObject);
var lNaoImpressa: Boolean;
begin
  Timer1.Enabled := False;
  lNaoImpressa := False;
  if rgEtiqs.ItemIndex = 0 then
    lNaoImpressa := True;
  EmiteEtiquetas(FDQPedidosNumero.AsInteger,
                 0,               // TODOS os lançamentos
                 lNaoImpressa,    // pmtNaoImpressa:Boolean
                 False,           // pmtEtiqBebidas:Boolean      Ver .ini
                 lDebug);         // pmtDebug:Boolean);
  Timer1.Enabled := lAtlzDados;

end;

procedure TFuEtiqPrincipal.btEtiquetaClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  EmiteEtiquetas(FDQPedidosNumero.AsInteger,
                 FDQLctosNrLcto.AsInteger,
                 False,      // pmtNaoImpressa:Boolean
                 False,     // pmtEtiqBebidas:Boolean
                 lDebug);   // pmtDebug:Boolean);
  Timer1.Enabled := lAtlzDados;

end;

procedure TFuEtiqPrincipal.btSairClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;

end;

procedure TFuEtiqPrincipal.btSelecionarClick(Sender: TObject);
begin
  if wNrTurno = 0 then
    Exit;
  Timer1.Enabled := False;
  nRegs := SelecionaPedidos(wNrTurno,rgEtiqs.ItemIndex,rgPagto.ItemIndex,rgSenha.ItemIndex);
  PanBtSelec.BevelInner := bvNone;
  PanBtSelec.BevelOuter := bvRaised;
  PanBtSelec.Color := PanCtle.Color;
  btSelecionar.Font.Style := [];
  if PanWork.Visible = False then
    PanWork.Visible := True;
  Timer1.Enabled := lAtlzDados;

end;

procedure TFuEtiqPrincipal.btUsarTurnoClick(Sender: TObject);
var nPos,nTurno: Integer;
begin
  nPos := Pos(' ',cbTurnos.Text);
  if nPos <= 1 then
  begin
    MessageDlg('Indicação inválida',mtError,[mbOk],0);
    Exit;
  end;
  wNrTurno := StrToIntDef(Copy(cbTurnos.Text,1,nPos-1),0);
  if Pos('ABERTO',AnsiUpperCase(cbTurnos.Text)) > 0 then
  begin
    lAtlzDados := True;
    btSelecionar.Caption := 'Selecionar' + #13 + 'Atualizar';
    rgEtiqs.ItemIndex := 0;            // Etiquetas não impressas
    rgSenha.ItemIndex := 2;            // Todos
    rgPagto.ItemIndex := 1;            // Somente pedidos pagos
  end
  else begin
    lAtlzDados := False;
    btSelecionar.Caption := 'Selecionar';
    rgEtiqs.ItemIndex := wOpcEtq;      // Cfe .ini
    rgSenha.ItemIndex := wOpcSen;      // Cfe .ini
    rgPagto.ItemIndex := wOpcPgt;      // Cfe .ini
  end;
  btSelecionarClick(nil);
  FormResize(nil);
  Timer1.Enabled := lAtlzDados;

end;

procedure TFuEtiqPrincipal.cbTurnosEnter(Sender: TObject);
begin
  Timer1.Enabled := False;
  PanWork.Visible := False;

end;

procedure TFuEtiqPrincipal.dbNumeroChange(Sender: TObject);
var nrPedido: Integer;
    wCampos,wCondic: String;
begin
  GridLctos.Visible := False;
  btEtiqueta.Enabled := False;
  btTodas.Enabled := False;
  nrPedido := FDQPedidosNumero.AsInteger;
  if nrPedido = 0 then
    Exit;
  if not uDM.Pedidos.FindKey([nrPedido]) then
  begin
    MessageDlg('Pedido não encontrado [' + FDQPedidosNumero.AsString + ']',mtError,[mbOk],0);
    Exit;
  end;

  wCampos := 'Numero, TpProd, CodProd, EtqImpressa, NrLcto';
  wCondic := 'Numero=' + FDQPedidosNumero.AsString + ' and ' +
             '(TpProd=1 or TpProd=4 or TpProd=11 or TpProd=21 or TpProd=31 or TpProd=35';
  if lBebidas then
    wCondic := wCondic + ' or TpProd=3';
  wCondic := wCondic + ')';

  FDQLctos.Connection := uDM.FDC;
  FDQLctos.Close;
  FDQLctos.SQL.Text := 'Select ' + wCampos +
                       ' from ' + uDM.PedItens.TableName +
                       ' where ' + wCondic;
  FDQLctos.Open;
  FDQLctos.First;
  if FDQLctos.RecordCount > 0 then
    GridLctos.Visible := True;
  btEtiqueta.Enabled := GridLctos.Visible;
  btTodas.Enabled := GridLctos.Visible;
  FormResize(nil);

end;

procedure TFuEtiqPrincipal.FDQLctosCalcFields(DataSet: TDataSet);
begin
  if uDM.Itens.FindKey([FDQLctosTpProd.AsInteger,FDQLctosCodProd.AsInteger]) then
    FDQLctosZC_Descricao.AsString := stringReplace(uDM.ItensDescricao.AsString,'#',' ',[rfIgnoreCase, rfReplaceAll]);
  if FDQLctosTpProd.AsInteger = 4 then
    FDQLctosZC_Descricao.AsString := '* * * ' + FDQLctosZC_Descricao.AsString + ' * * *';
  if FDQLctosEtqImpressa.AsInteger <> 0 then
    FDQLctosZC_Impressa.AsString := 'P'                          // Fontname no grid=Wingdings 2
  else
    FDQLctosZC_Impressa.AsString := '';
  case FDQLctosTpProd.AsInteger of
    1:FDQLctosZC_TpProd.AsString := 'CQu';
    3:FDQLctosZC_TpProd.AsString := 'Beb';
    4:FDQLctosZC_TpProd.AsString := 'CQM';
    6:FDQLctosZC_TpProd.AsString := 'Div';
    11:FDQLctosZC_TpProd.AsString := 'Crp';
    15:FDQLctosZC_TpProd.AsString := 'Buf';
    21:FDQLctosZC_TpProd.AsString := 'Fri';
    31:FDQLctosZC_TpProd.AsString := 'Ham';
    35:FDQLctosZC_TpProd.AsString := 'Drk';
    else FDQLctosZC_TpProd.AsString := FDQLctosTpProd.AsString;
  end;


end;

procedure TFuEtiqPrincipal.FDQPedidosCalcFields(DataSet: TDataSet);
begin
  case FDQPedidosSitPagto.AsInteger of
    0:FDQPedidosZC_SitPagto.AsString := '';
    1:FDQPedidosZC_SitPagto.AsString := 'Pg';
    9:FDQPedidosZC_SitPagto.AsString := 'Ca';
    else FDQPedidosZC_SitPagto.AsString := FDQPedidosSitPagto.AsString;      // 2,3,4,5,6,7,8
  end;
  FDQPedidosZC_Impresso.AsString := '';
  if FDQPedidosEtqImpressas.AsInteger <> 0 then
    FDQPedidosZC_Impresso.AsString := 'P';

end;

procedure TFuEtiqPrincipal.FormActivate(Sender: TObject);
var txtAuxil: String;
    AA,MM,DD: Word;
    nPos: Integer;
begin
  PanTopo.Caption := 'Impressão de etiquetas';
  Application.ProcessMessages;
  if uDM = Nil then
  begin
    PanTopo.Caption := 'Conectando, aguarde...';
    Application.ProcessMessages;
    uDM := TuDM.Create(nil);
    if (uDM.sysNumId < 1) or (uDM.sysNumId > 9) or (uDM.sysCPUId = '') then
    begin
      MessageDlg('Erro de inicialização, verifique arquivo INI' + #13 +
                 'Estacao / Numero: Deve ser de 1 a 9' + #13 +
                 'Estacao / Nome: Identificacao da estacao de trabalho' + #13 +
                 'Aplicação não pode ser iniciada',
                 mtError,[mbOk],0);
      Halt(0);
    end;
    PanTopo.Caption := 'Impressão de etiquetas';
    LabConexao.Caption := uDM.FDC.Params[uDM.FDC.Params.IndexOfName('server')];
    Application.ProcessMessages;

    uDM.SisPessoa.Active := True;
    uDM.Turnos.Active    := True;
    uDM.Itens.Active     := True;
    uDM.Pedidos.Active   := True;
    uDM.PedItens.Active  := True;

    uDM.lDebug := False;
    if ObtemParametro('DEBUG') = 'S' then uDM.lDebug := True;
    //
    //FFRCtle.RLPreviewSetup1.ZoomFactor := StrToIntDef(ObtemParametro('FortesZoomFactor'),100);
    FGen.lSalvaForm := True;
    FGen.pathSalvaForm := ExtractFilePath(Application.ExeName);
    Form_Define(FuEtiqPrincipal);
    //
    cbTurnos.Items.Clear;
    uDM.Turnos.Last;
    while not uDM.Turnos.Bof do
    begin
      DecodeDate(uDM.TurnosDtHrInicio.AsDateTime,AA,MM,DD);
      txtAuxil := uDM.TurnosNrTurno.AsString + '    ' +
                  FormatDateTime('dd mmm yyyy  hh:nn', uDM.TurnosDtHrInicio.AsDateTime) +
                  '   ';
      if uDM.TurnosStatus.AsInteger > 0 then
      begin
        txtAuxil := txtAuxil + '-   ' + FormatDateTime('dd mmm yyyy  hh:nn', uDM.TurnosDtHrFim.AsDateTime);
        if uDM.TurnosStatus.AsInteger <> 1 then
          txtAuxil := txtAuxil + ' <<<<<';
      end
      else txtAuxil := txtAuxil + '(aberto)';
      cbTurnos.Items.Add(txtAuxil);
      if cbTurnos.items.Count > 31 then
        uDM.Turnos.First;
      uDM.Turnos.Prior;
    end;
    cbTurnos.ItemIndex := 0;
    //
    // Parametros específicos para SFEtiqServ
    wrkIniFile := ChangeFileExt(ParamStr(0), '.ini');
    wIniFile := TIniFile.Create(wrkIniFile);
    if not FileExists(wrkIniFile) then
    begin
      wIniFile.WriteBool('Etiquetas','AlteraSelecao',True);
      wIniFile.WriteInteger('Etiquetas','Selecao',0);
      wIniFile.WriteBool('Senhas','Visivel',True);
      wIniFile.WriteBool('Senhas','AlteraSelecao',True);
      wIniFile.WriteInteger('Senhas','Selecao',2);
      wIniFile.WriteBool('Pagamentos','Visivel',True);
      wIniFile.WriteBool('Pagamentos','AlteraSelecao',False);
      wIniFile.WriteInteger('Pagamentos','Selecao',1);
      wIniFile.WriteString('Config','Proporcao','3/5');
      wIniFile.WriteBool('Config','ExibeColunaLctos',True);
      wIniFile.WriteInteger('Config','TempoAtualizacao',10);
      wIniFile.WriteBool('Config','MensagemFinalizacao',True);
      wIniFile.WriteBool('Config','ModoExec',True);
      wIniFile.WriteBool('Itens','Bebidas',False);
    end;
    rgEtiqs.Enabled := wIniFile.ReadBool('Etiquetas','AlteraSelecao',True);
    rgEtiqs.ItemIndex := wIniFile.ReadInteger('Etiquetas','Selecao',0);      // 0-Não impressas, 1-Impressas, 2-Todas
    rgSenha.Visible := wIniFile.ReadBool('Senhas','Visivel',True);
    rgSenha.Enabled := wIniFile.ReadBool('Senhas','AlteraSelecao',True);
    rgSenha.ItemIndex := wIniFile.ReadInteger('Senhas','Selecao',2);         // 0-Sem senha, 1-Com senha, 2-Todos
    rgPagto.Visible := wIniFile.ReadBool('Pagamentos','Visivel',True);
    rgPagto.Enabled := wIniFile.ReadBool('Pagamentos','AlteraSelecao',True);
    rgPagto.ItemIndex := wIniFile.ReadInteger('Pagamentos','Selecao',1);     // 0-Não pagos, 1-Pagos, 2-Todos
    wProporcao := wIniFile.ReadString('Config','Proporcao','3/5');
    GridPedidos.Columns[5].Visible := wIniFile.ReadBool('Config','ExibeColunaLctos',True);
    nPos := Pos('/',wProporcao);
    if nPos = 0 then
    begin
      wMult := 3;
      wDiv := 5;
    end
    else begin
      wMult := StrToIntDef(Copy(wProporcao,1,nPos-1),3);
      wDiv := StrToIntDef(Copy(wProporcao,nPos+1,Length(wProporcao)-nPos),5);
    end;
    Timer1.Interval := wIniFile.ReadInteger('Config','TempoAtualizacao',10) * 1000;
    lMsgFinal := wIniFile.ReadBool('Config','MensagemFinalizacao',True);
    lModoExec := wIniFile.ReadBool('Config','ModoExec',True);             // True:Produção  False:Desenv
    lBebidas := wIniFile.ReadBool('Itens','Bebidas',False);

    wIniFile.Free;
    // Salva parametros iniciais
    wOpcEtq := rgEtiqs.ItemIndex;
    wOpcSen := rgSenha.ItemIndex;
    wOpcPgt := rgPagto.ItemIndex;
    lDebug := False;
    if ObtemParametro('DebugEtiqServ','N') = 'S' then
      lDebug := True;
    //
    if lModoExec then
      dbNumero.Visible := False;

  end;

end;

procedure TFuEtiqPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if uDM.FDC.Connected then
    uDM.FDC.Connected := False;
  Form_Salva(FuEtiqPrincipal);
  Application.Terminate;
  Exit;

end;

procedure TFuEtiqPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  Timer1.Enabled := False;
  if lMsgFinal then
    if MessageDlg('Finalizar aplicação?',mtConfirmation,[mbYes,mbNo],0,mbNo,['&Sim','&Não']) <> mrYes then
    begin
      CanClose := False;
      Timer1.Enabled := lAtlzDados;
    end;

end;

procedure TFuEtiqPrincipal.FormCreate(Sender: TObject);
begin
  wDiv := 6;
  wMult := 5;
  Height := Screen.Height - 80;
  Top := 10;
  Width := Screen.Width - 80;
  Left := (Screen.Width - Width) div 2;
  PanWork.BevelWidth := 1;
  PanLctos.BevelWidth := 1;
  GridLctos.Align := alClient;
  btSelecionar.Caption := 'Sel / Atlz';
  FormResize(nil);
  cbTurnos.Items.Clear;
  LabLancamentos.Caption := 'Sem lançamentos para' + #13 + 'impressão de etiquetas';

end;

procedure TFuEtiqPrincipal.FormResize(Sender: TObject);
begin
  GridPedidos.Width := (PanWork.Width div wDiv) * wMult;
  btEtiqueta.Width := (PanLctos.Width - 18) div 2;
  btEtiqueta.Caption := 'Imprimir' + #13 + '&Etiqueta';
  btEtiqueta.Left := 6;
  btTodas.Width := btEtiqueta.Width;
  btTodas.Caption := 'Imprimir'+ #13 + '&Todas etiquetas';
  btTodas.Left := btEtiqueta.Left + btEtiqueta.Width + 6;
  if GridPedidos.Columns[5].Visible then
    GridPedidos := DefineGrid(GridPedidos,[0.17, 0.15, 0.08, 0.08, 0.33, 0.09], 4, 0)
  else
    GridPedidos := DefineGrid(GridPedidos,[0.17, 0.15, 0.09, 0.09, 0.33], 4, 0);
  GridLctos := DefineGrid(GridLctos,[0.08, 0.12, 0.90], 2, 0);

end;

procedure TFuEtiqPrincipal.sbTamanhoFormClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  with FuEtiqPrincipal do
  begin
    Align := alNone;
    Height := Screen.Height - 80;
    Top := 10;
    Width := Screen.Width - 80;
    Left := (Screen.Width - Width) div 2;
    FormResize(nil);
  end;
  Timer1.Enabled := lAtlzDados;

end;

procedure TFuEtiqPrincipal.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  PanBtSelec.BevelInner := bvLowered;
  PanBtSelec.BevelOuter := bvLowered;
  PanBtSelec.Color := clYellow;
  btSelecionar.Font.Style := [fsBold,fsItalic,fsUnderline];
  btSelecionar.SetFocus;

end;

end.
