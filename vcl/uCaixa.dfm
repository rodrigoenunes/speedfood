object FuCaixa: TFuCaixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'C a i x a'
  ClientHeight = 371
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 19
  object LabRotina: TLabel
    Left = 0
    Top = 0
    Width = 384
    Height = 25
    Align = alTop
    Alignment = taCenter
    Caption = 'Abertura/Encerramento'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 251
  end
  object PanCaixa: TPanel
    Left = 0
    Top = 25
    Width = 384
    Height = 271
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 364
    ExplicitHeight = 261
    object Label2: TLabel
      Left = 74
      Top = 52
      Width = 44
      Height = 19
      Alignment = taRightJustify
      Caption = 'Caixa:'
    end
    object dbNrCaixa: TDBText
      Left = 124
      Top = 49
      Width = 96
      Height = 25
      AutoSize = True
      DataField = 'NrCaixa'
      DataSource = uDM.DSRegCaixa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabSaldoIni: TLabel
      Left = 30
      Top = 148
      Width = 90
      Height = 19
      Alignment = taRightJustify
      Caption = 'Saldo inicial:'
    end
    object LabSaldoFim: TLabel
      Left = 40
      Top = 220
      Width = 80
      Height = 19
      Alignment = taRightJustify
      Caption = 'Saldo final:'
    end
    object LabTurnoAtual: TLabel
      Left = 43
      Top = 80
      Width = 77
      Height = 19
      Alignment = taRightJustify
      Caption = 'Sequencia:'
    end
    object DBText1: TDBText
      Left = 126
      Top = 80
      Width = 60
      Height = 19
      AutoSize = True
      DataField = 'CaixaSeq'
      DataSource = uDM.DSRegCaixa
    end
    object DBText2: TDBText
      Left = 124
      Top = 116
      Width = 60
      Height = 19
      AutoSize = True
      DataField = 'DtHrInicio'
      DataSource = uDM.DSRegCaixa
    end
    object dbFechamento: TDBText
      Left = 124
      Top = 188
      Width = 103
      Height = 19
      AutoSize = True
      DataField = 'DtHrFim'
      DataSource = uDM.DSRegCaixa
    end
    object Label1: TLabel
      Left = 52
      Top = 116
      Width = 68
      Height = 19
      Alignment = taRightJustify
      Caption = 'Abertura:'
    end
    object LabFechamento: TLabel
      Left = 27
      Top = 188
      Width = 91
      Height = 19
      Alignment = taRightJustify
      Caption = 'Fechamento:'
    end
    object Label4: TLabel
      Left = 69
      Top = 20
      Width = 49
      Height = 19
      Alignment = taRightJustify
      Caption = 'Turno:'
    end
    object dbTurno: TDBText
      Left = 124
      Top = 16
      Width = 79
      Height = 25
      AutoSize = True
      DataField = 'Turno'
      DataSource = uDM.DSRegCaixa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edSaldoIni: TDBEdit
      Left = 124
      Top = 144
      Width = 121
      Height = 27
      DataField = 'SaldoInicial'
      DataSource = uDM.DSRegCaixa
      TabOrder = 0
      OnKeyDown = edSaldoIniKeyDown
    end
    object edSaldoFim: TDBEdit
      Left = 124
      Top = 216
      Width = 121
      Height = 27
      DataField = 'SaldoFinal'
      DataSource = uDM.DSRegCaixa
      TabOrder = 1
      OnKeyDown = edSaldoFimKeyDown
    end
  end
  object PanControle: TPanel
    Left = 0
    Top = 296
    Width = 384
    Height = 75
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 291
    object btOk: TBitBtn
      Left = 14
      Top = 8
      Width = 169
      Height = 57
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btOkClick
    end
    object btCancel: TBitBtn
      Left = 200
      Top = 8
      Width = 169
      Height = 57
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btCancelClick
    end
  end
end
