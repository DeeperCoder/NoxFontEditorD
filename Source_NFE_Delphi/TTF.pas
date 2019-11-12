unit TTF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, sButton, sEdit, Grids;

type
  TForm6 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Memo1: TMemo;
    FontDialog1: TFontDialog;
    sButton1: TsButton;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sEdit3: TsEdit;
    sButton2: TsButton;
    DrawGrid1: TDrawGrid;
    GroupBox1: TGroupBox;
    sButton3: TsButton;
    sEdit4: TsEdit;
    sEdit5: TsEdit;
    procedure Button1Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure FontDialog1Close(Sender: TObject);
    procedure FontDialog1Apply(Sender: TObject; Wnd: HWND);
    procedure sButton2Click(Sender: TObject);
    procedure DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FontDialog1Show(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  BinIMGImport, BinIMGTrimed: array of string;
  UP, Left, Right, Down: Integer;
  FirstPix: boolean;
  Max_Right, Max_Right_temp: Integer;

implementation

{$R *.dfm}

uses unit1, SymHeightEdit, Globals;


// Draw ttf symbol
procedure TForm6.Button1Click(Sender: TObject);
Var
  SymbolIMG, Backgrnd: TBitmap;
  CurrSymbol: Integer;
  ClearRect, SymbolRect: TRect;
  MemStream: TMemoryStream;
  S: string;
  i, j: Integer;
begin
  Image1.Picture := nil;
  CurrSymbol := NoxFontFile.FirstSym + Form1.sListBox1.ItemIndex;
  SymbolIMG := TBitmap.Create();
  SymbolIMG.PixelFormat := pf1bit;
  SymbolIMG.Canvas.Font.Charset := FontDialog1.Font.Charset;
  SymbolIMG.Canvas.Font.Color := clBlack;
  SymbolIMG.Canvas.Font.Height := FontDialog1.Font.Height; //NoxFontFile.Sym_Height;
  SymbolIMG.Canvas.Font.Name := FontDialog1.Font.Name;
  SymbolIMG.Canvas.Font.Orientation := 0;
  SymbolIMG.Canvas.Font.SIZE := FontDialog1.Font.Size; //NoxFontFile.Sym_Width;
  // Image1.AutoSize := True;
  Image1.Width := (SymbolIMG.Canvas.Font.SIZE) * 2;
  Image1.Height := (abs(SymbolIMG.Canvas.Font.Height)) * 2;
  // Image1.Proportional := True;
  // Image1.Stretch := True;
  SymbolIMG.Canvas.Handle := Image1.Canvas.Handle;
  SymbolIMG.Canvas.TextOut(0, 0, AnsiChar(CurrSymbol));
  Image1.Picture.Bitmap.PixelFormat := pf1bit;
  Memo1.Clear;
  SetLength(BinIMGImport, Image1.Height);
  for j := 0 to Image1.Height - 1 do
  begin
    S := '';
    for i := 0 to Image1.Width - 1 do
    begin
      if Image1.Picture.Bitmap.Canvas.Pixels[i, j] = 0 then
        S := S + '1'
      else
        S := S + '0';
    end;
    BinIMGImport[j] := S;
    Memo1.Lines.Add(S);
  end;
  SetLength(BinIMGTrimed, Image1.Height);
  // UP
  FirstPix := false; // not find
  for j := 0 to Image1.Height - 1 do
  begin
    S := BinIMGImport[j];
    for i := 0 to Image1.Width - 1 do
    begin
      if (S[i + 1] = '1') and (FirstPix = false) then
      begin
        FirstPix := true;
        UP := j;
      end;
    end;
  end;
  // Down
  FirstPix := false;
  for j := Image1.Height - 1 downto 0 do
  begin
    S := BinIMGImport[j];
    for i := 0 to Image1.Width - 1 do
    begin
      if (S[i + 1] = '1') and (FirstPix = false) then
      begin
        FirstPix := true;
        Down := j;
      end;
    end;
  end;
  // Right
  FirstPix := false;
  Max_Right := 0;
  Max_Right_temp := 0;
  for j := 0 to Image1.Height - 1 do
  begin
    S := BinIMGImport[j];
    Max_Right_temp := 0;
    for i := 0 to Image1.Width - 1 do
    begin
      if (S[i + 1] = '1') then
      begin
        Max_Right_temp := i;
        if Max_Right_temp > Max_Right then
          Max_Right := Max_Right_temp;
      end;
    end;
  end;
  for j := UP to Down do
    BinIMGTrimed[j - UP] := BinIMGImport[j];
  SetLength(BinIMGTrimed, (Down - UP) + 1);
  // Image1.Canvas.CopyRect(Image1.Canvas.r, Image1.Canvas,
  // SymbolIMG.Canvas.Handle);
  for i := 0 to (Down - UP) do
  begin
    S := BinIMGTrimed[i];
    SetLength(S, Max_Right + 1);
    BinIMGTrimed[i] := S;
  end;
  DrawGrid1.ColCount := Max_Right + 1;
  DrawGrid1.RowCount := (Down - UP) + 1;
  sEdit4.Text := IntToStr(DrawGrid1.ColCount);
  sEdit5.Text := IntToStr(DrawGrid1.RowCount);
  SymbolIMG.Free;
   form6.DrawGrid1.Repaint;
  form6.Image1.Repaint;
end;

procedure TForm6.DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
Var
  i, j: Integer;
  S: string;
begin
  if (FontFileOpened) and (Form1.sListBox1.ItemIndex <> -1) then
  begin
    DrawGrid1.Canvas.Brush.Color := clBlack;
    // if NoxFontFile.SymSize = 1 then
    begin
      // SetLength(NoxFontFile.BinIMGImport, NoxFontFile.BytesForSym);
      for i := 0 to Down - UP do // Draw first 8 bit
      begin
        S := BinIMGTrimed[i];
        for j := 1 to Length(S) do
          if (S[j] = '1') then
            DrawGrid1.Canvas.FillRect(DrawGrid1.CellRect(j - 1, i));
      end;
    end;
  end;
end;

procedure TForm6.FontDialog1Apply(Sender: TObject; Wnd: HWND);
begin
  sEdit1.Text := FontDialog1.Font.Name;
  sEdit2.Text := IntToStr(FontDialog1.Font.Height);
  sEdit3.Text := IntToStr(FontDialog1.Font.SIZE);
  Button1.Click;
end;

procedure TForm6.FontDialog1Close(Sender: TObject);
begin
  sEdit1.Text := FontDialog1.Font.Name;
  sEdit2.Text := IntToStr(abs(FontDialog1.Font.Height));
  sEdit3.Text := IntToStr(FontDialog1.Font.SIZE);
  Button1.Click;
end;

procedure TForm6.FontDialog1Show(Sender: TObject);
begin
  sEdit1.Text := FontDialog1.Font.Name;
  sEdit2.Text := IntToStr(abs(FontDialog1.Font.Height));
  sEdit3.Text := IntToStr(FontDialog1.Font.SIZE);
  Button1.Click;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  sEdit1.Text := FontDialog1.Font.Name;
  sEdit2.Text := IntToStr(abs(FontDialog1.Font.Height));
  sEdit3.Text := IntToStr(FontDialog1.Font.SIZE);
end;

procedure TForm6.sButton1Click(Sender: TObject);
begin
  FontDialog1.Execute();
end;

procedure TForm6.sButton2Click(Sender: TObject);
begin
  Button1.Click;
end;

procedure TForm6.sButton3Click(Sender: TObject);
var i, j: integer;
s_temp, s2_temp: string;
CurrSymbol, SAction, Zero_count: integer;
St: boolean;
begin
  CurrSymbol := NoxFontFile.FirstSym + form1.sListBox1.ItemIndex;

  // Check Width, if import symbol > type of file width
  if NoxFontFile.Sym_Width < strtoint(sEdit4.Text) then begin
    ShowMessage('Импорт не возможен: ширина импортируемого символа больше ' +
    'предельного значения!');
    Exit;
  end;

  // Check height, if import symbol > then up height
  if strtoint(Form1.sEdit7.Text) < strtoint(sEdit5.Text) then begin
    SAction := MessageBox(Application.Handle,
    'Высота импортируемого символа больше. Изменить высоту всех символов?', 'Nox Font Editor',
    MB_YESNO + MB_ICONINFORMATION + MB_APPLMODAL);
    if SAction = mrYes then
      begin
      form5.sEdit1.Text := sEdit5.Text;
      form5.sButton2Click(Sender);
      end
      else Exit;
  end;

  // 1. Length equals
  if Length(NoxFontFile.BinIMG[0]) = Length(BinIMGTrimed[0]) then
    for I := 0 to Length(BinIMGTrimed) - 1 do begin
      NoxFontFile.BinIMG[i] := BinIMGTrimed[i];
    end;
  // 2. Import symbol smalled
  if (Length(NoxFontFile.BinIMG[0]) > Length(BinIMGTrimed[0]))
   and (NoxFontFile.SymSize = 1) then begin
      for I := 0 to Length(BinIMGTrimed) - 1 do begin
        NoxFontFile.BinIMG[i] := BinIMGTrimed[i];
      end;
      for I := 0 to Length(BinIMGTrimed) - 1 do begin
        s_temp := NoxFontFile.BinIMG[i];
        for j := 0 to (NoxFontFile.Sym_Width - Length(BinIMGTrimed[i])) - 1 do
          s_temp := s_temp + '0';
        NoxFontFile.BinIMG[i] := s_temp;
      end;
//      Showmessage(inttostr(Length(BinIMGTrimed[0])) + ' + '
//      + inttostr(Length(NoxFontFile.BinIMG[0])));
  end;


 // 3. Import symbol high
 if {(Length(NoxFontFile.BinIMG[0]) < Length(BinIMGTrimed[0]))
  and} (NoxFontFile.SymSize > 1) then begin
  // 8 bit
  for I := 0 to Length(BinIMGTrimed) - 1 do begin
    s_temp := BinIMGTrimed[i];
    s2_temp := Copy(s_temp, 1, 8);
    NoxFontFile.BinIMG[i] := s2_temp;
  end;
  // 16 bit
  for I := 0 to Length(BinIMGTrimed) - 1 do begin
    s_temp := BinIMGTrimed[i];
    s2_temp := Copy(s_temp, 9, 8);
    NoxFontFile.BinIMG16[i] := s2_temp;
  end;
  Zero_count := 8 - Length(NoxFontFile.BinIMG16[0]);
  for I := 0 to Length(BinIMGTrimed) - 1 do begin
    s_temp := NoxFontFile.BinIMG16[i];
    for j := 0 to Zero_count - 1 do
    s_temp := s_temp + '0';
    NoxFontFile.BinIMG16[i] := s_temp;
  end;
  // 24 bit
  if NoxFontFile.Sym_Width > 16 then begin
  for I := 0 to Length(BinIMGTrimed) - 1 do begin
    s_temp := BinIMGTrimed[i];
    s2_temp := Copy(s_temp, 17, 8);
    NoxFontFile.BinIMG32[i] := s2_temp;
  end;
  Zero_count := 8 - Length(NoxFontFile.BinIMG32[0]);
  for I := 0 to Length(BinIMGTrimed) - 1 do begin
    s_temp := NoxFontFile.BinIMG32[i];
    for j := 0 to Zero_count - 1 do
    s_temp := s_temp + '0';
    NoxFontFile.BinIMG32[i] := s_temp;
  end;
  end;
 end;

 //  (NoxFontFile.Sym_Width - Length(BinIMGTrimed[i])) - 1 - not correct

  // Set zero's on vertical
 if Length(NoxFontFile.BinIMG) > Length(BinIMGTrimed) then begin
  for I := Length(BinIMGTrimed) to NoxFontFile.Sym_Height - 1 do begin
    s_temp := '';
    for j := 0 to Length(NoxFontFile.BinIMG[0]) - 1 do
          s_temp := s_temp + '0';
    NoxFontFile.BinIMG[i] := s_temp;
  end;
 end;

 // Modify width
 NoxFontFile.Data[CurrSymbol][1] := strtoint(sEdit4.Text);
 form1.sEdit1.Text := sEdit4.Text;

 // Apply import
 Form1.DrawGrid1SelectCell(Sender, 0, 0, St);
 Form1.DrawGrid1SelectCell(Sender, 0, 0, St);
 Form1.DrawGrid1.Repaint;

end;

end.
