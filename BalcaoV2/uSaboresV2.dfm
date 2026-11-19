object FuSaboresV2: TFuSaboresV2
  Left = 0
  Top = 0
  Caption = 'FuSaboresV2'
  ClientHeight = 403
  ClientWidth = 587
  Color = 11009176
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    587
    403)
  TextHeight = 16
  object LabDrink: TLabel
    Left = 0
    Top = 0
    Width = 587
    Height = 35
    Align = alTop
    Alignment = taCenter
    Caption = 'LabDrink'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 112
  end
  object LabInstrucoes: TLabel
    Left = 8
    Top = 40
    Width = 130
    Height = 25
    Caption = 'LabInstrucoes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabSaborRetorno: TLabel
    Left = 480
    Top = 41
    Width = 99
    Height = 16
    Alignment = taRightJustify
    Caption = 'LabSaborRetorno'
  end
  object lstSabores: TListBox
    Left = 24
    Top = 71
    Width = 525
    Height = 321
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 39
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8')
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    OnClick = lstSaboresClick
  end
end
