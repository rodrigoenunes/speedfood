object FGen: TFGen
  Left = 851
  Top = 433
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FFuGenericas....'
  ClientHeight = 110
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object LabOperacao: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 16
    Caption = 'Informe ...'
  end
  object btOk: TBitBtn
    Left = 8
    Top = 76
    Width = 113
    Height = 25
    Caption = '&Ok'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555555555555555555550055555555555555FF555555555555552005555
      5555555557FF5555555555552220555555555555777F55555555555522200555
      55555555777FF5555555555222220555555555577777F5555555552220220055
      555555777777FF5555555222052220555555577775777F555555220555522005
      5555777555577FF5555555555552220555555555555777F55555555555552200
      55555555555577FF5555555555555220055555555555577FF555555555555522
      0055555555555577FF5555555555555220005555555555577FFF555555555555
      5220555555555555577F55555555555555555555555555555555}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btOkClick
  end
  object btCanc: TBitBtn
    Left = 196
    Top = 76
    Width = 113
    Height = 25
    Caption = '&Cancelar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
      6666666FFFF6666666FF6619996666666996667888F66666688F666199966666
      99166667888F6666887F66661996666991666666788F666887F6666661996699
      166666666788FF887F666666619999916666666667888887F666666666199916
      666666666678887F6666666666999966666666666F8888F66666666669991996
      66666666F888788F66666666999161996666666F88876788F666666999166619
      966666F8887666788F6666999166666996666688876666678F66669916666661
      996666887666666788F66691666666661996668766666666788F666666666666
      6199666666666666678866666666666666666666666666666666}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btCancClick
  end
  object edInfo: TEdit
    Left = 8
    Top = 24
    Width = 301
    Height = 24
    TabOrder = 0
    Text = 'edInfo'
  end
end
