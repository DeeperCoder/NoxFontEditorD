unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses Globals;

{$R *.dfm}

procedure TAboutBox.FormCreate(Sender: TObject);
begin

  Version.Caption := Version.Caption + ' ' + NFE_Version;

end;

procedure TAboutBox.Label4Click(Sender: TObject);
begin
ShellExecute(application.Handle, 'Open','http://forum.noxworld.ru/', nil, nil,
 SW_normal);
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
Close;
end;

end.
 
