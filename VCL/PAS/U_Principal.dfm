object Principal: TPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Fractal'
  ClientHeight = 720
  ClientWidth = 960
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 960
    Height = 720
    Align = alClient
    Color = clWhite
    ParentColor = False
    ExplicitWidth = 640
    ExplicitHeight = 960
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 864
    Top = 32
  end
end
