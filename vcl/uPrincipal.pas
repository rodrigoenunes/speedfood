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
    btAbrirCaixa: TBitBtn;
    btPedidos: TBitBtn;
    btUsuario: TBitBtn;
    btAdmin: TBitBtn;
    PanTurno: TPanel;
    LabInicio: TLabel;
    LabFinal: TLabel;
    LabTurno: TLabel;
    btConsPedidos: TBitBtn;
    btHelpGeral: TBitBtn;
    btHelpArgox: TBitBtn;
    btVerifSefaz: TBitBtn;
    LabPedidoInicial: TLabel;
    btBalcao: TBitBtn;
    procedure btSairClick(Sender: TObject);
    procedure btManutencaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAbrirCaixaClick(Sender: TObject);
    procedure btPedidosClick(Sender: TObject);
    procedure btUsuarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConsPedidosClick(Sender: TObject);
    procedure btAdminClick(Sender: TObject);
    procedure btHelpGeralMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btHelpArgoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
  FortesReportCtle, uUserPwd, uHelpSpeedFood,
  uCaixaMovto, uQueryPedidos, uQueryAdministrativo;

procedure TFuPrincipal.btAbrirCaixaClick(Sender: TObject);
begin
  CaixaMovimentacao;

end;

procedure TFuPrincipal.btAdminClick(Sender: TObject);
begin
  if ObtemParametro('SistemaUserPwd','N') = 'S'
  then if not ObtemUsuario(uDM.sysUser)
            then btSairClick(nil);
  Administrativo;

end;

procedure TFuPrincipal.btConsPedidosClick(Sender: TObject);
begin
  QueryPedidos(uDM.turnoCorrente);

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
  LancamentoPedidos;

end;

procedure TFuPrincipal.btSairClick(Sender: TObject);
var wExec,wParm: String;

