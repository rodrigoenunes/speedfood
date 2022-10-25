program SpeedFood;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_SpeedFood in 'U_SpeedFood.pas' {F_SpeedFood};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_SpeedFood, F_SpeedFood);
  Application.Run;
end.
