unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, ShellApi;
  // LCLIntf, FileUtil, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TrayIcon1: TTrayIcon;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure TrayIcon1DblClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  // Minimize to tray when the button is clicked
  TrayIcon1.Visible := True;
  // Application.Minimize;
  Self.Hide; // Esconde o formulário da barra de tarefas
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  AppDir, ProgramPath : String;
begin
  // Obter o diretório do executável da aplicação
  AppDir := ExtractFilePath(Application.ExeName);

  // Construir o caminho completo para o programa externo "robo.exe"
  ProgramPath := AppDir + 'robo.exe';
  ProgramPath := StringReplace(ProgramPath, '\', '/', [rfReplaceAll]);

  // Roda o robô
  ShellExecute(0, 'open', PChar(ProgramPath), '', '', 1);
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  // Garante que o ícone seja removido ao fechar o aplicativo
  TrayIcon1.Visible := False;
end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  // Show and restore the application when double-clicked on the tray icon
  TrayIcon1.Visible := False;
  // Application.Restore;
  Self.Show; // Exibe o formulário na barra de tarefas
end;

end.

