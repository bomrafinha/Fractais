unit U_Fractais;

interface

uses
  Vcl.Graphics, System.Generics.Collections;

type
  TCoordenadas = packed record
    X : Integer;
    Y : Integer;

  end;

  TLandscape = packed record
  private
    var
      fArrayFractal : TList<Double>;
  public
    var
      canvas : TCanvas;
      nivelMaximo : Integer;
      pontoMedio : Integer;
      primeiro : Integer;
      ultimo : Integer;
      H : Double;
      escala : Double;
      relacao : Double;
      padrao : Double;
      mediaPadrao : Double;
      cor : Cardinal;
      tamanhoTela : TCoordenadas;

    property arrayFractal : TList<Double> read fArrayFractal write fArrayFractal;

  end;

  TFractais = class (TObject);

implementation

end.
