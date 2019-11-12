unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses unit1, Globals;
{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin

  Label3.Caption := Label3.Caption + ' ' + NFE_Version;

  // Form4.WindowState := wsMinimized;
  // form1.Show;
end;

procedure TForm4.Label4Click(Sender: TObject);
begin
  Form4.WindowState := wsMinimized;
  form1.Show;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  Form4.WindowState := wsMinimized;
  form1.Show;
  Form4.Visible := false;
  Form4.Enabled := false;
  Timer1.Enabled := false;
end;

end.
