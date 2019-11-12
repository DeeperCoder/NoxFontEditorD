object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Nox Font Editor Beta'
  ClientHeight = 480
  ClientWidth = 640
  Color = clSkyBlue
  TransparentColor = True
  TransparentColorValue = clSkyBlue
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 96
    Width = 378
    Height = 58
    Caption = 'Nox Font Editor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 568
    Top = 459
    Width = 52
    Height = 13
    Caption = 'by Larboss'
  end
  object Label3: TLabel
    Left = 176
    Top = 264
    Width = 200
    Height = 39
    Caption = 'Beta version'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 224
    Top = 344
    Width = 152
    Height = 39
    AutoSize = False
    Caption = #1053#1072#1078#1084#1080#1090#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    OnClick = Label4Click
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 8
    Top = 432
  end
end
