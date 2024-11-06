import pandas as pd
import pyautogui
import time

# Carrega o arquivo Excel
arquivo_excel = '01.xlsx'
df = pd.read_excel(arquivo_excel)

# Loop para executar a ação em cada linha
for i in range(50):
    if i < len(df):  # Verifica se ainda há linhas disponíveis
        valor_celula = str(df.iloc[i, 0])
        print(f"{valor_celula}")  # Exibe o valor da célula
        pyautogui.moveTo(950, 220)
        time.sleep(0.5)
        pyautogui.click()
        time.sleep(2.5)
        pyautogui.moveTo(180, 460)
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
        pyautogui.moveTo(280, 440)
        time.sleep(0.5)
        pyautogui.click()
        time.sleep(0.5)
        pyautogui.moveTo(295, 295)
        time.sleep(0.5)
        pyautogui.click()
        time.sleep(0.5)
        pyautogui.moveTo(350, 310)
        time.sleep(0.5)
        pyautogui.click()
        time.sleep(1.5)
        pyautogui.moveTo(960, 515)
        time.sleep(0.5)
        pyautogui.click()


    else:
        print("Todas as linhas foram processadas.")
        break

