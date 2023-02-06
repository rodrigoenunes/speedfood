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
  uBiblioteca in 'uBiblioteca.pas',
  uConsPedidos in 'uConsPedidos.pas' {FuConsPedidos},
  uSysPrinters in '..\..\UsoGeral\uSysPrinters.pas' {FuSysPrinters},
  FortesReportCtle in '..\..\uFortesReport\FortesReportCtle.pas' {FFRCtle},
  EnviaEMail in '..\..\uFortesReport\EnviaEMail.pas' {FEnviaEMail},
  uAdministrativo in 'uAdministrativo.pas' {FuAdministrativo},
  uUserPwd in 'uUserPwd.pas' {FuUserPwd},
  uHelpSpeedFood in 'uHelpSpeedFood.pas' {FuHelpSpeedFood},
  SFEuPrintFortes in '..\Etiquetas\SFEuPrintFortes.pas' {FSFEuPrintFortes};

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFuPrincipal, FuPrincipal);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFFRCtle, FFRCtle);
  Application.CreateForm(TFEnviaEMail, FEnviaEMail);
  Application.CreateForm(TFuUserPwd, FuUserPwd);
  Application.CreateForm(TFuUserPwd, FuUserPwd);
  Application.CreateForm(TFuHelpSpeedFood, FuHelpSpeedFood);
  Application.CreateForm(TFSFEuPrintFortes, FSFEuPrintFortes);
  Application.Run;

end.
