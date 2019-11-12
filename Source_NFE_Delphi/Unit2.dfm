object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 288
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 40
    Width = 80
    Height = 13
    Caption = #1062#1074#1077#1090' '#1087#1080#1082#1089#1077#1083#1103' - '
  end
  object Button1: TButton
    Left = 176
    Top = 240
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 158
    Top = 37
    Width = 33
    Height = 21
    Color = clNone
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object ColorDialog1: TColorDialog
    OnClose = ColorDialog1Close
    Left = 368
    Top = 232
  end
end
