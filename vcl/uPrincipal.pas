unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Midaslib, DateUtils,
  System.UITypes, ShellAPI;

type
  TFuPrincipal = class(TForm)
    Image1: TImage;
    btManutencao: TBitBtn;
    btSair: TBitBtn;
    btCaixa: TBitBtn;
    btPedidos: TBitBtn;
    btUsuario: TBitBtn;
    btAdmin: TBitBtn;
    PanIdCaixa: TPanel;
    LabInicio: TLabel;
    LabCaixa: TLabel;
    btConsPedidos: TBitBtn;
    btHelpGeral: TBitBtn;
    btHelpArgox: TBitBtn;
    btVerifSefaz: TBitBtn;
    btBalcao: TBitBtn;
    btBuffet: TBitBtn;
    LabConexao: TLabel;
    LabEstacao: TLabel;
    LabSeqCaixa: TLabel;
    LabTurno: TLabel;
    btCtleCaixas: TBitBtn;
    btCtleTurnos: TBitBtn;
    procedure btSairClick(Sender: TObject);
    procedure btManutencaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCaixaClick(Sender: TObject);
    procedure btPedidosClick(Sender: TObject);
    procedure btUsuarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConsPedidosClick(Sender: TObject);
    procedure btAdminClick(Sender: TObject);
    procedure btHelpGeralMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btHelpArgoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btBalcaoClick(Sender: TObject);
    procedure btBuffetClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btCtleTurnosClick(Sender: TObject);
    procedure btCtleCaixasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuPrincipal: TFuPrincipal;
  mdFechaTurno: Integer;

implementation

{$R *.dfm}

uses uItens, uDados, uGenericas, uCaixa, uPedidos, uImpressoes, uUsuario,
  FortesReportCtle, uUserPwd, uHelpSpeedFood,
  uCaixaMovto, uQueryPedidos, uQueryAdministrativo, uPedidosBalcao, uTurno;


procedure TFuPrincipal.btCaixaClick(Sender: TObject);
begin
  CaixaMovimentacao(False);       // Somente o caixa atual

end;

procedure TFuPrincipal.btCtleCaixasClick(Sender: TObject);
begin
  CaixaMovimentacao(True);

end;

procedure TFuPrincipal.btAdminClick(Sender: TObject);
begin
  if ObtemParametro('SistemaUserPwd','N') = 'S'
  then if not ObtemUsuario(uDM.sysUser)
            then Exit;
  Administrativo;

end;

procedure TFuPrincipal.btBalcaoClick(Sender: TObject);
begin
  if ObtemParametro('UsaCorItem','N') = 'S' then
     uDM.usaCorItem := True
  else
     uDM.usaCorItem := False;
  uDM.sysTefPos := uDM.sysTefPosIni;      // SisPessoaTefPos.AsInteger;
  PedidosBalcao(btBalcao.Caption);

end;

procedure TFuPrincipal.btBuffetClick(Sender: TObject);
begin
  ShowMessage('??? ');

end;

procedure TFuPrincipal.btConsPedidosClick(Sender: TObject);
begin
  QueryPedidos;

end;

procedure TFuPrincipal.btHelpArgoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
     AjudaSpeedFood(2)
  else
     AjudaSpeedFood(2,True);

end;

procedure TFuPrincipal.btHelpGeralMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
     AjudaSpeedFood(1)
  else
     AjudaSpeedFood(1,True);


end;

procedure TFuPrincipal.btPedidosClick(Sender: TObject);
begin
  if ObtemParametro('UsaCorItem','N') = 'S' then uDM.usaCorItem := True
     else uDM.usaCorItem := False;
  uDM.sysAtivo := 'ONIBUS';
  uDM.sysPedePlaca := True;
  uDM.SisPessoa.First;
  uDM.sysTefPos := uDM.SisPessoaTefPos.AsInteger;
  LancamentoPedidos;

end;

