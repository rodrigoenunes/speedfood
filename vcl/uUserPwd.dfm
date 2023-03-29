object FuUserPwd: TFuUserPwd
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Usuario / Senha'
  ClientHeight = 240
  ClientWidth = 372
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 25
  object Label1: TLabel
    Left = 28
    Top = 48
    Width = 70
    Height = 25
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 252
    Top = 48
    Width = 58
    Height = 25
    Caption = 'Senha'
  end
  object LabMsg: TLabel
    Left = 28
    Top = 109
    Width = 70
    Height = 25
    Caption = 'LabMsg'
  end
  object LabTentativas: TLabel
    Left = 28
    Top = 140
    Width = 79
    Height = 16
    Caption = 'LabTentativas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edUsuario: TEdit
    Left = 28
    Top = 70
    Width = 209
    Height = 33
    TabOrder = 0
    Text = 'edUsuario'
    OnKeyDown = edUsuarioKeyDown
  end
  object edSenha: TEdit
    Left = 252
    Top = 70
    Width = 85
    Height = 33
    MaxLength = 6
    PasswordChar = '*'
    TabOrder = 1
    Text = 'edSenha'
    OnKeyDown = edSenhaKeyDown
  end
  object btOk: TBitBtn
    Left = 28
    Top = 184
    Width = 129
    Height = 37
    Caption = 'Ok'
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
    TabOrder = 2
    OnClick = btOkClick
  end
  object btCancel: TBitBtn
    Left = 208
    Top = 184
    Width = 129
    Height = 37
    Caption = 'Cancelar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
      66666666666666666666650666666666650677F66666666667F6655066666666
      5506777F6666666677F66550666666655506677F6666666777F6655506666655
      50666777F66666777F66665550066555066666777FF66777F666666555505550
      66666667777F777F666666665555550666666666777777F66666666666555506
      66666666667777F66666666665555550666666666777777F6666666655505555
      06666666777F7777F6666665550666555066666777F666777F66665550666665
      550666777F66666777F665550666666655066777F666666677F6655506666666
      65066777F666666667F666666666666666666666666666666666}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btCancelClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 372
    Height = 37
    Align = alTop
    Caption = 'Informe'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
end
