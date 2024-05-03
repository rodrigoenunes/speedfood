object FSFEuPrintFortes: TFSFEuPrintFortes
  Left = 0
  Top = 0
  Caption = 'FSFEuPrintFortes'
  ClientHeight = 451
  ClientWidth = 857
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object RLEtiqLanche: TRLReport
    Left = 8
    Top = 8
    Width = 397
    Height = 272
    Margins.LeftMargin = 6.000000000000000000
    Margins.TopMargin = 4.000000000000000000
    Margins.RightMargin = 2.000000000000000000
    Margins.BottomMargin = 3.000000000000000000
    DataSource = uDM.DSPedItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 105.000000000000000000
    PageSetup.PaperHeight = 72.000000000000000000
    PrintEmpty = False
    RecordRange = rrCurrentOnly
    object RLDetLanche: TRLBand
      Left = 23
      Top = 47
      Width = 366
      Height = 195
      AutoExpand = False
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = RLDetLancheBeforePrint
      object RLPanDescr: TRLPanel
        Left = 0
        Top = 0
        Width = 366
        Height = 51
        Align = faTop
        Alignment = taCenter
        AutoSize = True
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDbDescfr: TRLDBText
          Left = 0
          Top = 0
          Width = 366
          Height = 18
          Align = faTop
          Alignment = taCenter
          DataField = 'ZC_Descricao'
          DataSource = uDM.DSPedItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDbPrensCort: TRLDBText
          Left = 0
          Top = 18
          Width = 366
          Height = 16
          Align = faTop
          Alignment = taCenter
          DataField = 'ZC_PrensCort'
          DataSource = uDM.DSPedItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDbObserv: TRLDBText
          Left = 0
          Top = 34
          Width = 366
          Height = 16
          Align = faBottom
          DataField = 'Observacao'
          DataSource = uDM.DSPedItens
          Text = ''
        end
      end
      object RLPanMaisSemMenos: TRLPanel
        Left = 0
        Top = 51
        Width = 366
        Height = 143
        Align = faClient
        AutoSize = True
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLPanSem: TRLPanel
          Left = 122
          Top = 0
          Width = 122
          Height = 143
          Align = faClient
          AutoSize = True
          Transparent = False
          object RLLabSem: TRLLabel
            Left = 0
            Top = 0
            Width = 122
            Height = 18
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Caption = 'SEM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLSem: TRLMemo
            Left = 0
            Top = 18
            Width = 122
            Height = 16
            Align = faTop
            Behavior = [beSiteExpander]
            Transparent = False
          end
        end
        object RLPanMais: TRLPanel
          Left = 0
          Top = 0
          Width = 122
          Height = 143
          Align = faLeft
          AutoSize = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Transparent = False
          object RLLabMais: TRLLabel
            Left = 0
            Top = 0
            Width = 122
            Height = 18
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Caption = 'MAIS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLMais: TRLMemo
            Left = 0
            Top = 18
            Width = 122
            Height = 18
            Align = faTop
            Behavior = [beSiteExpander]
            Transparent = False
          end
        end
        object RLPanMenos: TRLPanel
          Left = 244
          Top = 0
          Width = 122
          Height = 143
          Align = faRight
          AutoSize = True
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Transparent = False
          object RLLabMenos: TRLLabel
            Left = 0
            Top = 0
            Width = 122
            Height = 18
            Align = faTop
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Caption = 'MENOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLMenos: TRLMemo
            Left = 0
            Top = 18
            Width = 122
            Height = 16
            Align = faTop
            Behavior = [beSiteExpander]
            Transparent = False
          end
        end
      end
    end
    object RLCabLanche: TRLBand
      Left = 23
      Top = 15
      Width = 366
      Height = 32
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLDBText2: TRLDBText
        Left = 298
        Top = 17
        Width = 68
        Height = 14
        Align = faRightBottom
        Alignment = taRightJustify
        DataField = 'ZC_DataHora'
        DataSource = uDM.DSPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 152
        Top = 12
        Width = 62
        Height = 19
        Alignment = taCenter
        Caption = 'Lanche'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 326
        Top = 0
        Width = 40
        Height = 16
        Align = faRightTop
        Alignment = taRightJustify
        DataField = 'nome'
        DataSource = uDM.DSSisPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 0
        Top = 4
        Width = 60
        Height = 12
        Caption = 'Pedido/Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLDbPedido: TRLDBText
        Left = 0
        Top = 15
        Width = 86
        Height = 16
        Align = faLeftBottom
        DataField = 'ZC_SenhaLst'
        DataSource = uDM.DSPedItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
    end
    object RLRodapeLanche: TRLBand
      Left = 23
      Top = 242
      Width = 366
      Height = 18
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDbCliente: TRLDBText
        Left = 3
        Top = 1
        Width = 95
        Height = 14
        Anchors = [fkBottom]
        DataField = 'NomeCliente'
        DataSource = uDM.DSPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Nome: '
      end
      object RLDBText9: TRLDBText
        Left = 270
        Top = 3
        Width = 93
        Height = 14
        Alignment = taRightJustify
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
    end
  end
  object RLEtiqBebida: TRLReport
    Left = 416
    Top = 8
    Width = 397
    Height = 272
    Margins.LeftMargin = 6.000000000000000000
    Margins.TopMargin = 4.000000000000000000
    Margins.RightMargin = 2.000000000000000000
    Margins.BottomMargin = 3.000000000000000000
    DataSource = uDM.DSPedItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 105.000000000000000000
    PageSetup.PaperHeight = 72.000000000000000000
    PrintEmpty = False
    BeforePrint = RLEtiqBebidaBeforePrint
    object RLCabBeb: TRLBand
      Left = 23
      Top = 15
      Width = 366
      Height = 32
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel2: TRLLabel
        Left = 0
        Top = 0
        Width = 60
        Height = 12
        Align = faLeftTop
        Caption = 'Pedido/Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 149
        Top = 12
        Width = 68
        Height = 19
        Alignment = taCenter
        Caption = 'Bebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText1: TRLDBText
        Left = 298
        Top = 17
        Width = 68
        Height = 14
        Align = faRightBottom
        Alignment = taRightJustify
        DataField = 'ZC_DataHora'
        DataSource = uDM.DSPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 326
        Top = 0
        Width = 40
        Height = 16
        Align = faRightTop
        Alignment = taRightJustify
        DataField = 'nome'
        DataSource = uDM.DSSisPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 0
        Top = 15
        Width = 86
        Height = 16
        Align = faLeftBottom
        DataField = 'ZC_SenhaLst'
        DataSource = uDM.DSPedItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
    end
    object RLDetBebida: TRLBand
      Left = 23
      Top = 65
      Width = 366
      Height = 18
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLDBText10: TRLDBText
        Left = 8
        Top = 1
        Width = 40
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'Quant'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLDBText11: TRLDBText
        Left = 52
        Top = 1
        Width = 106
        Height = 18
        DataField = 'ZC_Descricao'
        DataSource = uDM.DSPedItens
        Text = ''
      end
      object RLDBText12: TRLDBText
        Left = 224
        Top = 1
        Width = 140
        Height = 16
        AutoSize = False
        DataField = 'Observacao'
        DataSource = uDM.DSPedItens
        Text = ''
      end
    end
    object RLBebColFooter: TRLBand
      Left = 23
      Top = 83
      Width = 366
      Height = 34
      AutoExpand = False
      BandType = btColumnFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLDBResult1: TRLDBResult
        Left = 132
        Top = 7
        Width = 137
        Height = 19
        DataField = 'Quant'
        DataSource = uDM.DSPedItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = '# unid'
      end
    end
    object RLBand1: TRLBand
      Left = 23
      Top = 117
      Width = 366
      Height = 20
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDbClienteBeb: TRLDBText
        Left = 3
        Top = 3
        Width = 95
        Height = 14
        Anchors = [fkBottom]
        DataField = 'NomeCliente'
        DataSource = uDM.DSPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Nome: '
      end
      object RLDBText13: TRLDBText
        Left = 270
        Top = 2
        Width = 93
        Height = 14
        Alignment = taRightJustify
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
    end
    object RLColBebida: TRLBand
      Left = 23
      Top = 47
      Width = 366
      Height = 18
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLLabel4: TRLLabel
        Left = 8
        Top = 1
        Width = 40
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Qtd'
      end
      object RLLabel6: TRLLabel
        Left = 52
        Top = 1
        Width = 76
        Height = 18
        Caption = 'Descri'#231#227'o'
      end
    end
  end
end
