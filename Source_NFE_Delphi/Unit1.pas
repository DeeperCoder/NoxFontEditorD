unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, sSkinManager, StdCtrls, sLabel, sListBox, ComCtrls, ExtCtrls,
  sPanel, Grids, sEdit, sCheckBox, GestureMgr, inifiles, Buttons, ShellAPI;

type
  TForm1 = class(TForm)
    o: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    OpenDialog1: TOpenDialog;
    sSkinManager1: TsSkinManager;
    Button1: TButton;
    sListBox1: TsListBox;
    StatusBar1: TStatusBar;
    DrawGrid1: TDrawGrid;
    Button2: TButton;
    Timer1: TTimer;
    N6: TMenuItem;
    sEdit6: TsEdit;
    sEdit7: TsEdit;
    sEdit8: TsEdit;
    sEdit9: TsEdit;
    sEdit10: TsEdit;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sCheckBox1: TsCheckBox;
    TrackBar1: TTrackBar;
    Button3: TButton;
    OpenDialog2: TOpenDialog;
    sLabel1: TsLabel;
    sEdit1: TsEdit;
    sLabel2: TsLabel;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    Button4: TButton;
    sCheckBox2: TsCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    N11: TMenuItem;
    EditSymbolsMenu: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    SaveDialog2: TSaveDialog;
    sCheckBox3: TsCheckBox;
    N15: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    N16: TMenuItem;
    N17: TMenuItem;
    d1: TMenuItem;
    Button5: TButton;
    Button6: TButton;
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure OpenDialog1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N6Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure DrawGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure DrawGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure sListBox1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OpenDialog2CanClose(Sender: TObject; var CanClose: Boolean);
    procedure N10Click(Sender: TObject);
    procedure SaveDialog1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sListBox1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sCheckBox2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure sListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure N14Click(Sender: TObject);
    procedure EditSymbolsMenuPopup(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SaveDialog2CanClose(Sender: TObject; var CanClose: Boolean);
    procedure N11Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sEdit7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure d1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    // procedure FormActivate(Sender: TObject);
    // procedure sListBox1DrawItem(Control: TWinControl; Index: Integer;
    // Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

type
  TNoxFontFile = record
    Name: string; // Имя файла фонтов
    Sym_Width: Integer; // Ширина символа
    Sym_Height: Integer; // Высота символа
    Sym_Height_Old: Integer; // Высота символа
    BytesForSym: Integer; // Кол-во байт под 1 символ (с учетом относительной длины)
    FirstSym: Integer; // Код первого символа (ASCII)
    LastSym: Integer; // Код последнего символа (ASCII)
    SymSize: smallint; // Код размера символов в файле
    ListCount: smallint; // Количество списков
    ListCount_Old: smallint;
    Data: array [1 .. 255, 1 .. 999] of byte; // Символы и их байты.
    SymOffsets: array [1 .. 255, 0 .. 0] of Integer; // Оффсеты символов
    DataOrig: array [1 .. 255, 1 .. 999] of byte;
    SymStats: array of Integer;
    {
      0 - normal
      1 - deleted
      2 - real deleted
      3 - changed
      }
    // EmptySym: array of Integer; // Пустые символы
    // ChangedSym: array of Integer; // Измененные символы
    // // Символы и их байты, изменения
    BinIMG: array of string; // 8 бит
    BinIMGDraw: array of string; // Временное хранение
    BinIMG16: array of string; // Вторые 8 бит
    BinIMG32: array of string; // Третьи 8 бит
  end;

type
  TListSym = record
    Indent: smallint; // Отступ
    FirstSym: Integer; // номер 1го в списке
    LastSym: Integer; // номер посл. в списке
  end;

var
  Form1: TForm1;
  CanEdit: Boolean;
  FS, FS2, FS3: TFileStream;
  A: array of TListSym;
  FontFileOpened, FontFileChanged, FontFileSaved: Boolean;
  NoxFontFile: TNoxFontFile;
  HexStr: AnsiString;
  L: Integer;
  Data_pos: Integer;
  DrawORClear: shortint = 0; // 0 - default, 1 - Draw, 2 - Clear
  max_col, max_col16, max_col32: Integer;
  BinaryStream: TMemoryStream;
  FNT_ID_A: array [0 .. 3] of byte = (
    $74,
    $4E,
    $6F,
    $46
  );

const
  FNT_ID = $744E6F46;

implementation

uses ABOUT, Unit2, Unit3, Unit4, SymHeightEdit, TTF, Globals;
{$R *.dfm}

// Сдвигает символ на одну строку пикселй вверх
function UpDownSymbol(upDowni: integer): BOOL;
Var I, CurrSymbol: integer;
B: boolean;
begin

  CurrSymbol := NoxFontFile.FirstSym + Form1.sListBox1.ItemIndex;

  if (FontFileOpened) and (not Form1.sCheckBox3.Checked) then begin
    if NoxFontFile.SymSize = 1 then begin
      if upDowni > 0 then
        for I := 0 to High(NoxFontFile.BinIMG) - 1 do begin
          NoxFontFile.BinIMG[i] := NoxFontFile.BinIMG[i + upDowni];
        end
      else if upDowni < 0 then
        for I := High(NoxFontFile.BinIMG) - 1 downto 1 do begin
          NoxFontFile.BinIMG[i] := NoxFontFile.BinIMG[i + upDowni];
        end;

    Form1.DrawGrid1SelectCell(Form1, 0, 0, b);
    Form1.DrawGrid1SelectCell(Form1, 0, 0, b);
    Form1.sListBox1Click(Form1);

    end;

  end;

  if (FontFileOpened) and (not Form1.sCheckBox3.Checked) then begin
    if NoxFontFile.SymSize = 2 then begin
      if upDowni > 0 then
        for I := 0 to High(NoxFontFile.BinIMG16) - 1 do begin
          NoxFontFile.BinIMG[i] := NoxFontFile.BinIMG[i + upDowni];
          NoxFontFile.BinIMG16[i] := NoxFontFile.BinIMG16[i + upDowni];
        end
      else if upDowni < 0 then
        for I := High(NoxFontFile.BinIMG16) - 1 downto 1 do begin
          NoxFontFile.BinIMG[i] := NoxFontFile.BinIMG[i + upDowni];
          NoxFontFile.BinIMG16[i] := NoxFontFile.BinIMG16[i + upDowni];
        end;

    Form1.DrawGrid1SelectCell(Form1, 0, 0, b);
    Form1.DrawGrid1SelectCell(Form1, 0, 0, b);
    Form1.sListBox1Click(Form1);

    end;

  end;

  if (FontFileOpened) and (not Form1.sCheckBox3.Checked) then begin
    if NoxFontFile.SymSize = 3 then begin
      SetLength(NoxFontFile.BinIMG, High(NoxFontFile.BinIMG32) + 1);
      if upDowni > 0 then
        for I := 0 to High(NoxFontFile.BinIMG32) - 1 do begin
          NoxFontFile.BinIMG[i] := NoxFontFile.BinIMG[i + upDowni];
          NoxFontFile.BinIMG16[i] := NoxFontFile.BinIMG16[i + upDowni];
          NoxFontFile.BinIMG32[i] := NoxFontFile.BinIMG32[i + upDowni];
        end
      else if upDowni < 0 then
        for I := High(NoxFontFile.BinIMG32) - 1 downto 1 do begin
          NoxFontFile.BinIMG[i] := NoxFontFile.BinIMG[i + upDowni];
          NoxFontFile.BinIMG16[i] := NoxFontFile.BinIMG16[i + upDowni];
          NoxFontFile.BinIMG32[i] := NoxFontFile.BinIMG32[i + upDowni];
        end;

    Form1.DrawGrid1SelectCell(Form1, 0, 0, b);
    Form1.DrawGrid1SelectCell(Form1, 0, 0, b);
    Form1.sListBox1Click(Form1);

    end;

  end;


end;

// Сдвигает символ на одну строку пикселй вниз
function DownSymbol(): BOOL;
begin

end;

procedure TForm1.CreateParams(var Params: TCreateParams);
begin // Shows this modal form on taskbar
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;

procedure TForm1.d1Click(Sender: TObject); // Show doc help
Var OpenCMD: string;
begin
  OpenCMD := ExtractFileDir(Application.ExeName) + '\Nox_Font_Editor.pdf';
  if FileExists(OpenCMD) then
  ShellExecute(application.Handle, 'Open', PWideChar(OpenCMD), nil, nil, SW_normal)
  else showmessage('Справка отсутствует. Переустановите приложение!');
end;

function GetLists(): bool; // Get lists of the symbols
var
  i: Integer;
begin
  result := false;
  FS.Position := $14; // Count of lists
  FS.Read(NoxFontFile.ListCount, 1);
  if NoxFontFile.ListCount > 0 then
  begin
    SetLength(A, NoxFontFile.ListCount);
    FS.Position := $1C;
    // FS.Position := FS.Position + 1;
    for i := 0 to NoxFontFile.ListCount - 1 do
    begin
      FS.Read(A[i].Indent, 1);
      FS.Position := FS.Position + 3;
      FS.Read(A[i].FirstSym, 1);
      FS.Position := FS.Position + 1;
      FS.Read(A[i].LastSym, 1);
      FS.Position := FS.Position + 1;
    end;
    Data_pos := FS.Position;
    result := true;
  end
  else
    Showmessage('Ошибка при инициализации списков.');
end;

function ClearData(): bool;
var
  i, j: Integer;
begin
  for i := 1 to 255 do
    for j := 1 to 999 do
      NoxFontFile.Data[i][j] := 0;
end;

function OpenFontFile(): bool;
var
  i, j, i2, i3, C, Count_Readed, Bytes_Count: Integer;
  B: byte;
  B_A: array [0 .. 3] of byte;
  AC: AnsiChar;
  // AAC: array [1 .. 33] of AnsiChar;
begin
  C := 0;
  Count_Readed := 0;
  try
    FS := TFileStream.Create(Form1.OpenDialog1.filename, fmOpenReadWrite);
    try
      FS.Position := 0;
      FS.Read(B_A, 4);
      for i := 0 to 3 do
        if B_A[i] = FNT_ID_A[i] then
          inc(C);
      if C = 4 then // File correct
      begin
        GetLists;
        // Read head
        NoxFontFile.Name := ExtractFileName(Form1.OpenDialog1.filename);
        FS.Position := $10; // Offset 10
        FS.Read(B, 1);
        NoxFontFile.Sym_Height := B;
        NoxFontFile.Sym_Height_Old := B;
        FS.Position := $18; // Offset 18
        FS.Read(B, 1);
        NoxFontFile.BytesForSym := B;
        FS.Position := $20; // Offset 20 / 28
        FS.Read(B, 1);
        NoxFontFile.FirstSym := A[0].FirstSym;
        FS.Position := $22; // Offset 22 / 2A
        FS.Read(B, 1);
        NoxFontFile.LastSym := A[Length(A) - 1].LastSym;
        FS.Position := $C; // Offset 13
        FS.Read(B, 1);
        NoxFontFile.SymSize := B;
        case B of
          1:
            begin
              NoxFontFile.Sym_Width := 8;
              Form1.sEdit10.Text := 'Маленькие';
            end;
          2:
            begin
              NoxFontFile.Sym_Width := 16;
              Form1.sEdit10.Text := 'Средние';
            end;
          3:
            begin
              NoxFontFile.Sym_Width := 24;
              Form1.sEdit10.Text := 'Большие';
            end
          else
            Form1.sEdit10.Text := 'Ошибка определения';
        end;
        // Read data
        ClearData;
        FS.Position := Data_pos; // 24
        for j := 0 to NoxFontFile.ListCount - 1 do
          for i := A[j].FirstSym to A[j].LastSym do
          begin
            NoxFontFile.SymOffsets[i][0] := FS.Position;
            for i2 := 1 to NoxFontFile.BytesForSym do
            begin
              FS.Read(NoxFontFile.Data[i][i2], 1);
              NoxFontFile.DataOrig[i][i2] := NoxFontFile.Data[i][i2];
              // Form1.StatusBar1.Panels[0].Text := inttostr
              // (NoxFontFile.Data[31][11]);
            end;
          end;

        SetLength(NoxFontFile.SymStats, NoxFontFile.LastSym + 1);
        { for i := NoxFontFile.FirstSym to NoxFontFile.LastSym do
          begin
          NoxFontFile.SymOffsets[i][0] := FS.Position;
          for i2 := 1 to NoxFontFile.BytesForSym do
          begin
          FS.Read(NoxFontFile.Data[i][i2], 1);
          NoxFontFile.DataOrig[i][i2] := NoxFontFile.Data[i][i2];
          // Form1.StatusBar1.Panels[0].Text := inttostr
          // (NoxFontFile.Data[31][11]);
          end;
          end; }
        // Output strings
        Form1.Caption := 'Nox Font Editor Beta - ' + Form1.OpenDialog1.filename;
        Form1.sEdit6.Text := NoxFontFile.Name;
        Form1.sEdit7.Text := inttostr(NoxFontFile.Sym_Height);
        Form1.sEdit8.Text := AnsiChar(NoxFontFile.FirstSym);
        // inttostr(NoxFontFile.FirstSym);
        Form1.sEdit9.Text := AnsiChar(NoxFontFile.LastSym);
        Form1.sLabel2.Caption := '(' + inttostr(NoxFontFile.Sym_Width) + ')';
        { Form1.sEdit8.Text := inttohex(NoxFontFile.Sym_Height, 2);
          Form1.sEdit9.Text := IntToBin(NoxFontFile.Sym_Height, 8); }
        Form1.sListBox1.Items.Clear;

        for i := NoxFontFile.FirstSym to NoxFontFile.LastSym do
        begin
          Bytes_Count := 0;
          for i2 := 2 to NoxFontFile.BytesForSym do
          begin
            if NoxFontFile.Data[i, i2] <> 0 then
              inc(Bytes_Count);
          end;
          if Bytes_Count = 0 then
            NoxFontFile.SymStats[i] := 1 // 1 is empty symbol
          else if Bytes_Count > 0 then
            NoxFontFile.SymStats[i] := 0; // 2 is not empty
        end;

        // Create list of symbols
        for j := 0 to NoxFontFile.ListCount - 1 do
          for i := A[j].FirstSym to A[j].LastSym do
            Form1.sListBox1.Items.Add(AnsiChar(i));
        // if lists > 1
        if NoxFontFile.ListCount > 1 then
        begin
          for j := 0 to NoxFontFile.ListCount - 2 do
            for i := A[j].LastSym to A[j + 1].FirstSym - 2 do
            begin
              L := (A[j + 1].FirstSym) -
                ((A[j + 1].FirstSym - A[j].LastSym) - 1);
              Form1.sListBox1.Items.Insert(L - A[0].FirstSym, AnsiChar(L));
              NoxFontFile.SymStats[L] := 2;
            end;
        end;
        { for i := NoxFontFile.FirstSym to NoxFontFile.LastSym do
          begin
          try
          if i = ord('А') then
          break;
          finally
          L := i;
          end;
          Form1.sListBox1.Items.Add(Chr(i));
          end;
          for AC := 'А' to 'Я' do
          begin
          Form1.sListBox1.Items.Insert(L - NoxFontFile.FirstSym, AC);
          inc(L);
          end;
          for AC := 'а' to 'я' do
          begin
          Form1.sListBox1.Items.Insert(L - NoxFontFile.FirstSym, AC);
          inc(L);
          end; }

        SetLength(NoxFontFile.BinIMG, NoxFontFile.BytesForSym);
        SetLength(NoxFontFile.BinIMG16, NoxFontFile.BytesForSym div 2);
        SetLength(NoxFontFile.BinIMG32, NoxFontFile.BytesForSym div 3);
        // SetLength(NoxFontFile.ChangedSym, NoxFontFile.LastSym + 1);
        FontFileOpened := true;
      end
      else
        Showmessage('Формат файла не поддерживается или файл поврежден!');
    finally
      FS.Free();
    end;
  except
    on E: Exception do
      MessageBox(0, Pchar(E.Message), 'Error', 0);
  end;

end;

// Compare orig data and changed (current)
function SymbolOrigCompare(Symbol: Integer): bool; // True - if same
var
  i, change_count: Integer;
begin
  change_count := 0;
  for i := 1 to NoxFontFile.BytesForSym do
    if NoxFontFile.Data[Symbol][i] = NoxFontFile.DataOrig[Symbol][i] then
      inc(change_count);
  if change_count = NoxFontFile.BytesForSym then
    result := true
  else
    result := false;
  // function
end;

function SaveDataToFontFile(NewFile: string): bool;
var
  i, j, zero, Indent: Integer;
  FName: string;
begin
  zero := 0;
  FName := Form1.OpenDialog1.filename;
  if NewFile = '' then
    FName := Form1.OpenDialog1.filename
  else
  begin
    CopyFile(Pchar(FName), Pchar(NewFile), false);
    FName := NewFile;
  end;
  // Write Head
  FS2 := TFileStream.Create(FName, fmOpenReadWrite);
  FS2.Position := $10; // Symbol height
  FS2.Write(NoxFontFile.Sym_Height, 1);
  FS2.Position := $18; // Bytes for Sym
  FS2.Write(NoxFontFile.BytesForSym, 1);
  FS2.Position := $14; // Count of lists
  FS2.Write(NoxFontFile.ListCount, 1);
  // Write lists
  FS2.Position := $1C;
  for j := 0 to NoxFontFile.ListCount - 1 do
  begin
    FS2.Write(A[j].Indent, 1);
    FS2.Write(zero, 1);
    FS2.Write(zero, 1);
    FS2.Write(zero, 1);
    //
    FS2.Write(A[j].FirstSym, 1);
    FS2.Write(zero, 1);
    FS2.Write(A[j].LastSym, 1);
    FS2.Write(zero, 1);
  end;
  // Write data
  FS2.Position := Data_pos;
  for j := 0 to NoxFontFile.ListCount - 1 do
    for i := A[j].FirstSym to A[j].LastSym do
      FS2.Write(NoxFontFile.Data[i][1], NoxFontFile.BytesForSym);
  FS2.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  OpenDialog2.Execute();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DrawGrid1.DefaultColWidth := 18;
  DrawGrid1.DefaultRowHeight := 16;
  TrackBar1.Position := 1;
  DrawGrid1.Canvas.Brush.Color := ClBlack;
  // sListBox1.Items.SaveToFile('sym_enum.txt');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  form6.show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form1.FormStyle := fsNormal;
  form3.show;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

  UpDownSymbol(-1);

end;

procedure TForm1.Button6Click(Sender: TObject);
begin

  UpDownSymbol(1);

end;

// Draw symbol
procedure TForm1.DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i, i2: Integer;
  S: string;
begin
//  if CanEdit then begin
  if FontFileOpened then
  begin
    DrawGrid1.Canvas.Brush.Color := ClBlack;

    // if NoxFontFile.SymSize = 1 then
    begin
      SetLength(NoxFontFile.BinIMG, NoxFontFile.BytesForSym);
      for i := 0 to NoxFontFile.BytesForSym - 1 do // Draw first 8 bit
      begin
        S := NoxFontFile.BinIMG[i];
        for i2 := 1 to Length(S) do
          if (S[i2] = '1') then
            DrawGrid1.Canvas.FillRect(DrawGrid1.CellRect(i2 - 1, i));
      end;
    end;

    if NoxFontFile.SymSize = 2 then
      for i := 0 to (NoxFontFile.BytesForSym div 2) - 1 do
      // Draw 2nd 8 bit
      begin
        S := NoxFontFile.BinIMG16[i];
        for i2 := 1 to Length(S) do
          if (S[i2] = '1') then
            DrawGrid1.Canvas.FillRect(DrawGrid1.CellRect(8 + (i2 - 1), i));
      end;

    if NoxFontFile.SymSize = 3 then
    begin
      for i := 0 to (NoxFontFile.BytesForSym div 3) - 1 do
      // Draw 2nd 8 bit
      begin
        S := NoxFontFile.BinIMG16[i];
        for i2 := 1 to Length(S) do
          if (S[i2] = '1') then
            DrawGrid1.Canvas.FillRect(DrawGrid1.CellRect(8 + (i2 - 1), i));
      end;
      for i := 0 to (NoxFontFile.BytesForSym div 3) - 1 do
      // Draw 3nd 8 bit
      begin
        S := NoxFontFile.BinIMG32[i];
        for i2 := 1 to Length(S) do
          if (S[i2] = '1') then
            DrawGrid1.Canvas.FillRect(DrawGrid1.CellRect(16 + (i2 - 1), i));
      end;
    end;
    if sListBox1.ItemIndex < 0 then // Draw empty field
    begin
      DrawGrid1.Canvas.Brush.Color := clWhite;
      for i := 0 to DrawGrid1.ColCount - 1 do
        for i2 := 0 to DrawGrid1.RowCount - 1 do
        begin
          DrawGrid1.Canvas.FillRect(DrawGrid1.CellRect(i, i2));
        end;
    end;
  end;

//  end;

end;

procedure TForm1.DrawGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  // DrawGrid1.DefaultColWidth := DrawGrid1.DefaultColWidth - 1;
  // DrawGrid1.DefaultRowHeight := DrawGrid1.DefaultRowHeight - 1;
  //
  // if ((DrawGrid1.DefaultColWidth < 9) or (DrawGrid1.DefaultRowHeight < 8)) or
  // ((DrawGrid1.DefaultColWidth > 36) or (DrawGrid1.DefaultRowHeight > 32))
  // then
  // begin
  // DrawGrid1.DefaultRowHeight := 8;
  // DrawGrid1.DefaultColWidth := 9;
  // end;

end;

procedure TForm1.DrawGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  // DrawGrid1.DefaultColWidth := DrawGrid1.DefaultColWidth + 1;
  // DrawGrid1.DefaultRowHeight := DrawGrid1.DefaultRowHeight + 1;
  //
  // if ((DrawGrid1.DefaultColWidth < 9) or (DrawGrid1.DefaultRowHeight < 8)) or
  // ((DrawGrid1.DefaultColWidth > 36) or (DrawGrid1.DefaultRowHeight > 32))
  // then
  // begin
  // DrawGrid1.DefaultRowHeight := 32;
  // DrawGrid1.DefaultColWidth := 36;
  // end;
end;

procedure TForm1.DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
Var
  Stemp: string;
  i, j, CurrSymbol, Bytes_Count, max_col_out: Integer;
begin
  // Form1.Caption:= inttostr(Windows.GetFocus);
  // ShowMessage(inttostr(ACol) + ' Row: ' + inttostr(ARow));
  // Set Changes
  if CanEdit then begin

  if (FontFileOpened) and (sListBox1.ItemIndex <> -1) then
  begin
    CurrSymbol := NoxFontFile.FirstSym + sListBox1.ItemIndex;
    // First 8 bit
    if ACol < 8 then
    begin
      max_col := 0;
      Stemp := NoxFontFile.BinIMG[ARow];
      if (Stemp[ACol + 1] = '0') and ((DrawORClear = 0) or (DrawORClear = 1))
        then
        Stemp[ACol + 1] := '1'
      else if ((DrawORClear = 0) or (DrawORClear = 2)) then
        Stemp[ACol + 1] := '0';
      NoxFontFile.BinIMG[ARow] := Stemp;
    end;
    // Second 8 bit
    if (ACol >= 8) and (ACol < 16) then
    begin
      max_col16 := 0;
      Stemp := NoxFontFile.BinIMG16[ARow];
      if (Stemp[(ACol + 1) - 8] = '0') and
        ((DrawORClear = 0) or (DrawORClear = 1)) then
        Stemp[(ACol + 1) - 8] := '1'
      else if ((DrawORClear = 0) or (DrawORClear = 2)) then
        Stemp[(ACol + 1) - 8] := '0';
      NoxFontFile.BinIMG16[ARow] := Stemp;
    end;
    // Last 8 bits
    if (ACol >= 16) and (ACol <= 24) then
    begin
      max_col32 := 0;
      Stemp := NoxFontFile.BinIMG32[ARow];
      if (Stemp[(ACol + 1) - 16] = '0') and
        ((DrawORClear = 0) or (DrawORClear = 1)) then
        Stemp[(ACol + 1) - 16] := '1'
      else if ((DrawORClear = 0) or (DrawORClear = 2)) then
        Stemp[(ACol + 1) - 16] := '0';
      NoxFontFile.BinIMG32[ARow] := Stemp;
      i := 0;
    end;

    for i := 0 to Length(NoxFontFile.BinIMG) - 1 do
    begin
      try
        Stemp := NoxFontFile.BinIMG[i];
        for j := Length(Stemp) downto 1 do
          if Stemp[j] = '1' then
            break;
      finally
        if j > max_col then
          max_col := j;
      end;
    end;
    for i := 0 to Length(NoxFontFile.BinIMG16) - 1 do
    begin
      try
        Stemp := NoxFontFile.BinIMG16[i];
        for j := Length(Stemp) downto 1 do
          if Stemp[j] = '1' then
            break;
      finally
        if 8 + j > max_col16 then
          max_col16 := 8 + j;
      end;
    end;
    for i := 0 to Length(NoxFontFile.BinIMG32) - 1 do
    begin
      try
        Stemp := NoxFontFile.BinIMG32[i];
        for j := Length(Stemp) downto 1 do
          if Stemp[j] = '1' then
            break;
      finally
        if 16 + j > max_col32 then
          max_col32 := 16 + j;
      end;
    end;
    // Write new data
    max_col_out := 0;
    if max_col32 = 16 then
      max_col32 := 0;
    if max_col16 = 8 then
      max_col16 := 0;

    if max_col16 > max_col then
      max_col_out := max_col16
    else if max_col16 < max_col then
      max_col_out := max_col;

    if max_col32 > max_col16 then
      max_col_out := max_col32
    else if max_col32 < max_col16 then
      max_col_out := max_col16;

    NoxFontFile.Data[CurrSymbol][1] := max_col_out;
    sEdit1.Text := inttostr(max_col_out);

    if NoxFontFile.SymSize = 1 then
    begin
      i := 0;
      while i < NoxFontFile.BytesForSym - 1 do
      begin // Write data
        NoxFontFile.Data[CurrSymbol][i + 2] := BinToInt(NoxFontFile.BinIMG[i]);
        i := i + 1;
      end;
    end;

    if NoxFontFile.SymSize = 2 then
    begin
      i := 0;
      j := 2;
      SetLength(NoxFontFile.BinIMG, NoxFontFile.Sym_Height);
      while i < Length(NoxFontFile.BinIMG) do
      begin // Write data
        NoxFontFile.Data[CurrSymbol][j] := BinToInt(NoxFontFile.BinIMG[i]);
        NoxFontFile.Data[CurrSymbol][j + 1] := BinToInt
          (NoxFontFile.BinIMG16[i]);
        i := i + 1;
        j := j + 2;
      end;
    end;

    if NoxFontFile.SymSize = 3 then
    begin
      i := 0;
      j := 2;
      SetLength(NoxFontFile.BinIMG, NoxFontFile.Sym_Height);
      while i < Length(NoxFontFile.BinIMG) do
      begin // Write data
        NoxFontFile.Data[CurrSymbol][j] := BinToInt(NoxFontFile.BinIMG[i]);
        NoxFontFile.Data[CurrSymbol][j + 1] := BinToInt
          (NoxFontFile.BinIMG16[i]);
        NoxFontFile.Data[CurrSymbol][j + 2] := BinToInt
          (NoxFontFile.BinIMG32[i]);
        i := i + 1;
        j := j + 3;
      end;
    end;

    // Check for Empty and Changed
    Bytes_Count := 0;
    for i := 2 to NoxFontFile.BytesForSym do
    begin
      if NoxFontFile.Data[CurrSymbol, i] <> 0 then
        inc(Bytes_Count);
    end;
    if Bytes_Count = 0 then
      NoxFontFile.SymStats[CurrSymbol] := 1 // 1 is empty symbol
    else if Bytes_Count > 0 then
    begin
      // NoxFontFile.EmptySym[CurrSymbol] := 0;
      NoxFontFile.SymStats[CurrSymbol] := 3; // Changed
    end;
    // Change
    FontFileChanged := true;
    sListBox1.Repaint;
  end;
  end;
end;

procedure TForm1.EditSymbolsMenuPopup(Sender: TObject);
Var

  Point: TPoint;
  CurrSymbol: Integer;
begin
  CurrSymbol := NoxFontFile.FirstSym + sListBox1.ItemIndex;
  if (FontFileOpened) or (sListBox1.ItemIndex > -1) then // File opened
  begin
    N12.Enabled := true; // Delete image sym
    N13.Enabled := true; // Replace
    N14.Enabled := false; // Save image
    N15.Enabled := true; // Original image

    if sCheckBox3.Checked then
      N16.Enabled := false // Import from ttf
    else N16.Enabled := true;

    N17.Enabled := true; // Delete sym
  end
  else
  begin // not opened
    N12.Enabled := false;
    N13.Enabled := false;
    N14.Enabled := false;
    N15.Enabled := false;
    N16.Enabled := false;
    N17.Enabled := false;
  end;

  // sym deleted
  if (FontFileOpened) and (NoxFontFile.SymStats[CurrSymbol] = 1) then
  begin
    N12.Enabled := false;
    N14.Enabled := false;
    N15.Enabled := false;
  end;

  // sym real deleted
  if (FontFileOpened) and (NoxFontFile.SymStats[CurrSymbol] = 2) then
  begin
    N12.Enabled := false;
    N13.Enabled := true;
    N14.Enabled := false;
    N15.Enabled := false;

    if sCheckBox3.Checked then
      N16.Enabled := false // Import from ttf
    else N16.Enabled := true;

    N17.Enabled := false;
  end;
  // MousePoint := EditSymbolsMenu.PopupPoint;
  // ShowMessage(inttostr(MousePoint.X)+' : '+inttostr(MousePoint.Y));
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  CanEdit:= not sCheckBox3.Checked;
  SpeedButton3.Font.Color:= clLime;
  SpeedButton3.Flat := true;
  SpeedButton2.Flat := true;
  SpeedButton1.Flat := true;
  Form4.show;
  DrawGrid1.GridLineWidth := TrackBar1.Position;
  max_col := 0;
  max_col16 := 0;
  max_col32 := 0;
  // for i := 0 to 9 do
  // NoxFontFile.BinIMG[i] := '00000000';
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  // Form1.WindowState:= wsMinimized;
  if FontFileChanged then
  begin
    N3.Enabled := true;
    //N11.Enabled := true;
  end
  else
  begin
    N3.Enabled := false;
    //N11.Enabled := false;
  end;
end;

procedure TForm1.N10Click(Sender: TObject); // Export
begin
  if not FontFileOpened then
    Showmessage('Прежде надо открыть файл с шрифтом...')
  else if strtoint(sEdit1.Text) > 0 then
    SaveDialog1.Execute()
  else
    Showmessage('Cимвол не выбран или удален.');
end;

procedure TForm1.N11Click(Sender: TObject);
Var
  SAction: Integer;
begin
  SaveDialog2.Execute();
end;

procedure TForm1.N12Click(Sender: TObject); // Delete symbol
var
  CurrSym, i: Integer;
  SAction: Integer;
begin
  CurrSym := NoxFontFile.FirstSym + sListBox1.ItemIndex;
  // SAction := MessageDlg(
  // 'Это действие приведет к стиранию изображения выбранного символа, продолжить?'
  // , mtWarning, [mbYes, mbNo], 0);
  SAction := MessageBox(self.Handle,
    'Это действие приведет к стиранию изображения выбранного символа, продолжить?'
      , 'Nox Font Editor', MB_YESNO + MB_ICONINFORMATION + MB_APPLMODAL);
  if SAction = mrYes then
  begin
    // erase bits from massive
    for i := 1 to NoxFontFile.BytesForSym do
      NoxFontFile.Data[CurrSym][i] := 0;
    NoxFontFile.SymStats[CurrSym] := 1;
    sListBox1DblClick(Sender);
    sListBox1.Repaint;
    FontFileChanged := true;
  end;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
  // SaveDialog2.Execute();
  N10.Click;
end;

procedure TForm1.N15Click(Sender: TObject); // Restore orig symbol
var
  CurrSym, i, Bytes_Count: Integer;
  SAction: Integer;
begin
  CurrSym := NoxFontFile.FirstSym + sListBox1.ItemIndex;
  // SAction := MessageDlg('Уверены, что хотите вернуть исходное изображение?',
  // mtWarning, [mbYes, mbNo], 0);
  SAction := MessageBox(self.Handle,
    'Уверены, что хотите вернуть исходное изображение?', 'Nox Font Editor',
    MB_YESNO + MB_ICONINFORMATION + MB_APPLMODAL);
  if SAction = mrYes then
  begin
    for i := 1 to NoxFontFile.BytesForSym do
      NoxFontFile.Data[CurrSym][i] := NoxFontFile.DataOrig[CurrSym][i];
    // Check for Empty and Changed
    Bytes_Count := 0;
    for i := 2 to NoxFontFile.BytesForSym do
    begin
      if NoxFontFile.Data[CurrSym, i] <> 0 then
        inc(Bytes_Count);
    end;
    if Bytes_Count = 0 then
      NoxFontFile.SymStats[CurrSym] := 1 // 1 is empty symbol
    else if Bytes_Count > 0 then
    begin
      NoxFontFile.SymStats[CurrSym] := 0;
      // NoxFontFile.ChangedSym[CurrSymbol] := 1;
    end;
    SymbolOrigCompare(CurrSym);
    if (FontFileSaved) { and (SymbolOrigCompare(CurrSym) = false) } then
    begin
      NoxFontFile.SymStats[CurrSym] := 3; // Changed
      // NoxFontFile.EmptySym[CurrSym] := 0;
      FontFileChanged := true;
    end;
    // Delete from lists


    sListBox1DblClick(Sender);
    sListBox1.Repaint;
  end;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
  Button3.Click;
end;

procedure TForm1.N17Click(Sender: TObject); // Real delete symbol
var
  SAction, CurrSymbol, i, j: Integer;
begin
  CurrSymbol := NoxFontFile.FirstSym + sListBox1.ItemIndex;
  SAction := MessageBox(self.Handle, 'Символ будет удален, продолжить?',
    'Nox Font Editor', MB_YESNO + MB_ICONINFORMATION + MB_APPLMODAL);
  if SAction = mrYes then
  begin
    NoxFontFile.ListCount_Old := NoxFontFile.ListCount;

    { for j := 0 to NoxFontFile.ListCount_Old - 1 do
      if (CurrSymbol < A[j].FirstSym) and (CurrSymbol > A[j].LastSym) then }

    inc(NoxFontFile.ListCount);
    SetLength(A, NoxFontFile.ListCount);
    A[Length(A) - 1] := A[Length(A) - 2];
    A[Length(A) - 2].FirstSym := A[Length(A) - 1].FirstSym;
    A[Length(A) - 2].LastSym := CurrSymbol - 1;
    A[Length(A) - 1].FirstSym := CurrSymbol + 1;
    A[Length(A) - 1].Indent := (A[Length(A) - 2].LastSym - A[Length(A) - 2]
        .FirstSym) + A[Length(A) - 2].Indent + 1;
    for i := 1 to NoxFontFile.BytesForSym do
      NoxFontFile.Data[CurrSymbol][i] := 0;
    NoxFontFile.SymStats[CurrSymbol] := 2;
    Data_pos := Data_pos + 8;
    FontFileChanged := true;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  Form1.FormStyle := fsNormal;
  // 0.99a update
  if FontFileOpened then N11.Enabled := true
  else N11.Enabled := false;
  // ---
end;

procedure TForm1.N2Click(Sender: TObject); // Select File
var
  SAction: Integer;
begin
  if FontFileChanged then
  begin
    SAction := MessageBox(self.Handle,
      'Набор символов был изменен, сохраненить изменения?', 'Nox Font Editor',
      MB_YESNOCANCEL + MB_ICONINFORMATION + MB_APPLMODAL);
    if SAction = mrYes then
    begin
      SaveDataToFontFile('');
      FontFileChanged := false;
      FontFileSaved := true;
      OpenDialog1.Execute();
    end
    else if SAction = mrNo then
      OpenDialog1.Execute();
  end
  else
    OpenDialog1.Execute();
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Close; // Close programm
end;

procedure TForm1.N3Click(Sender: TObject);
Var
  SAction, i: Integer;
begin
  // SAction := MessageDlg('Данные были изменены, перезаписать файл?', mtWarning,
  // [mbYes, mbNo], 0);
  SAction := MessageBox(self.Handle,
    'Данные были изменены, перезаписать файл?', 'Nox Font Editor',
    MB_YESNO + MB_ICONINFORMATION + MB_APPLMODAL);
  if SAction = mrYes then
  begin
    SaveDataToFontFile('');
    FontFileChanged := false;
    FontFileSaved := true;
    for i := 0 to NoxFontFile.LastSym - 1 do
      if NoxFontFile.SymStats[i] = 3 then
        NoxFontFile.SymStats[i] := 0;
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Form1.FormStyle := fsNormal;
  ABOUT.AboutBox.show; // Show About
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  form2.show;
  //
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  // DrawGrid1.Repaint;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  if not sCheckBox1.Checked then
    DrawGrid1.GridLineWidth := TrackBar1.Position;
end;

procedure TForm1.OpenDialog1CanClose(Sender: TObject; var CanClose: Boolean);
var
  i: Integer;
begin // Open file and init it
  OpenFontFile();
  DrawGrid1.RowCount := NoxFontFile.Sym_Height;
  DrawGrid1.ColCount := NoxFontFile.Sym_Width;
  // DrawGrid1.Repaint;
  sListBox1.ItemIndex := -1;
  StatusBar1.Panels[0].Text := 'Файл открыт';
  form3.Memo1.Lines.Clear;
  FontFileChanged := false;
  FontFileSaved := false;
  // for i := 0 to NoxFontFile.LastSym - 1 do
  // begin
  // if NoxFontFile.SymStats[i] <> 2 then
  // NoxFontFile.SymStats[i] := 0;
  // end;
end;

procedure TForm1.OpenDialog2CanClose(Sender: TObject; var CanClose: Boolean);
begin
  sListBox1.Items.LoadFromFile(OpenDialog2.filename);
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    RadioButton2.Checked := false;
    RadioButton3.Checked := false;
    DrawGrid1.DefaultColWidth := 9;
    DrawGrid1.DefaultRowHeight := 8;
  end;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  if RadioButton2.Checked then
  begin
    RadioButton1.Checked := false;
    RadioButton3.Checked := false;
    DrawGrid1.DefaultColWidth := 18;
    DrawGrid1.DefaultRowHeight := 16;
  end;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  if RadioButton3.Checked then
  begin
    RadioButton2.Checked := false;
    RadioButton1.Checked := false;
    DrawGrid1.DefaultColWidth := 36;
    DrawGrid1.DefaultRowHeight := 32;
  end;
end;

// Export symbol
procedure TForm1.SaveDialog1CanClose(Sender: TObject; var CanClose: Boolean);
Var
  ExportFile: tinifile;
  S: string;
  i: Integer;
begin
  S := '';
  for i := 1 to NoxFontFile.BytesForSym do
  begin
    S := S + inttohex
      (NoxFontFile.Data[strtoint(inttostr
          (NoxFontFile.FirstSym + sListBox1.ItemIndex))][i], 2);
  end;
  try
    ExportFile := tinifile.Create(SaveDialog1.filename + '.nfe');
    ExportFile.WriteString('NoxSymbol', 'ASCII',
      inttostr(NoxFontFile.FirstSym + sListBox1.ItemIndex));
    ExportFile.WriteString('NoxSymbol', 'OrigFile', sEdit6.Text);
    ExportFile.WriteString('NoxSymbol', 'DataSize',
      inttostr(NoxFontFile.BytesForSym));
    ExportFile.WriteString('NoxSymbol', 'Data', S);
  finally
    ExportFile.Free;
  end;
end;

procedure TForm1.SaveDialog2CanClose(Sender: TObject; var CanClose: Boolean);
var
  i: Integer;
begin
  SaveDataToFontFile(SaveDialog2.filename);
  FontFileChanged := false;
  FontFileSaved := true;
  for i := 0 to NoxFontFile.LastSym - 1 do
  begin
    if NoxFontFile.SymStats[i] <> 2 then
      NoxFontFile.SymStats[i] := 0;
  end;
end;

procedure TForm1.sCheckBox1Click(Sender: TObject);
begin
  if sCheckBox1.Checked then
    DrawGrid1.GridLineWidth := 0
  else
    DrawGrid1.GridLineWidth := TrackBar1.Position;
end;

procedure TForm1.sCheckBox2Click(Sender: TObject);
begin
  if sCheckBox2.Checked then
    DrawGrid1.ColCount := strtoint(sEdit1.Text)
  else
    DrawGrid1.ColCount := NoxFontFile.Sym_Width;
end;

procedure TForm1.sCheckBox3Click(Sender: TObject);
begin
  if sCheckBox3.Checked then
    CanEdit := false
  else
    CanEdit := true;
end;

procedure TForm1.sEdit7Click(Sender: TObject);
begin
  if FontFileOpened then
  begin
    form5.sEdit1.Text := inttostr(NoxFontFile.Sym_Height);
    form5.show;
  end;
end;

// Select Symbol and draw
procedure TForm1.sListBox1Click(Sender: TObject);
begin
  sListBox1DblClick(Sender);
  form6.sButton2.Click;
  form6.DrawGrid1.Repaint;
  form6.Image1.Repaint;
end;

procedure TForm1.sListBox1DblClick(Sender: TObject);
Var
  It, jt: Integer;
  S: string;
  CurrSymbol: Integer; // Code of current symbol
  SymWidth: Integer; // Corrent symbol width
begin
  CurrSymbol := NoxFontFile.FirstSym + sListBox1.ItemIndex;
  SymWidth := NoxFontFile.Data[NoxFontFile.FirstSym + sListBox1.ItemIndex, 1];
  StatusBar1.Panels[0].Text := 'Символ: ' + sListBox1.Items
    [sListBox1.ItemIndex] + ' , код текущего символа: ' + inttostr(CurrSymbol);
  sEdit1.Text := inttostr(SymWidth);
  // sListBox1.Items[sListBox1.ItemIndex] := sListBox1.Items[sListBox1.ItemIndex]
  // + '  ->';
  // Form1.Caption := inttostr(sListBox1.ItemIndex);
  // sListBox1.Items.Delete(sListBox1.ItemIndex);
  // Procedure of the bin-to-img
  // for It := 1 to NoxFontFile.BytesForSym do
  // Memo1.Lines.Add(IntToBin(NoxFontFile.Data[31, It], 4) + '' + inttostr(It));
  // Size Small




  if NoxFontFile.SymSize = 1 then
  begin
    SetLength(NoxFontFile.BinIMG, NoxFontFile.BytesForSym);
    for It := 0 to NoxFontFile.BytesForSym - 1 do
    begin
      NoxFontFile.BinIMG[It] := IntToBin(NoxFontFile.Data[CurrSymbol, It + 2],
        8);
    end;
  end;
  //
  // Size medium
  if NoxFontFile.SymSize = 2 then
  begin
    SetLength(NoxFontFile.BinIMG16, NoxFontFile.BytesForSym div 2);
    for It := 0 to NoxFontFile.BytesForSym - 1 do
    begin
      NoxFontFile.BinIMG[It] := IntToBin(NoxFontFile.Data[CurrSymbol, It + 2],
        8);
    end;
    jt := 0;
    while jt < (NoxFontFile.BytesForSym div 2) do
    begin // Copy 2nd bits
      NoxFontFile.BinIMG16[jt] := NoxFontFile.BinIMG[(jt * 2) + 1];
      jt := jt + 1;
    end;
    jt := 0;
    while jt < NoxFontFile.BytesForSym - 1 do // Delete 2nd bits
    begin
      NoxFontFile.BinIMG[jt + 1] := '';
      // NoxFontFile.BinIMG[jt + 2] := '';
      jt := jt + 2;
    end;
    SetLength(NoxFontFile.BinIMGDraw, NoxFontFile.BytesForSym div 2);
    for It := 0 to (NoxFontFile.BytesForSym div 2) - 1 do
    begin
      NoxFontFile.BinIMGDraw[It] := NoxFontFile.BinIMG[It * 2]
    end;
    SetLength(NoxFontFile.BinIMG, NoxFontFile.BytesForSym div 2);
    for jt := 0 to (NoxFontFile.BytesForSym div 2) - 1 do
      NoxFontFile.BinIMG[jt] := NoxFontFile.BinIMGDraw[jt];
  end;
  //
  // Size Big
  if NoxFontFile.SymSize = 3 then
  begin
    SetLength(NoxFontFile.BinIMG, NoxFontFile.BytesForSym);
    for It := 0 to NoxFontFile.BytesForSym - 1 do
    begin
      NoxFontFile.BinIMG[It] := IntToBin(NoxFontFile.Data[CurrSymbol, It + 2],
        8);
    end;
    jt := 0;
    SetLength(NoxFontFile.BinIMG16, NoxFontFile.BytesForSym div 3);
    while jt < NoxFontFile.BytesForSym div 3 do
    begin // Copy 2nd and 3nd bits
      NoxFontFile.BinIMG16[jt] := NoxFontFile.BinIMG[(jt * 3) + 1];
      NoxFontFile.BinIMG32[jt] := NoxFontFile.BinIMG[(jt * 3) + 2];
      jt := jt + 1;
    end;
    jt := 0;
    while jt < NoxFontFile.BytesForSym - 1 do // Delete 2nd and 3dn bits
    begin
      NoxFontFile.BinIMG[jt + 1] := '';
      NoxFontFile.BinIMG[jt + 2] := '';
      jt := jt + 3;
    end;
    SetLength(NoxFontFile.BinIMGDraw, NoxFontFile.BytesForSym div 3);
    for It := 0 to (NoxFontFile.BytesForSym div 3) - 1 do
    begin
      NoxFontFile.BinIMGDraw[It] := NoxFontFile.BinIMG[It * 3]
    end;
    SetLength(NoxFontFile.BinIMG, NoxFontFile.BytesForSym div 3);
    for jt := 0 to (NoxFontFile.BytesForSym div 3) - 1 do
      NoxFontFile.BinIMG[jt] := NoxFontFile.BinIMGDraw[jt];
  end;
  //
  DrawGrid1.RowCount := NoxFontFile.Sym_Height; // Length(NoxFontFile.BinIMG); // Set DrawGrid Height
  if sCheckBox2.Checked then
    DrawGrid1.ColCount := strtoint(sEdit1.Text)
  else
    DrawGrid1.ColCount := NoxFontFile.Sym_Width;
  // Length(NoxFontFile.BinIMG[0]);

  form3.Memo1.Lines.Clear;
  if NoxFontFile.SymSize = 1 then
    for It := 0 to NoxFontFile.BytesForSym - 1 do
      form3.Memo1.Lines.Add(NoxFontFile.BinIMG[It]);
  // form3.Memo1.Lines.Add(IntToBin(NoxFontFile.Data[CurrSymbol, It], 8));

  if NoxFontFile.SymSize = 2 then
    for It := 0 to (NoxFontFile.BytesForSym div 2) - 1 do
      form3.Memo1.Lines.Add(NoxFontFile.BinIMG[It] + NoxFontFile.BinIMG16[It]);

  if NoxFontFile.SymSize = 3 then
    for It := 0 to (NoxFontFile.BytesForSym div 3) - 1 do
      form3.Memo1.Lines.Add(NoxFontFile.BinIMG[It] + NoxFontFile.BinIMG16[It]
          + NoxFontFile.BinIMG32[It]);

  // for It := 0 to Length(NoxFontFile.BinIMG) - 1 do
  // Memo1.Lines.Add(NoxFontFile.BinIMG[It]);
  DrawGrid1.Repaint;
end;

procedure TForm1.sListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
Var
  CurrSym: Integer;
begin
  CurrSym := NoxFontFile.FirstSym + Index;
  if FontFileOpened then
  begin
    with TListBox(Control) do
    begin
      if NoxFontFile.SymStats[CurrSym] = 3 then // Changed
      begin
        // SetBkMode(Canvas.Handle, TRANSPARENT);
        Canvas.Font.Color := clLime;
        Canvas.Font.Style := [fsBold];
      end;
      if NoxFontFile.SymStats[CurrSym] = 0 then // Normal
      begin // not deleted
        // SetBkMode(Canvas.Handle, OPAQUE);
        Canvas.Font.Color := clSkyBlue;
        Canvas.Font.Style := [fsBold];
      end;
      if NoxFontFile.SymStats[CurrSym] = 1 then // Deleted
      begin
        // SetBkMode(Canvas.Handle, TRANSPARENT);
        Canvas.Font.Color := ClRed;
        Canvas.Font.Style := [fsBold];
      end;
      if NoxFontFile.SymStats[CurrSym] = 2 then // Real Deleted
      begin // not deleted
        // SetBkMode(Canvas.Handle, OPAQUE);
        Canvas.Font.Color := clOlive;
        Canvas.Font.Style := [fsBold];
      end;
      // if NoxFontFile.EmptySym[CurrSym] = 1 then
      // Canvas.Font.Color := ClRed
      // else
      // Canvas.Font.Color := clSkyBlue;
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left, Rect.Top, Items[index]);
    end;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
