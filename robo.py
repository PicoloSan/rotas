import openpyxl
import pyautogui
import time
import json
from tkinter import messagebox

# função escreve no arquivo
def write_log(texto, caminho_arquivo):
    # Abra o arquivo em modo de append
    with open(caminho_arquivo, 'a') as file:
        file.write(texto + '\n')

# função lê arquivo json
"""
file   = pasta de trabalho do excel
sheet  = planilha
column = coluna que possui as OS's
line   = numero da linha que possui a primeira das 50 OS's
log    = arquivo de log
"""
def read_json(caminho_arquivo):
    with open(caminho_arquivo, 'r') as arquivo:
        dados = json.load(arquivo)
        return dados

# lê os arquivos de configuração do json
dados = read_json('rotas.json')

# define o arquivo de log como rotas.log ou o nome do arquivo que o usuario configurou
arquivolog = dados['log']

# Carrega o arquivo Excel
umlog = 'Carregando informações...'
write_log(umlog, arquivolog)

# escreve qual arquivo do excel está abrindo no log
umarquivo = dados['file']
umlog = 'Lendo planilha: "' + str(umarquivo) + '" ...'
write_log(umlog, arquivolog)

# abre a planilha da pasta de trabalho do excel
umaplanilha = dados['sheet']
workbook = openpyxl.load_workbook(umarquivo)
sheet = workbook[umaplanilha]
# sheet = workbook.active

# Obter os valores da coluna 'D'
umacoluna = dados['column']
umalinha = int(dados['line'])
umlog = 'Lendo a coluna ' + str(umacoluna) + ', linha ' + str(umalinha) + ', da planilha ' + str(umaplanilha) + ' ...'
write_log(umlog, arquivolog)

# Número máximo de células a serem consideradas
max_cells = 50

ret = messagebox.askquestion("Rotas", "Selecione o operador, vá em Ordens Programáveis, minimize as outras telas e confirme.")

# Usando um loop para pegar as primeiras 50 células da coluna definida pelo usuário
for row in range(umalinha, max_cells + umalinha):
    cell = sheet[f'{umacoluna}{row}']
    if cell.value is not None:
        valor_celula = str(cell.value)

        # Escreve o valor que parou se parou
        umlog = 'A OS atual é: ' + valor_celula + '.'
        write_log(umlog, arquivolog)

        pyautogui.moveTo(950, 205)
        time.sleep(0.5)
        pyautogui.click()
        time.sleep(2.5)
        pyautogui.moveTo(180, 365)
        time.sleep(0.5)
        pyautogui.click()
        time.sleep(0.5)
        pyautogui.press('tab')
        time.sleep(0.5)
        pyautogui.press('delete', presses=10)
        time.sleep(0.5)
        pyautogui.write(valor_celula, interval=0.1)
        time.sleep(0.5)
        pyautogui.press('enter')
        time.sleep(0.5)
        pyautogui.moveTo(280, 425)
        time.sleep(0.5)
        pyautogui.click()
        time.sleep(0.5)
        pyautogui.moveTo(300, 290)
        time.sleep(0.5)
        pyautogui.click()
        time.sleep(0.5)
        pyautogui.moveTo(350, 310)
        time.sleep(0.5)
        pyautogui.click()
        time.sleep(0.5)
        pyautogui.moveTo(760, 425)
        time.sleep(0.5)
        pyautogui.click()

ret = messagebox.showinfo("Rotas", "50 linhas processadas com sucesso!")