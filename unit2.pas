unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, fpjson, jsonparser;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function LerArquivoTexto(NomeArquivo: String): String;
    procedure EscreverArquivoTexto(NomeArquivo, Conteudo: String);
    function CriaNode(x, y: string): TJSONObject;
  public

  end;

var
  Form2: TForm2;
  JSONString: String;
  JsonObject: TJSONObject;

implementation

{$R *.lfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  // Supondo que JSONString contenha o JSON com as cinco strings
  JSONString := LerArquivoTexto('screen.json');

  // Analisando o JSON
  JsonObject := GetJSON(JSONString) as TJSONObject;

  // Atribuindo os valores do JSON ao registro
  Edit1.Text := IntToStr(JsonObject.FindPath('lupa.x').AsInteger);
  Edit2.Text := IntToStr(JsonObject.FindPath('lupa.y').AsInteger);
  Edit3.Text := IntToStr(JsonObject.FindPath('id.x').AsInteger);
  Edit4.Text := IntToStr(JsonObject.FindPath('id.y').AsInteger);
  Edit5.Text := IntToStr(JsonObject.FindPath('registro.x').AsInteger);
  Edit6.Text := IntToStr(JsonObject.FindPath('registro.y').AsInteger);
  Edit7.Text := IntToStr(JsonObject.FindPath('menu.x').AsInteger);
  Edit8.Text := IntToStr(JsonObject.FindPath('menu.y').AsInteger);
  Edit9.Text := IntToStr(JsonObject.FindPath('submenu.x').AsInteger);
  Edit10.Text := IntToStr(JsonObject.FindPath('submenu.y').AsInteger);
  Edit11.Text := IntToStr(JsonObject.FindPath('fechar.x').AsInteger);
  Edit12.Text := IntToStr(JsonObject.FindPath('fechar.y').AsInteger);
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  x, y : integer;
  LupaObject, IdObject, RegistroObject, MenuObject, SubmenuObject,
  FecharObject: TJSONObject;
begin
  // Converter os dados para JSON
  JsonObject := TJSONObject.Create;
  LupaObject := CriaNode(Edit1.Text, Edit2.Text);
  JsonObject.Add('lupa', LupaObject);
  IdObject := CriaNode(Edit3.Text, Edit4.Text);
  JsonObject.Add('id', IdObject);
  RegistroObject := CriaNode(Edit5.Text, Edit6.Text);
  JsonObject.Add('registro', RegistroObject);
  MenuObject := CriaNode(Edit7.Text, Edit8.Text);
  JsonObject.Add('menu', MenuObject);
  SubmenuObject := CriaNode(Edit9.Text, Edit10.Text);
  JsonObject.Add('submenu', SubmenuObject);
  FecharObject := CriaNode(Edit11.Text, Edit12.Text);
  JsonObject.Add('fechar', FecharObject);
  JSONString := JsonObject.FormatJSON();
  EscreverArquivoTexto('screen.json', JSONString);
  MessageDlg('Informação', 'Configuração salva com sucesso!', mtInformation, [mbOK], 0);
  Form2.Close();
end;

function TForm2.CriaNode(x, y: string): TJSONObject;
var
  umObjeto: TJSONObject;
  intX, intY: Integer;
begin
  intX := StrToInt(x); // Converte a string 'x' para inteiro
  intY := StrToInt(y); // Converte a string 'y' para inteiro

  umObjeto := TJSONObject.Create; // Cria um novo objeto JSON
  try
    umObjeto.Add('x', intX); // Adiciona o valor de x
    umObjeto.Add('y', intY); // Adiciona o valor de y
    Result := umObjeto; // Retorna o objeto JSON criado
  except
    umObjeto.Free; // Libere o objeto em caso de erro
    raise; // Opcional: relança a exceção
  end;
end;

function TForm2.LerArquivoTexto(NomeArquivo: String): String;
var
  Arquivo: TextFile;
  Linha: String;
begin
  Result := '';
  try
    AssignFile(Arquivo, NomeArquivo);
    {$I-}
    Reset(Arquivo);
    {$I+}

    if IOResult <> 0 then
    begin
      ShowMessage('Erro ao abrir o arquivo');
      Exit;
    end;

    while not Eof(Arquivo) do
    begin
      ReadLn(Arquivo, Linha);
      Result := Result + Linha + sLineBreak;
    end;

    CloseFile(Arquivo);
  except
    on E: Exception do
    begin
      Result := '';
      ShowMessage('Erro ao ler o arquivo: ' + E.Message);
    end;
  end;
end;

procedure TForm2.EscreverArquivoTexto(NomeArquivo, Conteudo: String);
var
  Arquivo: TextFile;
begin
  try
    AssignFile(Arquivo, NomeArquivo);
    Rewrite(Arquivo);
    Write(Arquivo, Conteudo);
    CloseFile(Arquivo);
  except
    on E: Exception do
      ShowMessage('Erro ao escrever no arquivo: ' + E.Message);
  end;
end;

end.

