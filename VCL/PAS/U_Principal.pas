unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TPrincipal = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses U_Fractais, U_Fractal_04e05;

  var
    fractal : TFractais;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
  
end;

procedure TPrincipal.Timer1Timer(Sender: TObject);
begin
  fractal := TFractal04e05.Create(PaintBox1);
  Timer1.Enabled := False;
end;

end.
