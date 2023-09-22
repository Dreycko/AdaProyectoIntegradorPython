#Escribir un programa que corra un bucle infinito leyendo e imprimiento las teclas y sólo terminará cuando se presione la tecla ↑ indicada como UP
from readchar import readkey, key
print("Hola, bienvenido a la aventura!")
print("Presiona la tecla ↑ para terminar el juego")
while True:
    tecla = readkey()
    if tecla == key.UP:
        print("Terminando el juego... tocas la tecla UP")
        break
    print(tecla)
