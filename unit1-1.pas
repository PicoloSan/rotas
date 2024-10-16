unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLIntf;

type
  { TForm1 }
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure RunExternalProgram(const AProgramPath: String);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  AppDir: String;
begin
  // Obter o diretório do executável da aplicação
  AppDir := ExtractFilePath(Application.ExeName);

  // Construir o caminho completo para o programa externo "programa.exe"
  var ProgramPath := AppDir + 'programa.exe';

  // Exemplo de como chamar o método para executar o programa externo usando o diretório da aplicação
  RunExternalProgram(ProgramPath);
end;

procedure TForm1.RunExternalProgram(const AProgramPath: String);
begin
  ShellExecute(0, 'open', PChar(AProgramPath), '', '', 1);
end;

end.
