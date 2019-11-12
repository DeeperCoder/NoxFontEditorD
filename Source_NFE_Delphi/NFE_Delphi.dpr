program Project1;

uses
  Forms,
  windows,
  dialogs,
  Unit1 in 'Unit1.pas' {Form1},
  ABOUT in 'ABOUT.pas' {AboutBox},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  SymHeightEdit in 'SymHeightEdit.pas' {Form5},
  TTF in 'TTF.pas' {Form6},
  Globals in 'Globals.pas';

{$R *.res}

Var
  xHand: THandle;

begin
 // try
    Application.Title := 'Nox Font Editor';
    {xHand := CreateMutex(nil, false, 'NoxFontEditor');
    If (GetLastError = ERROR_ALREADY_EXISTS) then
    begin
      MessageDlg(' Уже запущено! ', mtInformation, [mbOk], 0);
      Application.Terminate;
    end;}
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
  {finally
    ReleaseMutex(xHand); }
  //end;

end.
