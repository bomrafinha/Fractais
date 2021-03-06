unit U_Fractais;

interface

uses
  Fmx.Graphics, System.Generics.Collections, Math, System.Types, FMX.Objects,
  System.SysUtils, System.UITypes, Winapi.Windows, FMX.Forms, FMX.Layouts;

type
  TCoordenadas = packed record
    X : Single;    Y : Single;

  end;

  TAresta = packed record
    canvas : TCanvas;
    pontoInicial : TCoordenadas;
    angulo : integer;
    vezes : Integer;
    passo : integer;
    marcapasso : Integer;
    angulo_esquerdo : Integer;
    angulo_direito : Integer;
    cor : cardinal;
    arvore : Integer;

  end;

  TFractais = class (TObject)
  protected
    var
      fCor : Cardinal;
      fBorderCor : Cardinal;
      fRaio : Integer;
    procedure desenharRamos(aresta : TAresta); virtual;
    procedure desenharQuadrado(layout01 : TLayout; posX, posY, tamanho : integer); virtual;

  end;

implementation

{ TFractais }

procedure TFractais.desenharQuadrado(layout01 : TLayout; posX, posY, tamanho: integer);
var
  retangulo : TRectangle;

begin
  retangulo := TRectangle.Create(layout01);
  retangulo.Fill.Color := fCor;
  retangulo.Stroke.Color := fBorderCor;
  retangulo.Height := tamanho;
  retangulo.Width := tamanho;
  retangulo.Position.X := posX;
  retangulo.Position.Y := posY;
  retangulo.XRadius := fRaio;
  retangulo.YRadius := fRaio;
  layout01.AddObject(retangulo);

end;

procedure TFractais.desenharRamos(aresta: TAresta);
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

      with canvas do
      begin
        Stroke.Color := cor;
        BeginScene;
        DrawLine(PointF(pontoInicial.X, pontoInicial.Y), PointF(pontoFinal.X, pontoFinal.Y), 100);
        EndScene;
      end;

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

end.
