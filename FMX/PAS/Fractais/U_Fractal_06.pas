unit U_Fractal_06;

interface

uses U_Fractais, FMX.Layouts, System.UITypes, Winapi.Windows, FMX.Forms;

type
  TFractal06 = class(TFractais)
  private
  const
    limite : integer = 3;
  var
    fDim : Integer;

    procedure fractal(layout01 : TLayout; x, y, size : Integer);
    procedure mudaCor();

  public
     constructor Create(layout01 : TLayout);

  end;

implementation

{ TFractal06 }

constructor TFractal06.Create(layout01: TLayout);
begin
  inherited Create();
  Self.fRaio := 0;
  Self.fDim := layout01.Canvas.Width;
  Self.fractal(layout01, 0, 0, Self.fDim);
end;

procedure TFractal06.fractal(layout01: TLayout; x, y, size : Integer);
var
  i : Integer;

begin
  application.ProcessMessages;

  mudaCor;

  if (size >= limite) then
  begin
    size := size div 3;
    for i := 0 to 8 do
    begin
      if i = 4 then
      begin
        desenharQuadrado(Layout01, x + size, y + size, size);
      end else begin
        Self.fractal(layout01, x + (i mod 3) * size, y + (i div 3) * size, size);
      end;

    end;

  end;

end;

procedure TFractal06.mudaCor;
var
  num : Integer;
begin

  num := Random(12);

  case num of
    0 : Self.fCor := TAlphaColors.Steelblue;
    1 : Self.fCor := TAlphaColors.Saddlebrown;
    2 : Self.fCor := TAlphaColors.Slateblue;
    3 : Self.fCor := TAlphaColors.Springgreen;
    4 : Self.fCor := TAlphaColors.Skyblue;
    5 : Self.fCor := TAlphaColors.Violet;
    6 : Self.fCor := TAlphaColors.Yellow;
    7 : Self.fCor := TAlphaColors.Tomato;
    8 : Self.fCor := TAlphaColors.Seagreen;
    9 : Self.fCor := TAlphaColors.Orange;
    10 : Self.fCor := TAlphaColors.Olive;
    11 : Self.fCor := TAlphaColors.Khaki;
    12 : Randomize;
  end;

  Self.fBorderCor := Self.fCor;

end;

end.
