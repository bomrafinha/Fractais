unit U_Fractal_01;

interface

uses
  Winapi.Windows, FMX.Objects, U_Fractais, System.UITypes, FMX.Layouts;

type
  TFractal01 = class(TFractais)
  private
    var
      fAresta : TAresta;
      fCoordenadas : TCoordenadas;

    procedure fractal(Layout01 : TLayout);

  public
     constructor Create(Layout01 : TLayout);

  end;

implementation

{ TFractal01 }

constructor TFractal01.Create(Layout01: TLayout);
begin
  inherited Create;

  fractal(Layout01);

end;

procedure TFractal01.fractal(Layout01: TLayout);
var
  i : Integer;

begin

  fCoordenadas.X := Layout01.Width / 2;
  fCoordenadas.Y := Layout01.Height;
  fAresta.canvas := Layout01.Canvas;
  fAresta.pontoInicial := fCoordenadas;
  fAresta.vezes := 10;
  fAresta.angulo := -90;
  fAresta.passo := 86;
  fAresta.marcapasso := fAresta.passo div fAresta.vezes;
  fAresta.angulo_esquerdo := 20;
  fAresta.angulo_direito := 20;
  fAresta.cor := TAlphaColors.Yellow;
  DesenharRamos(fAresta);

  fAresta.passo := 90;
  fAresta.marcapasso := fAresta.passo div fAresta.vezes;
  fAresta.cor := TAlphaColors.Olive;
  DesenharRamos(fAresta);

  fAresta.passo := 84;
  fAresta.marcapasso := fAresta.passo div fAresta.vezes;
  fAresta.cor := TAlphaColors.Green;
  DesenharRamos(fAresta);

  i := fAresta.passo;

  while i >= 60 do
  begin
    i := i - 4;
    fAresta.passo := i;
    fAresta.marcapasso := fAresta.passo div fAresta.vezes;
    fAresta.cor := TAlphaColors.Green;
    DesenharRamos(fAresta);
  end;

  i := 90;

  while i >= 30 do
  begin
    fAresta.passo := i;
    fAresta.marcapasso := fAresta.passo div (fAresta.vezes div 2);
    fAresta.cor := TAlphaColors.Maroon;
    fAresta.angulo_esquerdo := 20;
    fAresta.angulo_direito := 20;
    DesenharRamos(fAresta);
    i := i - 1;
  end;

end;

end.
