unit U_Fractal_03;

interface

uses U_Fractais, System.SyncObjs, FMX.Objects, Winapi.Windows, System.Classes,
  System.UITypes, FMX.Layouts, System.Math, System.Types, FMX.Forms;
type
  TFractal03 = class(TFractais)
  private
    var
      fAresta01 : TAresta;
      fAresta02 : TAresta;
      fAresta03 : TAresta;
      fAresta04 : TAresta;
      fCoordenadas : TCoordenadas;
      fSemaphore_01 : TSemaphore;
      fSemaphore_02 : TSemaphore;
      fSemaphore_03 : TSemaphore;
      fSemaphore_04 : TSemaphore;

    procedure fractal(Layout01 : TLayout);
    procedure acquire(tipo : integer);
    procedure release(tipo : integer);
    procedure desenharRamos(aresta : TAresta); override;

  public
     constructor Create(Layout01 : TLayout);

  end;


implementation

{ TFractal03 }

procedure TFractal03.acquire(tipo: integer);
begin
  case tipo of
    1:
    begin
      fSemaphore_01.Acquire;
    end;
    2:
    begin
      fSemaphore_02.Acquire;
    end;
    3:
    begin
      fSemaphore_03.Acquire;
    end;
    4:
    begin
      fSemaphore_04.Acquire;
    end;
  end;

end;

constructor TFractal03.Create(Layout01: TLayout);
begin
  inherited Create;
  fSemaphore_01 := TSemaphore.Create(nil,0,1,'Semaphore_01');
  fSemaphore_02 := TSemaphore.Create(nil,0,1,'Semaphore_02');
  fSemaphore_03 := TSemaphore.Create(nil,0,1,'Semaphore_03');
  fSemaphore_04 := TSemaphore.Create(nil,0,1,'Semaphore_04');
  fractal(Layout01);

end;

procedure TFractal03.desenharRamos(aresta: TAresta);
var
  pontoFinal : TCoordenadas;
  arestaAuxiliar : TAresta;

begin
  if aresta.passo > 0 then
  begin
    with aresta do
    begin
      pontoFinal.X := pontoInicial.X + trunc(cos(degtorad(angulo)) * passo);
      pontoFinal.Y := pontoInicial.Y + trunc(sin(degtorad(angulo)) * passo);

      acquire(aresta.arvore);

      with canvas do
      begin
        Stroke.Color := cor;
        BeginScene;
        DrawLine(PointF(pontoInicial.X, pontoInicial.Y), PointF(pontoFinal.X, pontoFinal.Y), 100);
        EndScene;
      end;

      release(aresta.arvore);

      Application.ProcessMessages;

      sleep(1);

    end;

    with arestaAuxiliar do
    begin
      arestaAuxiliar := aresta;
      pontoInicial := pontoFinal;
      angulo := aresta.angulo - angulo_esquerdo;
      passo := aresta.passo - marcapasso;

      desenharRamos(arestaAuxiliar);

      arestaAuxiliar := aresta;
      pontoInicial := pontoFinal;
      angulo := aresta.angulo + angulo_direito;
      passo := aresta.passo - marcapasso;

      desenharRamos(arestaAuxiliar);
    end;
  end;


end;

procedure TFractal03.fractal(Layout01: TLayout);
var
  parte01 : TThread;
  parte02 : TThread;
  parte03 : TThread;
  parte04 : TThread;

begin

  parte01 := TThread.CreateAnonymousThread(
    procedure begin
      fCoordenadas.X := (Layout01.Width / 2) - 15;
      fCoordenadas.Y := Layout01.Height / 2;
      fAresta01.canvas := Layout01.Canvas;
      fAresta01.pontoInicial := fCoordenadas;
      fAresta01.vezes := 13;
      fAresta01.angulo := 0;
      fAresta01.passo := 65;
      fAresta01.marcapasso := fAresta01.passo div fAresta01.vezes;
      fAresta01.angulo_esquerdo := 24;
      fAresta01.angulo_direito := 9;
      fAresta01.cor := TAlphaColors.Blue;
      fAresta01.arvore := 1;
      DesenharRamos(fAresta01);

    end
  );

  parte02 := TThread.CreateAnonymousThread(
    procedure begin
      fCoordenadas.X := (Layout01.Width / 2) - 15;
      fCoordenadas.Y := Layout01.Height / 2;
      fAresta02.canvas := Layout01.Canvas;
      fAresta02.pontoInicial := fCoordenadas;
      fAresta02.vezes := 13;
      fAresta02.angulo := 0;
      fAresta02.passo := 65;
      fAresta02.marcapasso := fAresta02.passo div fAresta02.vezes;
      fAresta02.angulo_esquerdo := 9;
      fAresta02.angulo_direito := 24;
      fAresta02.cor := TAlphaColors.Red;
      fAresta02.arvore := 2;
      DesenharRamos(fAresta02);

    end
  );

  parte03 := TThread.CreateAnonymousThread(
    procedure begin
      fCoordenadas.X := (Layout01.Width / 2) + 15;
      fCoordenadas.Y := Layout01.Height / 2;
      fAresta03.canvas := Layout01.Canvas;
      fAresta03.pontoInicial := fCoordenadas;
      fAresta03.vezes := 13;
      fAresta03.angulo := 180;
      fAresta03.passo := 65;
      fAresta03.marcapasso := fAresta03.passo div fAresta03.vezes;
      fAresta03.angulo_esquerdo := 24;
      fAresta03.angulo_direito := 9;
      fAresta03.cor := TAlphaColors.Red;
      fAresta03.arvore := 3;
      DesenharRamos(fAresta03);

    end
  );

  parte04 := TThread.CreateAnonymousThread(
    procedure begin
      fCoordenadas.X := (Layout01.Width / 2) + 15;
      fCoordenadas.Y := Layout01.Height / 2;
      fAresta04.canvas := Layout01.Canvas;
      fAresta04.pontoInicial := fCoordenadas;
      fAresta04.vezes := 13;
      fAresta04.angulo := 180;
      fAresta04.passo := 65;
      fAresta04.marcapasso := fAresta04.passo div fAresta04.vezes;
      fAresta04.angulo_esquerdo := 9;
      fAresta04.angulo_direito := 24;
      fAresta04.cor := TAlphaColors.Blue;
      fAresta04.arvore := 4;
      DesenharRamos(fAresta04);

    end
  );

  fSemaphore_01.Release;
  parte01.Start;
  parte02.Start;
  parte03.Start;
  parte04.Start;

end;

procedure TFractal03.release(tipo: integer);
begin
  case tipo of
    1:
    begin
      fSemaphore_02.Release;
    end;
    2:
    begin
      fSemaphore_03.Release;
    end;
    3:
    begin
      fSemaphore_04.Release;
    end;
    4:
    begin
      fSemaphore_01.Release;
    end;
  end;

end;

end.