procedure TFuPrincipal.btSairClick(Sender: TObject);
var wExec,wParm: String;
begin
  if uDM.sysAbreTurnoCaixa then
    if FechaCaixa then
    begin
      CaixaMovimentacao(False);     // Somente caixa atual
      if uDM.wOperCartoes > 0 then
         if MessageDlg('Executar operação adicional (cartões) ?',
                        mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
      then begin
        wExec := ObtemParametro('ACNFE_EXE');
        wParm := '/TEF /CANCELAR X';
        ShellExecute(0,'open',pChar(wExec),pChar(wParm),'',1);
      end;
      FechaTurno(mdFechaTurno);
    end;
  FuPrincipal.Close;

end;

procedure TFuPrincipal.btCtleTurnosClick(Sender: TObject);
begin
  ShowMessage('Manutenção de turnos....');

end;

procedure TFuPrincipal.btManutencaoClick(Sender: TObject);
begin
  if ObtemParametro('SistemaUserPwd','N') = 'S'
  then if not ObtemUsuario(uDM.sysUser)
            then Exit;
  if ObtemParametro('UsaCorItem','N') = 'S' then uDM.usaCorItem := True
     else uDM.usaCorItem := False;
  ManutencaoProdutos;
  ContaExtras;

end;

procedure TFuPrincipal.btUsuarioClick(Sender: TObject);
begin
  if ObtemParametro('SistemaUserPwd','N') = 'S'
  then if not ObtemUsuario(uDM.sysUser)
            then btSairClick(nil);
  ManutencaoUsuario;

end;

procedure TFuPrincipal.FormActivate(Sender: TObject);
var arqImg,xValidade,xIdBalcao: String;
    AA,MM,DD: word;
    dtValid,dtHoje: TDateTime;
    nDias,nBotoes,nTop,nAlt: Integer;
begin
  LabConexao.Visible := True;
  Application.ProcessMessages;
  if uDM = Nil then
  begin
    LabConexao.Caption := 'Conectando, aguarde...';
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
    CarregaGrupos;
    LabConexao.Caption := 'Conexão ATIVA     ' +
                          uDM.FDC.Params[uDM.FDC.Params.IndexOfName('server')];
    Application.ProcessMessages;

    uDM.SisPessoa.Active := True;
    uDM.Turnos.Active    := True;
    uDM.Itens.Active     := True;
    uDM.RegCaixa.Active  := True;
    uDM.LctCaixa.Active  := True;
    uDM.Pedidos.Active   := True;
    uDM.PedItens.Active  := True;
    uDM.PedDetPag.Active := True;
    uDM.etqImpress := 2;        // Compatibilização com "Etiquetas" (Todas)
    uDM.sitPagto := 3;          // Todas as situações
    uDM.lDebug := False;
    if ObtemParametro('DEBUG') = 'S' then uDM.lDebug := True;
    //
    dtHoje := DateOf(Date);
    xValidade := ObtemParametro('SistemaValidade');    // AAAAMMDD
    AA := StrToIntDef(Copy(xValidade,1,4),2023);
    MM := StrToIntDef(Copy(xValidade,5,2),12);
    DD := StrToIntDef(Copy(xValidade,7,2),31);
    dtValid := EncodeDate(AA,MM,DD);
    nDias := DaysBetween(dtHoje,dtValid);
    if dtHoje > dtValid then
    begin
      MessageDlg('Validade do sistema expirada (' + intToStr(nDias) + ') dias',mtError,[mbOk],0);
      Halt(0);
    end;
    if nDias < 31 then
      MessageDlg('A validade do sistema termina em ' + IntToStr(nDias) + ' dias',mtInformation,[mbOk],0);
    {
    if ObtemParametro('SistemaUserPwd') = 'S' then
      if not ObtemUsuario(uDM.sysUser) then
        begin
          MessageDlg('usuário indefinido/inválido',mtError,[mbOk],0);
          Halt(0);
        end;
    }
    //
    FFRCtle.RLPreviewSetup1.ZoomFactor := StrToIntDef(ObtemParametro('FortesZoomFactor'),100);
    FGen.lSalvaForm := True;
    FGen.pathSalvaForm := ExtractFilePath(Application.ExeName);
    Form_Define(FuPrincipal);
    //
    uDM.pathImagens := IncludeTrailingPathDelimiter(uDM.SisPessoaPathImagens.AsString);
    arqImg := uDM.pathImagens + 'ImgFundo.BMP';
    if FileExists(arqImg)
    then begin
      Image1.Picture.LoadFromFile(arqImg);
      Image1.Align   := alClient;
      Image1.Stretch := True;
      Image1.Visible := True;
    end;
    ContaExtras;                  // Obtem qtd de ítens 'extras'
    //
    // Define 'botões' utilizados
    nBotoes := 3;               // AbrirCaixa e Sair sempre visiveis
    if uDM.sysPedidos then nBotoes := nBotoes + 1;
    if uDM.sysBalcao then nBotoes := nBotoes + 1;
    if uDM.sysBuffet then nBotoes := nBotoes + 1;
    //if uDM.sysPedidos or uDM.sysBalcao then nBotoes := nBotoes + 1;
    if uDM.sysManut then nBotoes := nBotoes + 1;
    if uDM.sysAdmin then nBotoes := nBotoes + 1;
    if uDM.sysUsuar then nBotoes := nBotoes + 1;
    if uDM.sysSefaz then nBotoes := nBotoes + 1;
    //
    nTop := 0;
    nAlt := (FuPrincipal.Height - 90) div nBotoes;
    btCaixa.Top := nTop;
    btCaixa.Height := nAlt;
    btCaixa.Left := 12;
    nTop := nTop + nAlt + 2;
    btCaixa.Enabled := uDM.sysCaixaDisp;

    if uDM.sysPedidos then
    begin
      btPedidos.Caption := uDM.sysIdPedidos;
      btPedidos.Top := nTop;
      btPedidos.Height := nAlt;
      btPedidos.Left := btCaixa.Left;
      btPedidos.Visible := True;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysBalcao then
    begin
      xIdBalcao := ObtemParametro('IdCaixaBalcao');
      if xIdBalcao = '' then xIdBalcao := 'Nro';
      btBalcao.Caption := xIdBalcao + ' ' + uDM.sysIdBalcao;
      btBalcao.Top := nTop;
      btBalcao.Height := nAlt;
      btBalcao.Visible := True;
      btBalcao.Left := btCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysBuffet then
    begin
      btBuffet.Caption := uDM.sysIdBuffet;
      btBuffet.Top := nTop;
      btBuffet.Height := nAlt;
      btBuffet.Visible := True;
      btBuffet.Left := btCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    //if uDM.sysPedidos or uDM.sysBalcao or uDM.sysBuffet then
    //begin
      btConsPedidos.Top := nTop;
      btConsPedidos.Height := nAlt;
      btConsPedidos.Visible := True;
      btConsPedidos.Left := btCaixa.Left;
      nTop := nTop + nAlt + 2;
    //end;
    if uDM.sysManut then
    begin
      btManutencao.Top := nTop;
      btManutencao.Height := nAlt;
      btManutencao.Visible := True;
      btManutencao.Left := btCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysAdmin then
    begin
      btAdmin.Top := nTop;
      btAdmin.Height := nAlt;
      btAdmin.Visible := True;
      btAdmin.Left := btCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysUsuar then
    begin
      btUsuario.Top := nTop;
      btUsuario.Height := nAlt;
      btUsuario.Visible := True;
      btUsuario.Left := btCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysSefaz then
    begin
      btVerifSefaz.Top := nTop;
      btVerifSefaz.Height := nAlt;
      btVerifSefaz.Visible := True;
      btVerifSefaz.Left := btCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    btSair.Top := nTop;
    btSair.Height := nAlt;
    btSair.Visible := True;
    btSair.Left := btCaixa.Left;
    nTop := nTop + nAlt + 2;
    //
    btCtleCaixas.Visible := uDM.sysCtleCaixas;
    btCtleTurnos.Visible := uDM.sysCtleTurnos;
    //
    btHelpGeral.Visible := uDM.sysHelp;
    btHelpArgox.Visible := uDM.sysHelpArgox;
    //
    if uDM.sysAbreTurnoCaixa then
    begin
      if not AbreTurno then
      begin
        MessageDlg('Abertura/Utilização de turno: Processo cancelado',mtInformation,[mbOk],0);
        Halt(0);
      end;
      //ShowMessage('Turno=' + IntToStr(uDM.turnoCorrente) + '  Caixa='+ IntToStr(uDM.sysNrCaixa));
      if not AbreCaixa(uDM.turnoCorrente,uDM.sysNrCaixa) then
      begin
        MessageDlg('Cancelamento de abertura pelo usuário, ou' + #13 +
                   'não foi possível criar o registro de caixa.' + #13 +
                   'Processo cancelado', mtError, [mbOk], 0);
        Halt(0);
      end;
    end
    else begin
      uDM.Turnos.Last;
      uDM.turnoCorrente := uDM.TurnosNrTurno.AsInteger;
    end;
    //
    LabCaixa.Caption := 'Caixa: ' + IntToStr(uDM.sysNrCaixa);
    LabSeqCaixa.Caption := 'Sequencia: ' + uDM.RegCaixaCaixaSeq.AsString;
    LabInicio.Caption := 'Início: ' + uDM.RegCaixaDtHrInicio.AsString;
    LabEstacao.Caption := 'Estação: ' + uDM.sysCPUId + '   [ ' + IntToStr(uDM.sysNumId) + ' ]';
    LabTurno.Caption := 'Turno: '+ IntToStr(uDM.turnoCorrente);
    PanIdCaixa.Visible := uDM.sysCaixaDisp;     //  True;
    //

  end;

end;

procedure TFuPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  uDM.PedDetpag.Active := False;
  uDM.PedItens.Active  := False;
  uDM.Pedidos.Active   := False;
  uDM.LctCaixa.Active  := False;
  uDM.RegCaixa.Active  := False;
  uDM.Turnos.Active    := False;
  uDM.Itens.Active     := False;
  uDM.SisPessoa.Active := False;

  uDM.FDC.Connected    := False;
  Form_Salva(FuPrincipal);

end;

procedure TFuPrincipal.FormCreate(Sender: TObject);
begin
  FuPrincipal.Width  := (Screen.Width div 5) * 3;
  FuPrincipal.Height := (Screen.Height - 80);     // FuPrincipal.Width;
  FuPrincipal.Top    := 10;                       // 20
  FuPrincipal.Left   := 40;
  FuPrincipal.Image1.Visible := False;
  mdFechaTurno := 0;     // 0=Questionar ao sair se fecha o turno  1=Fecha o turno

end;

procedure TFuPrincipal.SpeedButton1Click(Sender: TObject);
begin
  FuPrincipal.Width := 560;
  FuPrincipal.Height := 520;

end;

end.
