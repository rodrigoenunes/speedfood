object FuItens: TFuItens
  Left = 228
  Top = 89
  Caption = 'Cadastro geral de '#237'tens / produtos'
  ClientHeight = 475
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnResize = FormResize
  TextHeight = 16
  object PanDados: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 408
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 416
    object PanManut: TPanel
      Left = 1
      Top = 84
      Width = 982
      Height = 323
      Align = alBottom
      Enabled = False
      TabOrder = 0
      ExplicitTop = 92
      object dbTipo: TDBRadioGroup
        Left = 1
        Top = 1
        Width = 190
        Height = 321
        Align = alLeft
        Caption = 'Tipo'
        DataField = 'Grupo'
        DataSource = uDM.DSItens
        Items.Strings = (
          'Lanches'
          'Extras lanche'
          'Bebidas'
          'B'#225'sicos'
          'Extras basico'
          'Diversos')
        TabOrder = 0
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6')
        OnClick = dbTipoClick
        OnExit = edZC_KeyChange
      end
      object PanDetalhe: TPanel
        Left = 191
        Top = 1
        Width = 790
        Height = 321
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 20
          Top = 0
          Width = 39
          Height = 16
          Caption = 'Codigo'
        end
        object Label3: TLabel
          Left = 72
          Top = 0
          Width = 55
          Height = 16
          Caption = 'Descri'#231#227'o'
        end
        object Label5: TLabel
          Left = 444
          Top = 0
          Width = 32
          Height = 16
          Caption = 'Pre'#231'o'
        end
        object Label16: TLabel
          Left = 20
          Top = 44
          Width = 46
          Height = 16
          Caption = 'Unidade'
        end
        object Label4: TLabel
          Left = 72
          Top = 44
          Width = 54
          Height = 16
          Caption = 'Tamanho'
        end
        object Label17: TLabel
          Left = 156
          Top = 44
          Width = 98
          Height = 16
          Caption = 'C'#243'digo de barras'
        end
        object ImgItem: TImage
          Left = 562
          Top = 84
          Width = 120
          Height = 120
          Stretch = True
        end
        object Label1: TLabel
          Left = 20
          Top = 84
          Width = 111
          Height = 16
          Caption = 'Descri'#231#227'o completa'
        end
        object Label15: TLabel
          Left = 20
          Top = 160
          Width = 47
          Height = 16
          Alignment = taRightJustify
          Caption = 'Imagem'
        end
        object sbImagem: TSpeedButton
          Left = 504
          Top = 175
          Width = 44
          Height = 25
          Caption = '...'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F8F3333333333333000333333333333F888333333333333
            000333333333333F888333333333333000333333333333F88833333333333300
            033333333FFF3F888333333800083B803333333F8883F88833333308888800B3
            33333388333888833333308F7F7F8033333338F3333338F3333388F7FFF7F883
            333338333333383F3333087FFFFF780333338F333333338F333308FFFFFFF803
            33338F333333338F3333087FFFFF7803333383F333333383333388F7FFF7F883
            333338F3333338F33333308F7F7F80333333383FF333F8333333330888880333
            333333883FF88333333333380008333333333333888333333333}
          NumGlyphs = 2
          Visible = False
          OnClick = sbImagemClick
        end
        object Label20: TLabel
          Left = 52
          Top = 297
          Width = 143
          Height = 17
          Caption = 'PPPPPPPPPPP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Wingdings 2'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object dbCodigo: TDBEdit
          Left = 20
          Top = 14
          Width = 48
          Height = 24
          DataField = 'Codigo'
          DataSource = uDM.DSItens
          TabOrder = 0
        end
        object dbDescricao: TDBEdit
          Left = 72
          Top = 14
          Width = 368
          Height = 24
          DataField = 'Descricao'
          DataSource = uDM.DSItens
          TabOrder = 1
        end
        object dbPreco: TDBEdit
          Left = 444
          Top = 14
          Width = 81
          Height = 24
          DataField = 'Preco'
          DataSource = uDM.DSItens
          TabOrder = 2
        end
        object PanCor: TPanel
          Left = 536
          Top = 5
          Width = 71
          Height = 54
          Hint = 'Bot'#227'o direito define a cor, bot'#227'o esquerdo adota a cor'
          Caption = 'Cor'
          Color = clHotLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          OnClick = PanCorClick
        end
        object edZC_Key: TDBEdit
          Left = 314
          Top = 58
          Width = 101
          Height = 24
          DataField = 'ZC_Key'
          DataSource = uDM.DSItens
          TabOrder = 4
          Visible = False
          OnChange = edZC_KeyChange
        end
        object dbUnid: TDBEdit
          Left = 20
          Top = 58
          Width = 48
          Height = 24
          DataField = 'Unidade'
          DataSource = uDM.DSItens
          TabOrder = 5
        end
        object dbTamanho: TDBEdit
          Left = 72
          Top = 58
          Width = 80
          Height = 24
          DataField = 'Tamanho'
          DataSource = uDM.DSItens
          TabOrder = 6
        end
        object dbCodBarras: TDBEdit
          Left = 156
          Top = 58
          Width = 152
          Height = 24
          DataField = 'CodBarras'
          DataSource = uDM.DSItens
          TabOrder = 7
        end
        object cbAlteraPreco: TDBCheckBox
          Left = 20
          Top = 208
          Width = 171
          Height = 17
          Caption = 'Permite altera'#231#227'o de valor'
          DataField = 'AlteraPreco'
          DataSource = uDM.DSItens
          TabOrder = 10
        end
        object dbDescrCompl: TDBMemo
          Left = 20
          Top = 98
          Width = 528
          Height = 60
          DataField = 'DescrCompleta'
          DataSource = uDM.DSItens
          TabOrder = 8
        end
        object dbImagem: TDBEdit
          Left = 20
          Top = 175
          Width = 478
          Height = 24
          DataField = 'Imagem'
          DataSource = uDM.DSItens
          TabOrder = 9
          OnExit = dbImagemExit
        end
        object gbFiscais: TGroupBox
          Left = 20
          Top = 231
          Width = 637
          Height = 60
          Caption = 'Dados fiscais'
          TabOrder = 12
          object Label6: TLabel
            Left = 8
            Top = 16
            Width = 31
            Height = 16
            Caption = 'CFOP'
          end
          object Label7: TLabel
            Left = 57
            Top = 16
            Width = 26
            Height = 16
            Caption = 'NCM'
          end
          object Label8: TLabel
            Left = 148
            Top = 16
            Width = 41
            Height = 16
            Caption = 'CSOSN'
          end
          object Label9: TLabel
            Left = 198
            Top = 16
            Width = 24
            Height = 16
            Caption = 'CST'
          end
          object Label10: TLabel
            Left = 236
            Top = 16
            Width = 68
            Height = 16
            Caption = '%Red ICMS'
          end
          object Label11: TLabel
            Left = 309
            Top = 16
            Width = 55
            Height = 16
            Caption = 'Aliq ICMS'
          end
          object Label12: TLabel
            Left = 372
            Top = 16
            Width = 44
            Height = 16
            Caption = 'CST-IPI'
          end
          object Label13: TLabel
            Left = 422
            Top = 16
            Width = 48
            Height = 16
            Caption = 'CST-PIS'
          end
          object Label14: TLabel
            Left = 476
            Top = 16
            Width = 73
            Height = 16
            Caption = 'CST-COFINS'
          end
          object Label18: TLabel
            Left = 558
            Top = 16
            Width = 54
            Height = 16
            Caption = '%MVAST'
          end
          object dbCFOP: TDBEdit
            Left = 8
            Top = 30
            Width = 45
            Height = 24
            DataField = 'CFOP'
            DataSource = uDM.DSItens
            TabOrder = 0
          end
          object dbNCM: TDBEdit
            Left = 57
            Top = 30
            Width = 85
            Height = 24
            DataField = 'NCM'
            DataSource = uDM.DSItens
            TabOrder = 1
          end
          object DBEdit1: TDBEdit
            Left = 147
            Top = 30
            Width = 45
            Height = 24
            DataField = 'CSOSN'
            DataSource = uDM.DSItens
            TabOrder = 2
          end
          object DBEdit2: TDBEdit
            Left = 198
            Top = 30
            Width = 33
            Height = 24
            DataField = 'CST'
            DataSource = uDM.DSItens
            TabOrder = 3
          end
          object DBEdit3: TDBEdit
            Left = 236
            Top = 30
            Width = 69
            Height = 24
            DataField = 'PcReduz'
            DataSource = uDM.DSItens
            TabOrder = 4
          end
          object DBEdit4: TDBEdit
            Left = 309
            Top = 30
            Width = 57
            Height = 24
            DataField = 'AliqICMS'
            DataSource = uDM.DSItens
            TabOrder = 5
          end
          object DBEdit5: TDBEdit
            Left = 378
            Top = 30
            Width = 33
            Height = 24
            DataField = 'CST_IPI'
            DataSource = uDM.DSItens
            TabOrder = 6
          end
          object DBEdit6: TDBEdit
            Left = 430
            Top = 30
            Width = 33
            Height = 24
            DataField = 'CST_PIS'
            DataSource = uDM.DSItens
            TabOrder = 7
          end
          object DBEdit7: TDBEdit
            Left = 496
            Top = 30
            Width = 33
            Height = 24
            DataField = 'CST_COFINS'
            DataSource = uDM.DSItens
            TabOrder = 8
          end
          object DBEdit8: TDBEdit
            Left = 558
            Top = 30
            Width = 69
            Height = 24
            DataField = 'pMVAST'
            DataSource = uDM.DSItens
            TabOrder = 9
          end
        end
        object btOk: TBitBtn
          Left = 664
          Top = 216
          Width = 104
          Height = 44
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
          TabOrder = 13
          Visible = False
          OnClick = btOkClick
        end
        object btCancel: TBitBtn
          Left = 664
          Top = 266
          Width = 104
          Height = 44
          Caption = '&Cancelar'
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
          TabOrder = 14
          Visible = False
          OnClick = btCancelClick
        end
        object cbEtiqueta: TDBCheckBox
          Left = 304
          Top = 208
          Width = 171
          Height = 17
          Caption = 'Emite etiqueta'
          DataField = 'Etiqueta'
          DataSource = uDM.DSItens
          TabOrder = 11
        end
      end
    end
    object GridProds: TDBGrid
      Left = 1
      Top = 1
      Width = 982
      Height = 83
      Align = alClient
      DataSource = uDM.DSItens
      DrawingStyle = gdsClassic
      FixedColor = clMoneyGreen
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = GridProdsDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'ZC_Grupo'
          Title.Caption = 'Grupo'
          Width = 87
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Codigo'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 365
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Preco'
          Title.Alignment = taRightJustify
          Title.Caption = 'Pre'#231'o'
          Width = 81
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ZC_AltPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Wingdings 2'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'P'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ZC_Etiqueta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Wingdings 2'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'E'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZC_Cor'
          Title.Caption = 'Cor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tamanho'
          Width = 89
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CFOP'
          Title.Alignment = taCenter
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NCM'
          Width = 85
          Visible = True
        end>
    end
  end
  object PanBottom: TPanel
    Left = 0
    Top = 408
    Width = 984
    Height = 67
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      984
      67)
    object LabNRegs: TLabel
      Left = 9
      Top = 37
      Width = 56
      Height = 16
      Caption = 'LabNRegs'
    end
    object Label19: TLabel
      Left = 146
      Top = 4
      Width = 45
      Height = 16
      Caption = 'Sele'#231#227'o'
    end
    object NavProds: TDBNavigator
      Left = 9
      Top = 6
      Width = 124
      Height = 25
      DataSource = uDM.DSItens
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
    end
    object btIncluir: TBitBtn
      Left = 546
      Top = 12
      Width = 103
      Height = 33
      Anchors = [akTop, akRight]
      Caption = '&Incluir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333300003333333333338888F33333333333099033
        33333333338F38F3333333333309903333333333338F38F33333333333099033
        33333333338F38F3333333333309903333333FFFFF8F38FFFFFF300000099000
        0003388888833888888F3099999999999903383333333333338F309999999999
        990338FFFFFF3FFFFF8F30000009900000033888888F3888888F333333099033
        33333333338F38F3333333333309903333333333338F38F33333333333099033
        33333333338F38F3333333333309903333333333338FF8F33333333333000033
        3333333333888833333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btIncluirClick
      OnMouseDown = btIncluirMouseDown
    end
    object btAlterar: TBitBtn
      Left = 655
      Top = 12
      Width = 99
      Height = 33
      Anchors = [akTop, akRight]
      Caption = '&Alterar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btAlterarClick
    end
    object btExcluir: TBitBtn
      Left = 764
      Top = 12
      Width = 103
      Height = 33
      Anchors = [akTop, akRight]
      Caption = '&Excluir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        33333333333333333333333333333333333333FFFFFFFFFFFFFF300000000000
        0003388888888888888F309999999999990338F333333333338F309999999999
        990338FFFFFFFFFFFF8F30000000000000033888888888888883333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btExcluirClick
    end
    object btSair: TBitBtn
      Left = 873
      Top = 12
      Width = 103
      Height = 33
      Anchors = [akTop, akRight]
      Caption = '&Sair'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333388888888888F333301BBBBBBBB033333883F3333338F3333011BBBBBBB
        0333338F83F333338F33330111BBBBBB0333338F383F33338F333301110BBBBB
        0333338F338F33338F333301110BBBBB0333338F338F33338F333301110BBBBB
        0333338F338F33338F3F3301110BBBBB0393338F338F33338FF83301110BBBBB
        0993338F338F3F338F883301110BB9BB9993338F338FF8F3F883330111B0B9B9
        9933338F338838FF88333301110BB9999333338F338F38F88F333301110BB999
        0333338F3F8F38888F333301E10BB9999933338F8F8F388888333301EE0BBBBB
        0333338F888FFFFF8F3333000000000003333388888888888333}
      NumGlyphs = 2
      TabOrder = 4
      OnClick = btSairClick
    end
    object cbSelec: TComboBox
      Left = 146
      Top = 18
      Width = 275
      Height = 43
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = 'cbSelec'
      OnChange = cbSelecChange
    end
    object cbSelCod: TComboBox
      Left = 282
      Top = 6
      Width = 60
      Height = 24
      TabOrder = 6
      Text = 'cbSelCod'
      Visible = False
    end
    object btAjustaEtq: TBitBtn
      Left = 437
      Top = 12
      Width = 103
      Height = 33
      Anchors = [akTop, akRight]
      Caption = 'Etiquetas'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0030FFFFFFF0FF
        FFFF38F3333338F3333330FFFFFFF0FFFFFF38FFFFFFF8FFFFFF330000000300
        0000338888888388888830FFFFFFF0FFFFFF38F3333338F3333330FFFFFFF0FF
        FFFF38F3333338F3333330FFFFFFF0FFFFFF38FFFFFFF8FFFFFF330000000300
        0000338888888388888830FFFFFFF0FFFFFF38F3333338F3333330FFFFFFF0FF
        FFFF38F3333338F3333330FFFFFFF0FFFFFF38FFFFFFF8FFFFFF330000000300
        0000338888888388888830FFFFFFF0FFFFFF38F3333338F3333330FFFFFFF0FF
        FFFF38F3333338F3333330FFFFFFF0FFFFFF38FFFFFFF8FFFFFF330000000300
        0000338888888388888833333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 7
      TabStop = False
      OnClick = btAjustaEtqClick
      OnMouseDown = btIncluirMouseDown
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Imagens|*.bmp;*.jpg'
    Left = 720
    Top = 36
  end
  object ColorDialog1: TColorDialog
    Left = 524
    Top = 32
  end
end
