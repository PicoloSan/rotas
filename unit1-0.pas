unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    TrayIcon1: TTrayIcon;
    procedure Button1Click(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  // Minimize to tray when the button is clicked
  TrayIcon1.Visible := True;
  Application.Minimize;
  Self.Hide; // Esconde o formulário da barra de tarefas
end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  // Show and restore the application when double-clicked on the tray icon
  TrayIcon1.Visible := False;
  Self.Show;
  Application.Restore;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  // Garante que o ícone seja removido ao fechar o aplicativo
  TrayIcon1.Visible := False;
end;

end.
