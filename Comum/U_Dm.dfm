object DM: TDM
  OldCreateOrder = False
  Height = 359
  Width = 585
  object FDC: TFDConnection
    Params.Strings = (
      'Database=speedfood'
      'User_Name=speedfood'
      'Password=speed@123'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 124
    Top = 20
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 128
    Top = 76
  end
  object grupoprodutos: TFDTable
    Active = True
    IndexFieldNames = 'com_grupoproduto_id'
    Connection = FDC
    TableName = 'speedfood.com_grupoproduto'
    Left = 48
    Top = 160
  end
  object DSgrupoprodutos: TDataSource
    DataSet = grupoprodutos
    Left = 140
    Top = 164
  end
end
