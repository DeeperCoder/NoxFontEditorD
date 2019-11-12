unit SymHeightEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sEdit, sLabel;

type
  TForm5 = class(TForm)
    sEdit1: TsEdit;
    sButton1: TsButton;
    sButton2: TsButton;
    sButton3: TsButton;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    procedure sButton3Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses unit1;

procedure TForm5.sButton1Click(Sender: TObject); // Default
begin
  sEdit1.Text := inttostr(NoxFontFile.Sym_Height_Old);
end;

procedure TForm5.sButton2Click(Sender: TObject); // Save
var
  i: integer;
begin
  NoxFontFile.Sym_Height := strtoint(sEdit1.Text);
  Form1.sEdit7.Text := inttostr(NoxFontFile.Sym_Height);
  FontFileChanged := True;
  SetLength(NoxFontFile.BinIMG, NoxFontFile.Sym_Height);
  SetLength(NoxFontFile.BinIMG16, NoxFontFile.Sym_Height);
  SetLength(NoxFontFile.BinIMG32, NoxFontFile.Sym_Height);
  NoxFontFile.BytesForSym := NoxFontFile.Sym_Height * NoxFontFile.SymSize + 1;
  for i := NoxFontFile.Sym_Height_Old to NoxFontFile.Sym_Height - 1 do
  begin
    NoxFontFile.BinIMG[i] := '00000000';
    NoxFontFile.BinIMG16[i] := '00000000';
    NoxFontFile.BinIMG32[i] := '00000000';
  end;
  if Form1.sListBox1.ItemIndex <> -1 then
    Form1.sListBox1DblClick(Sender);
  Form5.Close;
end;

procedure TForm5.sButton3Click(Sender: TObject); // close
begin
  Form5.Close;
end;

procedure TForm5.sEdit1Change(Sender: TObject);
begin
  if FontFileOpened then
    if (sEdit1.Text <> '') then
      if (strtoint(sEdit1.Text) > 99) or (strtoint(sEdit1.Text) <= 0) then
      begin
        sEdit1.Text := inttostr(NoxFontFile.Sym_Height_Old);
        ShowMessage('Не допустимое значение!');
      end;
end;

end.
