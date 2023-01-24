program SFEtiquetas;

uses
  Vcl.Forms,
  SFEuPrincipal in 'SFEuPrincipal.pas' {FuPrincipalEtq},
  uGenericas in '..\..\UsoGeral\uGenericas.pas' {FGen},
  SFEuPrintFortes in 'SFEuPrintFortes.pas' {FSFEuPrintFortes},
  FortesReportCtle in '..\..\uFortesReport\FortesReportCtle.pas' {FFRCtle},
  EnviaEMail in '..\..\uFortesReport\EnviaEMail.pas' {FEnviaEMail},
  uSysPrinters in '..\..\UsoGeral\uSysPrinters.pas' {FuSysPrinters},
  uDados in '..\vcl\uDados.pas' {uDM: TDataModule},
  uHelpSpeedFood in '..\vcl\uHelpSpeedFood.pas' {FuHelpSpeedFood};

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFuPrincipalEtq, FuPrincipalEtq);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFFRCtle, FFRCtle);
  Application.CreateForm(TFEnviaEMail, FEnviaEMail);
  Application.CreateForm(TFuSysPrinters, FuSysPrinters);
  Application.CreateForm(TFuHelpSpeedFood, FuHelpSpeedFood);
  Application.CreateForm(TFuHelpSpeedFood, FuHelpSpeedFood);
  //Application.CreateForm(TFSFEuPrintFortes, FSFEuPrintFortes);
  Application.Run;
end.
