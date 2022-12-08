object FuCaixa: TFuCaixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Caixa'
  ClientHeight = 253
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 45
    Top = 36
    Width = 39
    Height = 16
    Alignment = taRightJustify
    Caption = 'Turno:'
  end
  object Label2: TLabel
    Left = 50
    Top = 61
    Width = 35
    Height = 16
    Alignment = taRightJustify
    Caption = 'In'#237'cio:'
  end
  object Label3: TLabel
    Left = 59
    Top = 91
    Width = 26
    Height = 16
    Alignment = taRightJustify
    Caption = 'Fim:'
  end
  object Label4: TLabel
    Left = 12
    Top = 121
    Width = 73
    Height = 16
    Alignment = taRightJustify
    Caption = 'Saldo inicial:'
  end
  object dbTurno: TDBText
    Left = 85
    Top = 33
    Width = 61
    Height = 19
    AutoSize = True
    DataField = 'Turno'
    DataSource = uDM.DSRegCaixa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabRotina: TLabel
    Left = 0
    Top = 0
    Width = 261
    Height = 23
    Align = alTop
    Alignment = taCenter
    Caption = 'Abertura/Encerramento caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 282
  end
  object LabSaldoFim: TLabel
    Left = 20
    Top = 151
    Width = 65
    Height = 16
    Alignment = taRightJustify
    Caption = 'Saldo final:'
  end
  object edInicio: TDBEdit
    Left = 85
    Top = 58
    Width = 160
    Height = 24
    DataField = 'DtHrInicio'
    DataSource = uDM.DSRegCaixa
    TabOrder = 0
    OnKeyDown = edInicioKeyDown
  end
  object edFinal: TDBEdit
    Left = 85
    Top = 88
    Width = 159
    Height = 24
    DataField = 'DtHrFim'
    DataSource = uDM.DSRegCaixa
    TabOrder = 1
    OnKeyDown = edFinalKeyDown
  end
  object edSaldoIni: TDBEdit
    Left = 85
    Top = 118
    Width = 121
    Height = 24
    DataField = 'SaldoInicial'
    DataSource = uDM.DSRegCaixa
    TabOrder = 2
    OnKeyDown = edSaldoIniKeyDown
  end
  object btOk: TBitBtn
    Left = 8
    Top = 182
    Width = 115
    Height = 29
    Caption = '&Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 4
    OnClick = btOkClick
  end
  object btCancel: TBitBtn
    Left = 130
    Top = 181
    Width = 115
    Height = 29
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 5
    OnClick = btCancelClick
  end
  object edSaldoFim: TDBEdit
    Left = 85
    Top = 148
    Width = 121
    Height = 24
    DataField = 'SaldoFinal'
    DataSource = uDM.DSRegCaixa
    TabOrder = 3
    OnKeyDown = edSaldoFimKeyDown
  end
  object btLctCaixa: TBitBtn
    Left = 28
    Top = 216
    Width = 197
    Height = 29
    Caption = 'Lan'#231'amentos de caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
      555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
      05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
      FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
      FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
      FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
      05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
      555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
      9055575757575757775505050505055505557575757575557555}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 6
    OnClick = btLctCaixaClick
  end
end
