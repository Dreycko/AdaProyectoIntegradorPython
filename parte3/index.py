'''
Proyecto integrador parte 3
Para esta sección del proyecto integrador necesitaremos aprender a manipular la terminal:

Iniciar con un número en 0, leer la tecla `n` del teclado en un bucle, por cada presionada, borrar la terminal y e imprimir el nuevo número hasta el número 50.

La operación de borrar la terminal e imprimir el nuevo número debe estar en su propia función.

Para borrar la terminal antes de imprimir nuevo contenido usar la instrucción: os.system('cls' if os.name=='nt' else 'clear'), para esto se debe importar la librería os
'''

import os
from readchar import readkey, key

def borrar_terminal(): 
    os.system('cls' if os.name=='nt' else 'clear')

def imprimir_numero(numero):
    print(numero)
    

numero = 0

while True:
    print("Presiona la tecla n para incrementar el número")
    tecla = readkey()
    if tecla == 'n':
        numero += 1
        borrar_terminal()
        imprimir_numero(numero)
        if numero == 50:
            print("Llegaste al número 50")
            break
    else:
        borrar_terminal()
        print("No presionaste la tecla n")
        
