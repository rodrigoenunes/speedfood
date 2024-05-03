program SpeedFood;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FuPrincipal},
  uDados in 'uDados.pas' {uDM: TDataModule},
  uItens in 'uItens.pas' {FuItens},
  uGenericas in '..\..\UsoGeral\uGenericas.pas' {FGen},
  uCaixa in 'uCaixa.pas' {FuCaixa},
  uPedidos in 'uPedidos.pas' {FuPedidos},
  uTrataLanche in 'uTrataLanche.pas' {FuTrataLanche},
  uFinPedido in 'uFinPedido.pas' {FuFinPedido},
  uImpressoes in 'uImpressoes.pas' {FuImpressoes},
  uUsuario in 'uUsuario.pas' {FuUsuario},
  uCaixaMovto in 'uCaixaMovto.pas' {FuCaixaMovto},
  uSysPrinters in '..\..\UsoGeral\uSysPrinters.pas' {FuSysPrinters},
  FortesReportCtle in '..\..\uFortesReport\FortesReportCtle.pas' {FFRCtle},
  uUserPwd in 'uUserPwd.pas' {FuUserPwd},
  uHelpSpeedFood in 'uHelpSpeedFood.pas' {FuHelpSpeedFood},
  SFEuPrintFortes in '..\Etiquetas\SFEuPrintFortes.pas' {FSFEuPrintFortes},
  uMontarLanche in 'uMontarLanche.pas' {FuMontarLanche},
  uBiblioteca in 'uBiblioteca.pas',
  uPagtoMisto in 'uPagtoMisto.pas' {FuPagtoMisto},
  uEmail in '..\..\UsoGeral\uEmail.pas',
  uConfirmacao in '..\UsoGeral\uConfirmacao.pas' {FuConfirmacao},
  uQueryPedidos in 'uQueryPedidos.pas' {FuQueryPedidos},
  uQueryAdministrativo in 'uQueryAdministrativo.pas' {FuQueryAdministrativo};

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFuPrincipal, FuPrincipal);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFFRCtle, FFRCtle);
  Application.CreateForm(TFSFEuPrintFortes, FSFEuPrintFortes);
  Application.CreateForm(TFuPagtoMisto, FuPagtoMisto);
  Application.CreateForm(TFuHelpSpeedFood, FuHelpSpeedFood);
  Application.CreateForm(TFuMontarLanche, FuMontarLanche);
  Application.CreateForm(TFuCaixaMovto, FuCaixaMovto);
  Application.CreateForm(TFuTrataLanche, FuTrataLanche);
  Application.CreateForm(TFuPedidos, FuPedidos);
  Application.CreateForm(TFuFinPedido, FuFinPedido);
  Application.CreateForm(TFuItens, FuItens);
  Application.CreateForm(TFuCaixa, FuCaixa);
  Application.CreateForm(TFuImpressoes, FuImpressoes);
  Application.CreateForm(TFuQueryPedidos, FuQueryPedidos);
  Application.CreateForm(TFuQueryAdministrativo, FuQueryAdministrativo);
  Application.Run;

end.
