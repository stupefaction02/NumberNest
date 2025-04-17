object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'NumberNest'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 432
    Top = 27
    Width = 59
    Height = 15
    Caption = 'Set Length:'
  end
  object Label2: TLabel
    Left = 432
    Top = 165
    Width = 34
    Height = 15
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 432
    Top = 87
    Width = 113
    Height = 33
    Caption = 'Insert Sort'
    TabOrder = 0
  end
  object SetLengthTextBox: TEdit
    Left = 495
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object Button2: TButton
    Left = 432
    Top = 126
    Width = 113
    Height = 33
    Caption = 'Heap Sort'
    TabOrder = 2
  end
  object GenerateSet: TButton
    Left = 432
    Top = 53
    Width = 184
    Height = 28
    Caption = 'Generate Set'
    TabOrder = 3
    OnClick = GenerateSetClick
  end
  object SetPanel: TRichEdit
    Left = 16
    Top = 8
    Width = 401
    Height = 425
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'SetPanel')
    ParentFont = False
    TabOrder = 4
  end
end
