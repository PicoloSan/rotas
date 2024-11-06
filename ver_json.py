import json

def read_json(caminho_arquivo):
    with open(caminho_arquivo, 'r') as arquivo:
        dados = json.load(arquivo)
        return dados

dados = read_json('screen.json')

print(dados["lupa"]["x"], dados["lupa"]["y"])
print(dados["id"]["x"], dados["id"]["y"])
print(dados["registro"]["x"], dados["registro"]["y"])
print(dados["menu"]["x"], dados["menu"]["y"])
print(dados["submenu"]["x"], dados["submenu"]["y"])
print(dados["fechar"]["x"], dados["fechar"]["y"])