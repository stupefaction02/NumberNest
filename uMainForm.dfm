object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'NumberNest'
  ClientHeight = 502
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 448
    Top = 11
    Width = 59
    Height = 15
    Caption = 'Set Length:'
  end
  object Label2: TLabel
    Left = 448
    Top = 149
    Width = 182
    Height = 63
    Caption = 'Note:'#13#10'Shell Sort for small arrays.'#13#10'Heap sort for big arrays.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Emoji'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 432
    Top = 234
    Width = 36
    Height = 21
    Caption = 'Logs:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Emoji'
    Font.Style = []
    ParentFont = False
  end
  object ShellSortButton: TButton
    Left = 448
    Top = 71
    Width = 113
    Height = 33
    Caption = 'Shell Sort'
    TabOrder = 0
    OnClick = ShellSortButtonClick
  end
  object SetLengthTextBox: TEdit
    Left = 511
    Top = 8
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 1
  end
  object HeapSortButton: TButton
    Left = 448
    Top = 110
    Width = 113
    Height = 33
    Caption = 'Heap Sort'
    TabOrder = 2
    OnClick = HeapSortButtonClick
  end
  object GenerateSetButton: TButton
    Left = 448
    Top = 37
    Width = 184
    Height = 28
    Caption = 'Generate Set'
    TabOrder = 3
    OnClick = GenerateSetButtonClick
  end
  object SetPanel: TRichEdit
    Left = 8
    Top = 8
    Width = 393
    Height = 247
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object LogsListBox: TListBox
    Left = 432
    Top = 261
    Width = 217
    Height = 233
    ItemHeight = 15
    TabOrder = 5
  end
end
