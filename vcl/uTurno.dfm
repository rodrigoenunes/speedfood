object FuTurno: TFuTurno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'T u r n o'
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
  object PanTurno: TPanel
    Left = 0
    Top = 25
    Width = 384
    Height = 271
    Align = alClient
    TabOrder = 0
    DesignSize = (
      384
      271)
    object Label1: TLabel
      Left = 56
      Top = 28
      Width = 88
      Height = 19
      Alignment = taRightJustify
      Caption = 'Turno atual:'
    end
    object dbTurno: TDBText
      Left = 148
      Top = 24
      Width = 79
      Height = 25
      AutoSize = True
      DataField = 'NrTurno'
      DataSource = uDM.DSTurnos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabInicio: TLabel
      Left = 59
      Top = 84
      Width = 45
      Height = 19
      Alignment = taRightJustify
      Caption = 'In'#237'cio:'
    end
    object LabFim: TLabel
      Left = 72
      Top = 148
      Width = 32
      Height = 19
      Alignment = taRightJustify
      Caption = 'Fim:'
    end
    object dbTxtStatus: TDBText
      Left = 285
      Top = 232
      Width = 84
      Height = 19
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      AutoSize = True
      DataField = 'Status'
      DataSource = uDM.DSTurnos
    end
    object edInicio: TDBEdit
      Left = 110
      Top = 81
      Width = 172
      Height = 27
      DataField = 'DtHrInicio'
      DataSource = uDM.DSTurnos
      TabOrder = 0
      OnKeyDown = edInicioKeyDown
    end
    object edFinal: TDBEdit
      Left = 110
      Top = 145
      Width = 172
      Height = 27
      DataField = 'DtHrFim'
      DataSource = uDM.DSTurnos
      Enabled = False
      TabOrder = 1
      OnKeyDown = edFinalKeyDown
    end
  end
  object PanControle: TPanel
    Left = 0
    Top = 296
    Width = 384
    Height = 75
    Align = alBottom
    TabOrder = 1
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
      TabOrder = 0
      OnClick = btOkClick
    end
    object btCancel: TBitBtn
      Left = 200
      Top = 8
      Width = 169
      Height = 57
      Caption = '&Not Ok'
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
      TabOrder = 1
      OnClick = btCancelClick
    end
  end
end
