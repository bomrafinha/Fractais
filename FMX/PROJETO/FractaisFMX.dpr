program FractaisFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_Fractais in '..\PAS\Fractais\U_Fractais.pas',
  U_Principal in '..\PAS\U_Principal.pas' {Principal},
  U_Sort in '..\PAS\Sort\U_Sort.pas',
  U_Sort_01 in '..\PAS\Sort\U_Sort_01.pas',
  U_Fractal_01 in '..\PAS\Fractais\U_Fractal_01.pas',
  U_Fractal_02 in '..\PAS\Fractais\U_Fractal_02.pas',
  U_Fractal_03 in '..\PAS\Fractais\U_Fractal_03.pas',
  U_Sort_02 in '..\PAS\Sort\U_Sort_02.pas',
  U_Sort_03 in '..\PAS\Sort\U_Sort_03.pas',
  U_Sort_04 in '..\PAS\Sort\U_Sort_04.pas',
  U_Fractal_06 in '..\PAS\Fractais\U_Fractal_06.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.