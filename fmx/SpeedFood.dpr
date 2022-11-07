program SpeedFood;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_SpeedFood in 'U_SpeedFood.pas' {F_SpeedFood},
  U_Grupoproduto in 'U_Grupoproduto.pas' {FGrupoproduto},
  U_Dm in '..\Comum\U_Dm.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_SpeedFood, F_SpeedFood);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
