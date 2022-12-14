object FuImpressoes: TFuImpressoes
  Left = 0
  Top = 0
  Caption = 'FuImpressoes'
  ClientHeight = 503
  ClientWidth = 684
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
        Top = 31
        Width = 56
        Height = 14
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
      object RLLabel4: TRLLabel
        Left = 209
        Top = 0
        Width = 55
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo'
      end
      object RLLabel5: TRLLabel
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
      object RLDBText6: TRLDBText
        Left = 43
        Top = 0
        Width = 110
        Height = 14
        AutoSize = False
        DataField = 'Historico'
        DataSource = uDM.DSLctCaixa
        Text = ''
      end
      object RLDBText7: TRLDBText
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
      object RLDBText8: TRLDBText
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
      Height = 283
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
        Height = 136
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel8: TRLLabel
          Left = 1
          Top = 16
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Saldo inicial'
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
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'SaldoInicial'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 68
          Top = 31
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ZC_VlrEntradas'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 68
          Top = 45
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ZC_QtdEntradas'
          DataSource = uDM.DSRegCaixa
          Text = '[ # ]'
        end
        object RLDBText12: TRLDBText
          Left = 136
          Top = 31
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ZC_VlrSaidas'
          DataSource = uDM.DSRegCaixa
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 136
          Top = 45
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ZC_QtdSaidas'
          DataSource = uDM.DSRegCaixa
          Text = '[ # ]'
        end
        object RLLabel11: TRLLabel
          Left = 204
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
        object RLDBText14: TRLDBText
          Left = 204
          Top = 31
          Width = 60
          Height = 14
          Align = faRightOnly
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
        object RLLabel18: TRLLabel
          Left = 68
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
        object RLLabel19: TRLLabel
          Left = 136
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
        Left = 154
        Top = 149
        Width = 101
        Height = 156
        object RLLabel12: TRLLabel
          Left = 0
          Top = 1
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
          Left = 20
          Top = 20
          Width = 19
          Height = 14
          Caption = 'R$:'
        end
        object RLLabel10: TRLLabel
          Left = 32
          Top = 36
          Width = 26
          Height = 14
          Caption = 'CDb:'
        end
        object RLLabel13: TRLLabel
          Left = 24
          Top = 52
          Width = 24
          Height = 14
          Caption = 'CCr:'
        end
        object RLLabel14: TRLLabel
          Left = 16
          Top = 68
          Width = 21
          Height = 14
          Caption = 'PIX:'
        end
        object RLLabel15: TRLLabel
          Left = 52
          Top = 84
          Width = 23
          Height = 14
          Caption = 'Out:'
        end
        object RLLabel16: TRLLabel
          Left = 16
          Top = 104
          Width = 31
          Height = 14
          Caption = 'Misto:'
        end
        object RLLabel17: TRLLabel
          Left = 20
          Top = 124
          Width = 25
          Height = 14
          Caption = 'Sup:'
        end
      end
      object RLPanel4: TRLPanel
        Left = 0
        Top = 265
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
    end
  end
end
