object FuTeclado: TFuTeclado
  Left = 0
  Top = 0
  Caption = 'Teclado '
  ClientHeight = 242
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object LabInform: TLabel
    Left = 8
    Top = 8
    Width = 58
    Height = 16
    Caption = 'LabInform'
  end
  object edInform: TMaskEdit
    Left = 8
    Top = 24
    Width = 550
    Height = 24
    TabOrder = 0
    Text = 'edInform'
  end
  object Teclado: TTouchKeyboard
    Left = 8
    Top = 54
    Width = 550
    Height = 180
    GradientEnd = clSilver
    GradientStart = clGray
    Layout = 'Standard'
  end
end
