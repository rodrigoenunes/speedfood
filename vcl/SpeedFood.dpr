program SpeedFood;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FuPrincipal},
  uDados in 'uDados.pas' {uDM: TDataModule},
  uItens in 'uItens.pas' {FuItens},
  uGenericas in '..\..\UsoGeral\uGenericas.pas' {FGen},
  uFinPedido in 'uFinPedido.pas' {FuFinPedido},
  uImpressoes in 'uImpressoes.pas' {FuImpressoes},
  uUsuario in 'uUsuario.pas' {FuUsuario},
  uCaixaMovto in 'uCaixaMovto.pas' {FuCaixaMovto},
  uSysPrinters in '..\..\UsoGeral\uSysPrinters.pas' {FuSysPrinters},
  FortesReportCtle in '..\..\uFortesReport\FortesReportCtle.pas' {FFRCtle},
  uUserPwd in 'uUserPwd.pas' {FuUserPwd},
  uHelpSpeedFood in 'uHelpSpeedFood.pas' {FuHelpSpeedFood},
  SFEuPrintFortes in '..\Etiquetas\SFEuPrintFortes.pas' {FSFEuPrintFortes},
  uBiblioteca in 'uBiblioteca.pas',
  uPagtoMisto in 'uPagtoMisto.pas' {FuPagtoMisto},
  uEmail in '..\..\UsoGeral\uEmail.pas',
  uQueryPedidos in 'uQueryPedidos.pas' {FuQueryPedidos},
  uQueryAdministrativo in 'uQueryAdministrativo.pas' {FuQueryAdministrativo},
  uPedidosBalcao in '..\Balcao\uPedidosBalcao.pas' {FuPedidosBalcao},
  uTrataLanche in 'uTrataLanche.pas' {FuTrataLanche},
  uMontarLanche in 'uMontarLanche.pas' {FuMontarLanche},
  uCaixa in 'uCaixa.pas' {FuCaixa},
  uTurno in 'uTurno.pas' {FuTurno},
  uMsgInfo in '..\..\UsoGeral\uMsgInfo.pas' {FuMsgInfo},
  uPedBalcaoV2 in '..\BalcaoV2\uPedBalcaoV2.pas' {FuPedBalcaoV2},
  uPedidosOnibus in 'uPedidosOnibus.pas' {FuPedidosOnibus},
  uTrataExtrasV2 in '..\BalcaoV2\uTrataExtrasV2.pas' {FuTrataExtrasV2},
  uSaboresV2 in '..\BalcaoV2\uSaboresV2.pas' {FuSaboresV2};

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFuPrincipal, FuPrincipal);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFFRCtle, FFRCtle);
  Application.CreateForm(TFuPagtoMisto, FuPagtoMisto);
  Application.CreateForm(TFuHelpSpeedFood, FuHelpSpeedFood);
  Application.CreateForm(TFuCaixaMovto, FuCaixaMovto);
  Application.CreateForm(TFuFinPedido, FuFinPedido);
  Application.CreateForm(TFuItens, FuItens);
  Application.CreateForm(TFuCaixa, FuCaixa);
  Application.CreateForm(TFuQueryPedidos, FuQueryPedidos);
  Application.CreateForm(TFuQueryAdministrativo, FuQueryAdministrativo);
  Application.CreateForm(TFuMontarLanche, FuMontarLanche);
  Application.CreateForm(TFuPedidosOnibus, FuPedidosOnibus);
  Application.CreateForm(TFuPedBalcaoV2, FuPedBalcaoV2);
  Application.CreateForm(TFuTurno, FuTurno);
  Application.CreateForm(TFuMsgInfo, FuMsgInfo);
  Application.CreateForm(TFuPedidosBalcao, FuPedidosBalcao);
  Application.CreateForm(TFuTrataLanche, FuTrataLanche);
  Application.CreateForm(TFuTrataExtrasV2, FuTrataExtrasV2);
  Application.CreateForm(TFuSaboresV2, FuSaboresV2);
  Application.Run;

end.