begin
{
  CalculaSaldoCaixa(uDM.RegCaixaTurno.AsInteger);
  if MessageDlg('Imprimir fechamento de caixa ?',mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
     then ImprimeCaixa(uDM.RegCaixaTurno.AsInteger);
}
  if uDM.wOperCartoes > 0 then
     if MessageDlg('Executar operação adicional (cartões) ?',
                    mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes
     then begin
       wExec := ObtemParametro('ACNFE_EXE');
       wParm := '/TEF /CANCELAR X';
       ShellExecute(0,'open',pChar(wExec),pChar(wParm),'',1);
     end;
  FuPrincipal.Close;

end;

procedure TFuPrincipal.btManutencaoClick(Sender: TObject);
begin
  if ObtemParametro('SistemaUserPwd','N') = 'S'
  then if not ObtemUsuario(uDM.sysUser)
            then btSairClick(nil);
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
var arqimg: String;
    xValidade: String;
    AA,MM,DD: word;
    dtValid,dtHoje: TDateTime;
    nDias,nBotoes,nTop,nAlt,wAcaoTurno: Integer;
begin
  if uDM = Nil then
  begin
    uDM := TuDM.Create(nil);
    //
    if (uDM.sysNumId = 0) or (uDM.sysCPUId = '') then
    begin
      MessageDlg('Erro de inicialização, verifique arquivo INI' + #13 +
                 'Estacao / Numero: Não pode ser ZERO' + #13 +
                 'Estacao / Nome: Identificacao da estacao de trabalho' + #13 +
                 'Aplicação não pode ser iniciada',
                 mtError,[mbOk],0);
      Halt(0);
    end;
    //
    uDM.FDC.Connected:= True;
    uDM.SisPessoa.Active := True;
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
    FFRCtle.RLPreviewSetup1.ZoomFactor := StrToIntDef(ObtemParametro('FortesZoomFactor'),100);
    FGen.lSalvaForm := True;
    FGen.pathSalvaForm := ExtractFilePath(Application.ExeName);
    Form_Define(FuPrincipal);
    //
    if ObtemParametro('SistemaUserPwd') = 'S'
    then if not ObtemUsuario(uDM.sysUser)
            then btSairClick(nil);
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
      btSairClick(nil);
    end;
    if nDias < 31 then
      MessageDlg('A validade do sistema termina em ' + IntToStr(nDias) + ' dias',mtInformation,[mbOk],0);
    //
    uDM.pathImagens := IncludeTrailingPathDelimiter(uDM.SisPessoaPathImagens.AsString);
    arqimg := uDM.pathImagens + 'ImgFundo.BMP';
    if FileExists(arqimg)
    then begin
      Image1.Picture.LoadFromFile(arqimg);
      Image1.Align   := alClient;
      Image1.Stretch := True;
      Image1.Visible := True;
    end;
    ContaExtras;                  // Obtem qtd de ítens 'extras'
    //
    // Define 'botões' utilizados
    nBotoes := 2;               // AbrirCaixa e Sair sempre visiveis
    if uDM.sysPedidos then nBotoes := nBotoes + 1;
    if uDM.sysBalcao then nBotoes := nBotoes + 1;
    if uDM.sysPedidos or uDM.sysBalcao then nBotoes := nBotoes + 1;
    if uDM.sysManut then nBotoes := nBotoes + 1;
    if uDM.sysAdmin then nBotoes := nBotoes + 1;
    if uDM.sysUsuar then nBotoes := nBotoes + 1;
    if uDM.sysSefaz then nBotoes := nBotoes + 1;
    //
    nTop := 0;
    nAlt := (FuPrincipal.Height - 64) div nBotoes;
    btAbrirCaixa.Top := nTop;
    btAbrirCaixa.Height := nAlt;
    btAbrirCaixa.Left := 12;
    nTop := nTop + nAlt + 2;
    if uDM.sysPedidos then
    begin
      btPedidos.Top := nTop;
      btPedidos.Height := nAlt;
      btPedidos.Left := btAbrirCaixa.Left;
      btPedidos.Visible := True;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysBalcao then
    begin
      btBalcao.Top := nTop;
      btBalcao.Height := nAlt;
      btBalcao.Visible := True;
      btBalcao.Left := btAbrirCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysPedidos or uDM.sysBalcao then
    begin
      btConsPedidos.Top := nTop;
      btConsPedidos.Height := nAlt;
      btConsPedidos.Visible := True;
      btConsPedidos.Left := btAbrirCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysManut then
    begin
      btManutencao.Top := nTop;
      btManutencao.Height := nAlt;
      btManutencao.Visible := True;
      btManutencao.Left := btAbrirCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysAdmin then
    begin
      btAdmin.Top := nTop;
      btAdmin.Height := nAlt;
      btAdmin.Visible := True;
      btAdmin.Left := btAbrirCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysUsuar then
    begin
      btUsuario.Top := nTop;
      btUsuario.Height := nAlt;
      btUsuario.Visible := True;
      btUsuario.Left := btAbrirCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    if uDM.sysSefaz then
    begin
      btVerifSefaz.Top := nTop;
      btVerifSefaz.Height := nAlt;
      btVerifSefaz.Visible := True;
      btVerifSefaz.Left := btAbrirCaixa.Left;
      nTop := nTop + nAlt + 2;
    end;
    btSair.Top := nTop;
    btSair.Height := nAlt;
    btSair.Visible := True;
    btSair.Left := btAbrirCaixa.Left;
    nTop := nTop + nAlt + 2;
    //
    btHelpGeral.Visible := uDM.sysHelp;
    btHelpArgox.Visible := uDM.sysHelpArgox;
    //
    wAcaoTurno := VerificaStatusCaixa;               // Sempre posiciona no ULTIMO registro
    if wAcaoTurno = 0 then
    begin          // Encerra turno e abre novo
      if uDM.RegCaixaSituacao.AsString <> 'F'
      then begin
        wAcaoTurno := FechamentoDeCaixa;
        if wAcaoTurno = 0 then
        begin
          CaixaMovimentacao;
          uDM.turnoCorrente := AberturaDeCaixa;
        end
        else uDM.turnoCorrente := uDM.RegCaixaTurno.AsInteger;
      end
      else uDM.turnoCorrente := AberturaDeCaixa;
    end
    else begin     // Prossegue o turno
      uDM.RegCaixa.Last;
      uDM.turnoCorrente := uDM.RegCaixaTurno.AsInteger;
    end;
    //
    if uDM.turnoCorrente < 0 then
    begin
      MessageDlg('Abertura de turno cancelada' + #13#13 +
                 'Aplicação finalizada',mtInformation,[mbOk],0);
      Application.Terminate;
    end;
    LabTurno.Caption  := '  Turno: ' + IntToStr(uDM.turnoCorrente);
    LabInicio.Caption := 'Início:' + uDM.RegCaixaDtHrInicio.AsString;
    LabFinal.Caption  := 'Final:' + uDM.RegCaixaDtHrFim.AsString;
    uDM.Pedidos.Last;
    uDM.nrInicialPedido := uDM.PedidosNumero.AsInteger;
    while (uDM.PedidosTurno.AsInteger = uDM.turnoCorrente) and (not uDM.Pedidos.Bof) do
    begin
      uDM.nrInicialPedido := uDM.PedidosNumero.AsInteger;
      uDM.Pedidos.Prior;
    end;
    LabPedidoInicial.Caption := IntToStr(uDM.nrInicialPedido);
    PanTurno.Visible  := True;
    //
    FuPrincipal.Visible := True;
  end;

end;

procedure TFuPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if uDM.sysTurnos then
     if MessageDlg('Encerrar turno atual',mtConfirmation,
                    [mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
        if FechamentoDeCaixa = 0
          then CaixaMovimentacao;
  //
  uDM.PedDetpag.Active := False;
  uDM.PedItens.Active  := False;
  uDM.Pedidos.Active   := False;
  uDM.LctCaixa.Active  := False;
  uDM.RegCaixa.Active  := False;
  uDM.Itens.Active     := False;
  uDM.SisPessoa.Active := False;
  uDM.FDC.Connected    := False;
  //
  Form_Salva(FuPrincipal);
  Application.Terminate;

end;

procedure TFuPrincipal.FormCreate(Sender: TObject);
begin
  FuPrincipal.Width  := (Screen.Width div 5) * 3;
  FuPrincipal.Height := (Screen.Height - 80);     // FuPrincipal.Width;
  FuPrincipal.Top    := 10;                       // 20
  FuPrincipal.Left   := 40;
  FuPrincipal.Image1.Visible := False;

end;

end.
