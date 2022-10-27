program SpeedFood;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_SpeedFood in 'U_SpeedFood.pas' {F_SpeedFood},
  U_Dm in 'U_Dm.pas' {DM: TDataModule},
  U_Grupoproduto in 'U_Grupoproduto.pas' {FGrupoproduto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TF_SpeedFood, F_SpeedFood);
  Application.Run;
end.
