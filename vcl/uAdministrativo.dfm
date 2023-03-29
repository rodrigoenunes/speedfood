object FuAdministrativo: TFuAdministrativo
  Left = 0
  Top = 0
  Caption = 'Administrativo'
  ClientHeight = 535
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  object gbTurnos: TGroupBox
    Left = 0
    Top = 0
    Width = 677
    Height = 145
    Align = alTop
    Caption = 'Per'#237'odo (Turnos) '#224' considerar'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 30
      Width = 75
      Height = 16
      Caption = 'Turno inicial:'
    end
    object Label2: TLabel
      Left = 18
      Top = 62
      Width = 67
      Height = 16
      Caption = 'Turno final:'
    end
    object LabProcess: TLabel
      Left = 18
      Top = 92
      Width = 64
      Height = 16
      Caption = 'LabProcess'
      Visible = False
    end
    object cbTurnoIni: TComboBox
      Left = 84
      Top = 27
      Width = 460
      Height = 24
      TabOrder = 0
      Text = 'cbTurnoIni'
    end
    object cbTurnoFin: TComboBox
      Left = 84
      Top = 59
      Width = 460
      Height = 24
      TabOrder = 1
      Text = 'cbTurnoFin'
    end
    object btProcessar: TBitBtn
      Left = 550
      Top = 27
      Width = 112
      Height = 25
      Caption = 'Processar'
      TabOrder = 2
      OnClick = btProcessarClick
    end
    object btSair: TBitBtn
      Left = 550
      Top = 59
      Width = 112
      Height = 25
      Caption = 'Sair/Cancelar'
      TabOrder = 3
      OnClick = btSairClick
    end
    object PBar1: TProgressBar
      Left = 18
      Top = 108
      Width = 644
      Height = 29
      TabOrder = 4
      Visible = False
    end
  end
  object PanResultado: TPanel
    Left = 0
    Top = 145
    Width = 677
    Height = 390
    Align = alClient
    TabOrder = 1
    Visible = False
    object Panel1: TPanel
      Left = 1
      Top = 348
      Width = 675
      Height = 41
      Align = alBottom
      TabOrder = 0
      DesignSize = (
        675
        41)
      object btNova: TBitBtn
        Left = 6
        Top = 6
        Width = 139
        Height = 25
        Caption = 'Nova consulta'
        TabOrder = 0
        OnClick = btNovaClick
      end
      object btImprimir: TBitBtn
        Left = 151
        Top = 6
        Width = 139
        Height = 25
        Caption = 'Imprimir'
        TabOrder = 1
        OnClick = btImprimirClick
      end
      object btSair2: TBitBtn
        Left = 527
        Top = 6
        Width = 138
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Sair/Cancelar'
        TabOrder = 2
        OnClick = btSairClick
      end
    end
    object PanValores: TPanel
      Left = 1
      Top = 1
      Width = 176
      Height = 347
      Align = alLeft
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 26
        Width = 47
        Height = 16
        Caption = 'Dinheiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 66
        Width = 77
        Height = 16
        Caption = 'Cart'#227'o d'#233'bito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 106
        Width = 81
        Height = 16
        Caption = 'Cart'#227'o cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 146
        Width = 19
        Height = 16
        Caption = 'PIX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 186
        Width = 38
        Height = 16
        Caption = 'Outros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 226
        Width = 52
        Height = 16
        Caption = 'Misto (*)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 270
        Width = 32
        Height = 16
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabObsMisto: TLabel
        Left = 8
        Top = 314
        Width = 210
        Height = 16
        Caption = '(*) Incluso nos meios de pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edReais: TEdit
        Left = 8
        Top = 40
        Width = 101
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = 'edReais'
      end
      object edQtdReais: TEdit
        Left = 113
        Top = 40
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'edQtdReais'
      end
      object edCDeb: TEdit
        Left = 8
        Top = 80
        Width = 101
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = 'edCDeb'
      end
      object edQtdCDeb: TEdit
        Left = 113
        Top = 80
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = 'edQtdReais'
      end
      object edCCred: TEdit
        Left = 8
        Top = 120
        Width = 101
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = 'edCCred'
      end
      object edQtdCCred: TEdit
        Left = 113
        Top = 120
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = 'edQtdReais'
      end
      object edPIX: TEdit
        Left = 8
        Top = 160
        Width = 101
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = 'edPIX'
      end
      object edQtdPIX: TEdit
        Left = 113
        Top = 160
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Text = 'edQtdReais'
      end
      object edOutros: TEdit
        Left = 8
        Top = 200
        Width = 101
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = 'edOutros'
      end
      object edQtdOutros: TEdit
        Left = 113
        Top = 200
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Text = 'edQtdReais'
      end
      object edMisto: TEdit
        Left = 8
        Top = 240
        Width = 101
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = 'edOutros'
      end
      object edQtdMisto: TEdit
        Left = 113
        Top = 240
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        Text = 'edQtdReais'
      end
      object edTotal: TEdit
        Left = 8
        Top = 284
        Width = 101
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Text = 'edTotal'
      end
      object edQtdTotal: TEdit
        Left = 114
        Top = 284
        Width = 43
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        Text = 'edQtdReais'
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 174
        Height = 24
        Align = alTop
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 14
        object Label10: TLabel
          Left = 8
          Top = 4
          Width = 52
          Height = 19
          Caption = 'Valores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object Panel3: TPanel
      Left = 177
      Top = 1
      Width = 499
      Height = 347
      Align = alClient
      TabOrder = 2
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 497
        Height = 24
        Align = alTop
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label11: TLabel
          Left = 8
          Top = 4
          Width = 63
          Height = 19
          Caption = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 305
        Width = 497
        Height = 41
        Align = alBottom
        TabOrder = 1
        object NavItens: TDBNavigator
          Left = 8
          Top = 6
          Width = 124
          Height = 30
          DataSource = uDM.SResVendas
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
      end
      object GridItens: TDBGrid
        Left = 1
        Top = 25
        Width = 497
        Height = 280
        Align = alClient
        DataSource = uDM.SResVendas
        DrawingStyle = gdsClassic
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZC_Cod'
            Title.Alignment = taCenter
            Title.Caption = 'Cod'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 291
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quant'
            Title.Alignment = taRightJustify
            Title.Caption = 'Qtd'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Width = 79
            Visible = True
          end>
      end
    end
  end
end
