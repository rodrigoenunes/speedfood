object FuImpressoes: TFuImpressoes
  Left = 0
  Top = 0
  Caption = 'FuImpressoes'
  ClientHeight = 681
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLCaixa: TRLReport
    Left = 8
    Top = 8
    Width = 302
    Height = 454
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = uDM.DSLctCaixa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = '9'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 80.000000000000000000
    PageSetup.PaperHeight = 120.000000000000000000
    BeforePrint = RLCaixaBeforePrint
    object RLCx_Cabec: TRLBand
      Left = 19
      Top = 19
      Width = 264
      Height = 47
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLDBText2: TRLDBText
        Left = 204
        Top = 16
        Width = 60
        Height = 15
        Align = faRightTop
        Alignment = taRightJustify
        DataField = 'ZC_IniFim'
        DataSource = uDM.DSRegCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabEmis: TRLLabel
        Left = 208
        Top = 32
        Width = 56
        Height = 14
        Align = faRightBottom
        Alignment = taRightJustify
      end
      object RLDBText3: TRLDBText
        Left = 0
        Top = 16
        Width = 73
        Height = 15
        DataField = 'Turno'
        DataSource = uDM.DSRegCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Turno: '
      end
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 264
        Height = 16
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText1: TRLDBText
          Left = 0
          Top = 0
          Width = 49
          Height = 15
          DataField = 'fantasia'
          DataSource = uDM.DSSisPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel1: TRLLabel
          Left = 229
          Top = 0
          Width = 35
          Height = 15
          Align = faRightTop
          Alignment = taRightJustify
          Caption = 'Caixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLCx_Cols: TRLBand
      Left = 19
      Top = 66
      Width = 264
      Height = 16
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel2: TRLLabel
        Left = 1
        Top = 0
        Width = 22
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Seq'
      end
      object RLLabel3: TRLLabel
        Left = 23
        Top = 0
        Width = 20
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Op'
      end
      object RLLabCxSdo: TRLLabel
        Left = 209
        Top = 0
        Width = 55
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo'
      end
      object RLLabCxVlr: TRLLabel
        Left = 154
        Top = 0
        Width = 55
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor'
      end
      object RLLabel6: TRLLabel
        Left = 43
        Top = 0
        Width = 45
        Height = 14
        Caption = 'Hist'#243'rico'
      end
    end
    object RLCx_Detal: TRLBand
      Left = 19
      Top = 82
      Width = 264
      Height = 16
      object RLDBText4: TRLDBText
        Left = 0
        Top = 0
        Width = 22
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'Sequencia'
        DataSource = uDM.DSLctCaixa
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 23
        Top = 0
        Width = 20
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'ZC_OpAbrv'
        DataSource = uDM.DSLctCaixa
        Text = ''
      end
      object RLDbCxHist: TRLDBText
        Left = 43
        Top = 0
        Width = 111
        Height = 14
        AutoSize = False
        DataField = 'Historico'
        DataSource = uDM.DSLctCaixa
        Text = ''
      end
      object RLDbCxVlr: TRLDBText
        Left = 154
        Top = 0
        Width = 55
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Valor'
        DataSource = uDM.DSLctCaixa
        Text = ''
      end
      object RLDbCxSdo: TRLDBText
        Left = 209
        Top = 0
        Width = 55
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Saldo'
        DataSource = uDM.DSLctCaixa
        Text = ''
      end
    end
    object RLCx_Sum: TRLBand
      Left = 19
      Top = 98
      Width = 264
      Height = 248
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLPanel3: TRLPanel
        Left = 0
        Top = 1
        Width = 264
        Height = 65
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel8: TRLLabel
          Left = 1
          Top = 16
          Width = 56
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Sdo Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = '9'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLDBText9: TRLDBText
          Left = 1
          Top = 31
          Width = 56
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'SaldoInicial'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDbCxVlrEnt: TRLDBText
          Left = 58
          Top = 31
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ZC_VlrEntradas'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDbCxQtdEnt: TRLDBText
          Left = 58
          Top = 45
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ZC_QtdEntradas'
          DataSource = uDM.DSRegCaixa
          Text = '[ # ]'
        end
        object RLDbCxVlrSai: TRLDBText
          Left = 120
          Top = 31
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ZC_VlrSaidas'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDbCxQtdSai: TRLDBText
          Left = 120
          Top = 45
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ZC_QtdSaidas'
          DataSource = uDM.DSRegCaixa
          Text = '[ # ]'
        end
        object RLLabCxSdoFin: TRLLabel
          Left = 182
          Top = 16
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Saldo final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = '9'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLDbCxSdoFin: TRLDBText
          Left = 182
          Top = 31
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'SaldoFinal'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLLabel7: TRLLabel
          Left = 104
          Top = 0
          Width = 55
          Height = 16
          Align = faCenterTop
          Caption = 'Resumo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabCxEnt: TRLLabel
          Left = 58
          Top = 16
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Entradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = '9'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLLabCxSai: TRLLabel
          Left = 120
          Top = 16
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Sa'#237'das'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = '9'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
      end
      object RLPanel2: TRLPanel
        Left = 0
        Top = 66
        Width = 137
        Height = 143
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel12: TRLLabel
          Left = -1
          Top = -2
          Width = 59
          Height = 16
          Caption = 'Entradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 16
          Top = 20
          Width = 19
          Height = 14
          Alignment = taRightJustify
          Caption = 'R$:'
        end
        object RLLabel10: TRLLabel
          Left = 9
          Top = 36
          Width = 26
          Height = 14
          Alignment = taRightJustify
          Caption = 'CDb:'
        end
        object RLLabel13: TRLLabel
          Left = 11
          Top = 52
          Width = 24
          Height = 14
          Alignment = taRightJustify
          Caption = 'CCr:'
        end
        object RLLabel14: TRLLabel
          Left = 14
          Top = 68
          Width = 21
          Height = 14
          Alignment = taRightJustify
          Caption = 'PIX:'
        end
        object RLLabel15: TRLLabel
          Left = 12
          Top = 84
          Width = 23
          Height = 14
          Alignment = taRightJustify
          Caption = 'Out:'
        end
        object RLLabel16: TRLLabel
          Left = 4
          Top = 104
          Width = 31
          Height = 14
          Alignment = taRightJustify
          Caption = 'Misto:'
        end
        object RLLabel17: TRLLabel
          Left = 10
          Top = 124
          Width = 25
          Height = 14
          Alignment = taRightJustify
          Caption = 'Sup:'
        end
        object RLDBText15: TRLDBText
          Left = 64
          Top = 20
          Width = 65
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'E_Dinheiro'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDBText16: TRLDBText
          Left = 64
          Top = 36
          Width = 65
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'E_CartaoDebito'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDBText17: TRLDBText
          Left = 64
          Top = 52
          Width = 65
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'E_CartaoCredito'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDBText18: TRLDBText
          Left = 64
          Top = 68
          Width = 65
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'E_PIX'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDBText19: TRLDBText
          Left = 64
          Top = 84
          Width = 65
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'E_Outros'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDBText20: TRLDBText
          Left = 64
          Top = 124
          Width = 65
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'E_Suprimento'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDBText21: TRLDBText
          Left = 35
          Top = 20
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd_Dinheiro'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
        object RLDBText22: TRLDBText
          Left = 35
          Top = 36
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd_CartaoDebito'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
        object RLDBText23: TRLDBText
          Left = 35
          Top = 52
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd_CartaoCredito'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
        object RLDBText24: TRLDBText
          Left = 35
          Top = 68
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd_PIX'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
        object RLDBText25: TRLDBText
          Left = 35
          Top = 84
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd_Outros'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
        object RLDBText26: TRLDBText
          Left = 35
          Top = 104
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd_Misto'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
        object RLDBText27: TRLDBText
          Left = 35
          Top = 124
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd_Suprimento'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
      end
      object RLPanel4: TRLPanel
        Left = 0
        Top = 230
        Width = 264
        Height = 17
        Align = faBottom
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBResult1: TRLDBResult
          Left = 65
          Top = 2
          Width = 134
          Height = 14
          Alignment = taCenter
          DataSource = uDM.DSLctCaixa
          Info = riCount
          Text = '# Lctos relacionados'
        end
      end
      object RLPanel5: TRLPanel
        Left = 137
        Top = 66
        Width = 127
        Height = 143
        Align = faClient
        object RLLabel20: TRLLabel
          Left = 3
          Top = 2
          Width = 47
          Height = 16
          Caption = 'Sa'#237'das'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 8
          Top = 24
          Width = 39
          Height = 14
          Alignment = taRightJustify
          Caption = 'Sa'#237'das:'
        end
        object RLDBText28: TRLDBText
          Left = 8
          Top = 40
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd_Saidas'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
        object RLDBText29: TRLDBText
          Left = 39
          Top = 40
          Width = 65
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'S_Saidas'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLLabel22: TRLLabel
          Left = 8
          Top = 68
          Width = 43
          Height = 14
          Alignment = taRightJustify
          Caption = 'Sangria:'
        end
        object RLDBText30: TRLDBText
          Left = 8
          Top = 84
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd_CartaoDebito'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
        object RLDBText31: TRLDBText
          Left = 39
          Top = 84
          Width = 65
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'E_CartaoDebito'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
      end
      object RLPanel6: TRLPanel
        Left = 0
        Top = 209
        Width = 264
        Height = 21
        Align = faBottom
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = '9'
        Font.Style = [fsBold]
        ParentFont = False
        object RLDBText44: TRLDBText
          Left = 107
          Top = 4
          Width = 40
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdPedidos'
          DataSource = uDM.DSRegCaixa
          Text = '[#]'
        end
        object RLLabel31: TRLLabel
          Left = 52
          Top = 4
          Width = 51
          Height = 14
          Alignment = taRightJustify
          Caption = 'Pedidos:'
        end
        object RLDBText45: TRLDBText
          Left = 152
          Top = 4
          Width = 80
          Height = 14
          DataField = 'VlrPedidos'
          DataSource = uDM.DSRegCaixa
          Text = 'R$ '
        end
      end
    end
    object RLBand2: TRLBand
      Left = 19
      Top = 346
      Width = 264
      Height = 17
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel28: TRLLabel
        Left = 175
        Top = 1
        Width = 89
        Height = 10
        Align = faRightTop
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'RLCaixa - SpeedFood 1.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object RLPedido: TRLReport
    Left = 316
    Top = 8
    Width = 302
    Height = 454
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = uDM.DSPedItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 80.000000000000000000
    PageSetup.PaperHeight = 120.000000000000000000
    object RLPedCab: TRLBand
      Left = 19
      Top = 19
      Width = 264
      Height = 52
      AutoSize = True
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLPanId: TRLPanel
        Left = 1
        Top = 1
        Width = 262
        Height = 16
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBText33: TRLDBText
          Left = 106
          Top = 0
          Width = 50
          Height = 15
          Align = faCenter
          Alignment = taCenter
          DataField = 'fantasia'
          DataSource = uDM.DSSisPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
      object RLDbPedido: TRLDBText
        Left = 170
        Top = 23
        Width = 93
        Height = 14
        Alignment = taRightJustify
        Anchors = [fkRight]
        DataField = 'ZC_NroLst'
        DataSource = uDM.DSPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Pedido: '
      end
      object RLDbDataPedido: TRLDBText
        Left = 178
        Top = 37
        Width = 85
        Height = 14
        Alignment = taRightJustify
        Anchors = [fkRight]
        DataField = 'ZC_DataHora'
        DataSource = uDM.DSPedidos
        Text = 'DH:'
      end
      object RLDBText41: TRLDBText
        Left = 39
        Top = 37
        Width = 74
        Height = 14
        DataField = 'NomeCliente'
        DataSource = uDM.DSPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel30: TRLLabel
        Left = 1
        Top = 37
        Width = 38
        Height = 14
        Caption = 'Cliente:'
      end
      object RLDbSenha: TRLDBText
        Left = 1
        Top = 17
        Width = 138
        Height = 19
        Align = faLeftTop
        DataField = 'ZC_Senha'
        DataSource = uDM.DSPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = 'Senha:'
      end
    end
    object RLPedColCab: TRLBand
      Left = 19
      Top = 71
      Width = 264
      Height = 16
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel23: TRLLabel
        Left = 0
        Top = 0
        Width = 18
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Sq'
      end
      object RLLabel24: TRLLabel
        Left = 18
        Top = 0
        Width = 12
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'T'
      end
      object RLLabel25: TRLLabel
        Left = 30
        Top = 0
        Width = 18
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Qt'
      end
      object RLLabel26: TRLLabel
        Left = 48
        Top = 0
        Width = 52
        Height = 14
        Caption = 'Descri'#231#227'o'
      end
      object RLLabUnitItem: TRLLabel
        Left = 180
        Top = 0
        Width = 40
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Unit'
      end
      object RLLabTotalItem: TRLLabel
        Left = 220
        Top = 0
        Width = 44
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total'
      end
    end
    object RLPedDetal: TRLBand
      Left = 19
      Top = 87
      Width = 264
      Height = 29
      AutoSize = True
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = RLPedDetalBeforePrint
      object RLDBText35: TRLDBText
        Left = 0
        Top = 0
        Width = 18
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'NrLcto'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLDBText36: TRLDBText
        Left = 18
        Top = 0
        Width = 12
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'ZC_Tp'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLDBText37: TRLDBText
        Left = 30
        Top = 0
        Width = 18
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'Quant'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLDbDescrItem: TRLDBText
        Left = 48
        Top = 0
        Width = 132
        Height = 14
        AutoSize = False
        DataField = 'ZC_Descricao'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLDbUnitItem: TRLDBText
        Left = 180
        Top = 0
        Width = 40
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VlrUnFiscal'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLDbTotalItem: TRLDBText
        Left = 220
        Top = 0
        Width = 44
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VlrTotal'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLMemoItem: TRLMemo
        Left = 0
        Top = 15
        Width = 261
        Height = 14
        Behavior = [beSiteExpander]
      end
    end
    object RLPedSum: TRLBand
      Left = 19
      Top = 116
      Width = 264
      Height = 42
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLDbTotalPed: TRLDBText
        Left = 186
        Top = 3
        Width = 78
        Height = 16
        Alignment = taRightJustify
        DataField = 'Valor'
        DataSource = uDM.DSPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = 'Total: '
      end
      object RLDBText43: TRLDBText
        Left = 3
        Top = 20
        Width = 175
        Height = 14
        DataField = 'ZC_MPExtenso'
        DataSource = uDM.DSPedidos
        Text = 'Meio de pagamento: '
      end
    end
    object RLPedFoot: TRLBand
      Left = 19
      Top = 158
      Width = 264
      Height = 17
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel32: TRLLabel
        Left = 172
        Top = 1
        Width = 92
        Height = 10
        Align = faRightTop
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'RLPedido - SpeedFood 1.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object RLResumo: TRLReport
    Left = 297
    Top = 268
    Width = 302
    Height = 454
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = uDM.SResVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 80.000000000000000000
    PageSetup.PaperHeight = 120.000000000000000000
    object RLRes_Cabec: TRLBand
      Left = 19
      Top = 19
      Width = 264
      Height = 44
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLPanel7: TRLPanel
        Left = 0
        Top = 0
        Width = 264
        Height = 16
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText46: TRLDBText
          Left = 0
          Top = 0
          Width = 49
          Height = 15
          Align = faLeftTop
          DataField = 'fantasia'
          DataSource = uDM.DSSisPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel33: TRLLabel
          Left = 214
          Top = 0
          Width = 50
          Height = 15
          Align = faRightTop
          Alignment = taRightJustify
          Caption = 'Resumo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLLabTurnoIni: TRLLabel
        Left = 0
        Top = 16
        Width = 63
        Height = 12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabTurnoFim: TRLLabel
        Left = 0
        Top = 30
        Width = 69
        Height = 12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLRes_Cols: TRLBand
      Left = 19
      Top = 63
      Width = 264
      Height = 16
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel34: TRLLabel
        Left = 0
        Top = 1
        Width = 30
        Height = 14
        Alignment = taCenter
        Caption = 'Cod'
      end
      object RLLabel35: TRLLabel
        Left = 30
        Top = 1
        Width = 52
        Height = 14
        Caption = 'Descri'#231#227'o'
      end
      object RLLabResQtd: TRLLabel
        Left = 174
        Top = 0
        Width = 30
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Qtd'
      end
      object RLLabResTotal: TRLLabel
        Left = 204
        Top = 0
        Width = 60
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total'
      end
    end
    object RLRes_Detal: TRLBand
      Left = 19
      Top = 79
      Width = 264
      Height = 16
      object RLDBText47: TRLDBText
        Left = 0
        Top = 1
        Width = 30
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'ZC_Cod'
        DataSource = uDM.SResVendas
        Text = ''
      end
      object RLDbResDescr: TRLDBText
        Left = 30
        Top = 1
        Width = 144
        Height = 14
        AutoSize = False
        DataField = 'Descricao'
        DataSource = uDM.SResVendas
        Text = ''
      end
      object RLDbResQtd: TRLDBText
        Left = 174
        Top = 1
        Width = 30
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Quant'
        DataSource = uDM.SResVendas
        Text = ''
      end
      object RLDbResTotal: TRLDBText
        Left = 204
        Top = 1
        Width = 60
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Valor'
        DataSource = uDM.SResVendas
        Text = ''
      end
    end
    object RLRes_Sum: TRLBand
      Left = 19
      Top = 95
      Width = 264
      Height = 186
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLPanel8: TRLPanel
        Left = 0
        Top = 1
        Width = 264
        Height = 128
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel39: TRLLabel
          Left = 53
          Top = 4
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = 'Dinheiro:'
        end
        object RLLabReais: TRLLabel
          Left = 100
          Top = 4
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdReais: TRLLabel
          Left = 168
          Top = 4
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel40: TRLLabel
          Left = 28
          Top = 19
          Width = 70
          Height = 14
          Alignment = taRightJustify
          Caption = 'Cart'#227'o d'#233'bito:'
        end
        object RLLabCDeb: TRLLabel
          Left = 100
          Top = 19
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdCDeb: TRLLabel
          Left = 168
          Top = 19
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel41: TRLLabel
          Left = 24
          Top = 34
          Width = 74
          Height = 14
          Alignment = taRightJustify
          Caption = 'Cart'#227'o cr'#233'dito:'
        end
        object RLLabCCred: TRLLabel
          Left = 100
          Top = 34
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdCCred: TRLLabel
          Left = 168
          Top = 34
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel42: TRLLabel
          Left = 77
          Top = 49
          Width = 21
          Height = 14
          Alignment = taRightJustify
          Caption = 'PIX:'
        end
        object RLLabPIX: TRLLabel
          Left = 100
          Top = 49
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdPIX: TRLLabel
          Left = 168
          Top = 49
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel43: TRLLabel
          Left = 59
          Top = 64
          Width = 39
          Height = 14
          Alignment = taRightJustify
          Caption = 'Outros:'
        end
        object RLLabOutros: TRLLabel
          Left = 100
          Top = 64
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdOutros: TRLLabel
          Left = 168
          Top = 64
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel44: TRLLabel
          Left = 55
          Top = 79
          Width = 43
          Height = 14
          Alignment = taRightJustify
          Caption = 'Misto(*):'
        end
        object RLLabMisto: TRLLabel
          Left = 100
          Top = 79
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel45: TRLLabel
          Left = 65
          Top = 98
          Width = 33
          Height = 14
          Alignment = taRightJustify
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabTotal: TRLLabel
          Left = 100
          Top = 98
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdMisto: TRLLabel
          Left = 168
          Top = 79
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdTotal: TRLLabel
          Left = 168
          Top = 98
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel38: TRLLabel
          Left = 111
          Top = 115
          Width = 153
          Height = 12
          Align = faRightBottom
          Alignment = taRightJustify
          Caption = '(*) incluso nos meios de pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLAngleLabel1: TRLAngleLabel
          Left = 4
          Top = 2
          Width = 14
          Height = 119
          Angle = 90.000000000000000000
          Caption = 'Meios de pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLPanel9: TRLPanel
        Left = 0
        Top = 129
        Width = 264
        Height = 56
        Align = faClient
        object RLLabel4: TRLLabel
          Left = 66
          Top = 4
          Width = 32
          Height = 14
          Alignment = taRightJustify
          Caption = 'NFCe:'
        end
        object RLLabNFCe: TRLLabel
          Left = 100
          Top = 4
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdNFCe: TRLLabel
          Left = 168
          Top = 4
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdDocs: TRLLabel
          Left = 168
          Top = 19
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabDocs: TRLLabel
          Left = 100
          Top = 19
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel18: TRLLabel
          Left = 59
          Top = 19
          Width = 39
          Height = 14
          Alignment = taRightJustify
          Caption = 'Outros:'
        end
        object RLAngleLabel2: TRLAngleLabel
          Left = 4
          Top = 2
          Width = 14
          Height = 41
          Angle = 90.000000000000000000
          Caption = 'Doctos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 65
          Top = 36
          Width = 33
          Height = 14
          Alignment = taRightJustify
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabTotVlrDocs: TRLLabel
          Left = 100
          Top = 36
          Width = 64
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabTotQtdDocs: TRLLabel
          Left = 168
          Top = 36
          Width = 32
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
      end
    end
    object Res_Footer: TRLBand
      Left = 19
      Top = 281
      Width = 264
      Height = 17
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel27: TRLLabel
        Left = 166
        Top = 1
        Width = 98
        Height = 10
        Align = faRightTop
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'RLResumo - SpeedFood 1.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
