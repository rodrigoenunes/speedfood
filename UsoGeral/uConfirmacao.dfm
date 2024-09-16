object FuConfirmacao: TFuConfirmacao
  Left = 0
  Top = 0
  Caption = 'Confirmacao'
  ClientHeight = 222
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnResize = FormResize
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 177
    Align = alTop
    Enabled = False
    TabOrder = 0
    ExplicitWidth = 697
    DesignSize = (
      578
      177)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 46
      Height = 21
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Memo1: TMemo
      Left = 8
      Top = 35
      Width = 562
      Height = 126
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
      ExplicitWidth = 681
    end
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 183
    Width = 131
    Height = 33
    Caption = 'BitBtn1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 183
    Width = 75
    Height = 33
    Caption = 'BitBtn2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 360
    Top = 183
    Width = 75
    Height = 33
    Caption = 'BitBtn3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 441
    Top = 183
    Width = 75
    Height = 33
    Caption = 'BitBtn4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn4Click
  end
end
