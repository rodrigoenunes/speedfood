object FuMontarLanche: TFuMontarLanche
  Left = 0
  Top = 0
  Caption = 'Monte o lanche'
  ClientHeight = 491
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object PanMontagem: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 491
    Align = alClient
    TabOrder = 0
    object LabBase: TLabel
      Left = 8
      Top = 66
      Width = 76
      Height = 39
      Caption = 'Base'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabComp: TLabel
      Left = 373
      Top = 66
      Width = 240
      Height = 39
      Caption = 'Complementos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabAux1: TLabel
      Left = 24
      Top = 260
      Width = 42
      Height = 13
      Caption = 'LabAux1'
    end
    object PanIdLanche: TPanel
      Left = 1
      Top = 1
      Width = 772
      Height = 59
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
      DesignSize = (
        772
        59)
      object dbDescricao: TDBText
        Left = 8
        Top = 12
        Width = 165
        Height = 33
        Anchors = [akLeft, akTop, akRight]
        AutoSize = True
        DataField = 'Descricao'
        DataSource = uDM.SPedWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 594
        Top = 12
        Width = 32
        Height = 33
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbTotal: TDBEdit
        Left = 632
        Top = 9
        Width = 127
        Height = 41
        TabStop = False
        Anchors = [akTop, akRight]
        DataField = 'VlrTotal'
        DataSource = uDM.SPedWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object PanRodape: TPanel
      Left = 1
      Top = 374
      Width = 772
      Height = 116
      Align = alBottom
      Color = 6993407
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        772
        116)
      object imgObs: TImage
        Left = 7
        Top = 60
        Width = 36
        Height = 40
        Picture.Data = {
          07544269746D6170C61F0000424DC61F00000000000036040000280000004800
          0000620000000100080000000000901B00000000000000000000000100000000
          000000000000000080000080000000808000800000008000800080800000C0C0
          C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
          E00000400000004020000040400000406000004080000040A0000040C0000040
          E00000600000006020000060400000606000006080000060A0000060C0000060
          E00000800000008020000080400000806000008080000080A0000080C0000080
          E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
          E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
          E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
          E00040000000400020004000400040006000400080004000A0004000C0004000
          E00040200000402020004020400040206000402080004020A0004020C0004020
          E00040400000404020004040400040406000404080004040A0004040C0004040
          E00040600000406020004060400040606000406080004060A0004060C0004060
          E00040800000408020004080400040806000408080004080A0004080C0004080
          E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
          E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
          E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
          E00080000000800020008000400080006000800080008000A0008000C0008000
          E00080200000802020008020400080206000802080008020A0008020C0008020
          E00080400000804020008040400080406000804080008040A0008040C0008040
          E00080600000806020008060400080606000806080008060A0008060C0008060
          E00080800000808020008080400080806000808080008080A0008080C0008080
          E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
          E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
          E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
          E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
          E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
          E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
          E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
          E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
          E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
          E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
          A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0900000000000000000909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090000000000000000000000000000090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090900000000000000000000000000000000090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909000000000000000000000000
          0000000000000909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090000000000
          0000000000000000000000000000000909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909000000000000000909090909090900000000000000090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090900000000000909090909090909090909000000000009
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909000000000009090909090909090909
          0909090000000000090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090900000000090909
          0909090909090909090909090000000009090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0900000000090909090909090909090909090909000000000909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090000000009090909090909090909090909090900000000
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909000000000909090909090909090909
          0909090900000000090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090900000000090909
          0909090909090909090909090000000009090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0900000000090909090909090909090909090909000000000909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090000000000090909090909090909090909090000000000
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090000000000090909090909090909
          0909000000000009090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909000000000000
          0009090909090909000000000000000909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909000000000000000000000000000000000000000009090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909000000000000000000000000000000000000090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909000000000000000000000000
          0000000009090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909000000
          0000000000000000000000090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909000000000000000009090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090900000000000000000000000000000000000000000000000000
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090000000000000000000000000000000000
          0000000000000000090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909000000000000000000
          0000000000000000000000000000000009090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090900
          0000000000000000000000000000000000000000000000000909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090900000000000000000000000000000000000000000000000909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090900000009090909
          0909090000000009090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0000000009090909090909000000000909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090900000000090909090909090909000000000909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090000000009090909090909090900000000
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909000000000909090909
          0909090900000000090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090900
          0000000000090909090900000000000009090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090900000000000000000000000000000000000909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090900000000000000000000000000000009
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090000000000000000
          0000000000000909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0900000000000000000000000009090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090000000000000009090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090900000000090909090900000000090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909000000000000090909090000000000
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090000000000000000
          0909090900000000090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090900
          0000000000000000000909090000000009090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090900000000090900000000090909000000000909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090000000009090000000009090900000000
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909000000000909090000
          0000090900000000090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090900
          0000000909090000000000000000000009090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090900000000090909000000000000000000090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090000000000090909000000000000000009
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090000000009090900
          0000000000000909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090000000009090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090900
          0000000000090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090900000000000009090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090000000000000909090909090909090909
          0909090909090909090909090909090909090909090909090909090909090909
          0909090909090909090909090909090909090909090909000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000}
        Stretch = True
      end
      object dbPrensado: TDBCheckBox
        Left = 7
        Top = 16
        Width = 130
        Height = 24
        Caption = 'Prensar'
        DataField = 'Prensado'
        DataSource = uDM.SPedWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbCortado: TDBCheckBox
        Left = 160
        Top = 16
        Width = 129
        Height = 24
        Caption = 'Cortar'
        DataField = 'Cortado'
        DataSource = uDM.SPedWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object dbObserv: TDBMemo
        Left = 42
        Top = 60
        Width = 468
        Height = 40
        TabStop = False
        DataField = 'Observ'
        DataSource = uDM.SPedWrk
        TabOrder = 2
      end
      object btOkLanche: TBitBtn
        Left = 556
        Top = 8
        Width = 211
        Height = 48
        Anchors = [akTop, akRight]
        Caption = '&Ok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76040000424D7604000000000000760000002800000040000000200000000100
          0400000000000004000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFDDDDDDDDDDDDDDDDDDDDDDDDDDD22
          22DDDDDDDDDDDDDDDDDDDDDDDDDDDD8888FDDDDDDDDDDDDDDDDDDDDDDDDDDD22
          222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDDDDDDDDDDDDDDD22
          222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDDDDDDDDDDDDDDD22
          222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDDDDDDDDDDDDDD222
          2222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDDDDDDDDDDDDD222
          2222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDDDDDDDDDDDDD222
          22222DDDDDDDDDDDDDDDDDDDDDDDD88888888FDDDDDDDDDDDDDDDDDDDDDD2222
          22222DDDDDDDDDDDDDDDDDDDDDDD888888888FDDDDDDDDDDDDDDDDDDDDDD2222
          D2222DDDDDDDDDDDDDDDDDDDDDDD8888F8888FDDDDDDDDDDDDDDDDDDDDDD2222
          DD2222DDDDDDDDDDDDDDDDDDDDDD8888FD8888FDDDDDDDDDDDDDDDDDDDD22222
          DD2222DDDDDDDDDDDDDDDDDDDDD88888DD8888FDDDDDDDDDDDDDDDDDDDD2222D
          DD22222DDDDDDDDDDDDDDDDDDDD8888DDD88888FDDDDDDDDDDDDDDDDDD22222D
          DDD22222DDDDDDDDDDDDDDDDDD88888DDDD88888FDDDDDDDDDDDDDDDDD2222DD
          DDD22222DDDDDDDDDDDDDDDDDD8888DDDDD88888FDDDDDDDDDDDDDDDD22222DD
          DDDD22222DDDDDDDDDDDDDDDD88888DDDDDD88888FDDDDDDDDDDDDDD22222DDD
          DDDDD22222DDDDDDDDDDDDDD88888DDDDDDDD88888FDDDDDDDDDDDD222222DDD
          DDDDD222222DDDDDDDDDDDD888888DDDDDDDD888888FDDDDDDDDD2222222DDDD
          DDDDDD222222DDDDDDDDD8888888DDDDDDDDDD888888FDDDDDDDDD22222DDDDD
          DDDDDDD222222DDDDDDDDD88888DDDDDDDDDDDD888888FDDDDDDDDD222DDDDDD
          DDDDDDDD222222DDDDDDDDD888DDDDDDDDDDDDDD888888FFDDDDDDDDDDDDDDDD
          DDDDDDDDD2222222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDDDD
          DDDDDDDDDD2222222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FFDDDDDDDDDDDDD
          DDDDDDDDDDD2222222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDD
          DDDDDDDDDDDDD22222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDD
          DDDDDDDDDDDDDD2222DDDDDDDDDDDDDDDDDDDDDDDDDDDD8888FDDDDDDDDDDDDD
          DDDDDDDDDDDDDDD222DDDDDDDDDDDDDDDDDDDDDDDDDDDDD888DDDDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 3
        OnClick = btOkLancheClick
      end
      object btCanLanche: TBitBtn
        Left = 556
        Top = 60
        Width = 211
        Height = 48
        Anchors = [akTop, akRight]
        Caption = '&Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
        TabOrder = 4
        OnClick = btCanLancheClick
      end
    end
    object GridBase: TDrawGrid
      Left = 9
      Top = 112
      Width = 196
      Height = 120
      ColCount = 4
      DoubleBuffered = True
      FixedCols = 0
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goFixedRowDefAlign]
      ParentDoubleBuffered = False
      ScrollBars = ssVertical
      TabOrder = 2
      OnDrawCell = GridBaseDrawCell
      OnMouseDown = GridBaseMouseDown
    end
    object GridComp: TDrawGrid
      Left = 373
      Top = 111
      Width = 196
      Height = 121
      ColCount = 4
      DoubleBuffered = True
      FixedCols = 0
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goFixedRowDefAlign]
      ParentDoubleBuffered = False
      ScrollBars = ssVertical
      TabOrder = 3
      OnDrawCell = GridCompDrawCell
      OnMouseDown = GridCompMouseDown
    end
  end
end
