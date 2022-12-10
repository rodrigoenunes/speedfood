program SFEtiquetas;

uses
  Vcl.Forms,
  SFEuPrincipal in 'SFEuPrincipal.pas' {FuPrincipalEtq},
  uDados in '..\vcl\uDados.pas' {uDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFuPrincipalEtq, FuPrincipalEtq);

  Application.Run;
end.