//  if SpeedButton1.Flat = false then
//  begin
    DrawORClear := 1;
//    SpeedButton1.Flat := true;
//    SpeedButton2.Flat := false;
    SpeedButton1.Font.Color := clLime;
    SpeedButton2.Font.Color := clWindowText;
    SpeedButton3.Font.Color := clWindowText;
//  end;
//  else
//  begin
//    DrawORClear := 2;
////    SpeedButton1.Flat := false;
////    SpeedButton2.Flat := true;
//    SpeedButton1.Font.Color := clWindowText;
//    SpeedButton2.Font.Color := clLime;
//  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
//  if SpeedButton2.Flat = false then
//  begin
    DrawORClear := 2;
//    SpeedButton2.Flat := true;
//    SpeedButton1.Flat := false;
    SpeedButton2.Font.Color := clLime;
    SpeedButton1.Font.Color := clWindowText;
    SpeedButton3.Font.Color := clWindowText;
//  end;
//  else
//  begin
//    DrawORClear := 1;
////    SpeedButton2.Flat := false;
////    SpeedButton1.Flat := true;
//    SpeedButton2.Font.Color := clWindowText;
//    SpeedButton1.Font.Color := clLime;
//  end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  DrawORClear := 0;
//  SpeedButton2.Flat := false;
//  SpeedButton1.Flat := false;
  SpeedButton3.Font.Color := clLime;
  SpeedButton2.Font.Color := clWindowText;
  SpeedButton1.Font.Color := clWindowText;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  SAction: Integer;
begin
  // if FontFileChanged then
  // SAction := MessageBox(self.Handle, 'Сохранить файл перед выходом?',
  // 'Nox Font Editor', MB_YESNOCANCEL + MB_ICONINFORMATION + MB_APPLMODAL);
  // if SAction = mrYes then
  // begin
  // SaveDialog2.Execute();
  // Application.Terminate;
  // end
  // else if SAction = mrNo then
  Application.Terminate;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
  SAction: Integer;
begin
  if FontFileChanged then
    SAction := MessageBox(self.Handle, 'Сохранить файл перед выходом?',
      'Nox Font Editor', MB_YESNOCANCEL + MB_ICONINFORMATION + MB_APPLMODAL);
  if SAction = mrYes then
  begin
    SaveDialog2.Execute();
    CanClose := true;
  end
  else if SAction = mrNo then
    CanClose := true
  else if SAction = mrCancel then
    CanClose := false;
end;

end.
