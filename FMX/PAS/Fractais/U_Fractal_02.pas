unit U_Fractal_02;

interface

uses U_Fractais, FMX.Objects, System.UITypes, FMX.Layouts;

type
  TFractal02 = class(TFractais)
  private
    var
      fAresta : TAresta;
      fCoordenadas : TCoordenadas;

    procedure fractal(Layout01 : TLayout);

  public
     constructor Create(Layout01 : TLayout);

  end;

implementation

{ TFractal02 }

constructor TFractal02.Create(Layout01: TLayout);
begin
  inherited Create;
  fractal(Layout01);

end;

procedure TFractal02.fractal(Layout01: TLayout);
begin

  fCoordenadas.X := Layout01.Width / 2;
  fCoordenadas.Y := Layout01.Height;
  fAresta.canvas := Layout01.Canvas;
  fAresta.pontoInicial := fCoordenadas;
  fAresta.vezes := 12;
  fAresta.angulo := -90;
  fAresta.passo := 65;
  fAresta.marcapasso := fAresta.passo div fAresta.vezes;
  fAresta.angulo_esquerdo := 25;
  fAresta.angulo_direito := 8;
  fAresta.cor := TAlphaColors.Red;
  DesenharRamos(fAresta);

  fAresta.angulo_esquerdo := 8;
  fAresta.angulo_direito := 25;
  fAresta.cor := TAlphaColors.Blue;
  DesenharRamos(fAresta);


end;

end.
