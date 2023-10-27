'''
Encapsulando el juego en una clase

Ahora que disponemos de muchas más herramientas, podemos notar que reutilizamos la variable que contiene el mapa muchas veces y es molesto llamar funciones desconectadas enviando el mismo parámetro.

La programación orientada a objetos viene a nuestro rescate!

Implementa la clase Juego, ahora el mapa y las posiciones inicial y final son atributos de esta clase, reescribe todas tus funciones anteriores de forma que sean métodos de la clase y todo esté encapsulado.

Instanciar el juego y ejecutarlo desde el main
Almacenando mapas en archivos

En lugar de almacenar el mapa en el mismo código, podemos guardarlo en archivos con sus posiciones de inicio y fin y las dimensiones del mapa en la primera línea del archivo, de esta manera los componentes de la aplicación estarán separados y podremos mejorar la experiencia del juego.

    Crear una nueva clase JuegoArchivo la cual hereda de Juego,
    Reescribir el constructor para leer un archivo al azar de una carpeta que contenga los mapas cada vez que se instancia el juego.
        Para listar los archivos de un directorio usar os.listdir(path) , esto devolverá una lista con el nombre los archivos en ese directorio
        Para elegir un elemento aleatorio de una lista usar random.choice(lista).
        Note que para poder leer el archivo tenemos que componer el path, una forma de hacerlo es path_completo = f"{path_a_mapas}/{nombre_archivo}"
    Crear un método que lea los datos de estos archivos de mapa y devuelva una cadena que tenga concatenada todas las filas leídas del mapa y las coordenadas de inicio y fin. Al final de la lectura antes de retornar usar cadena.strip() para eliminar caracteres en blanco residuales.

'''
import os
from readchar import readkey,key
from pydantic import BaseModel
import random

class NotFileError(Exception):
    pass

class Juego(BaseModel):
    mapa: list | None
    laberinto: str | None
    posicion_inicial: tuple | None
    posicion_final: tuple | None

    def convertir_laberinto(self,laberinto) -> None:
        self.mapa = [list(fila.strip()) for fila in self.laberinto.split("\n")]

    def limpiar_pantalla(self) -> None:
        os.system('cls' if os.name == 'nt' else 'clear')

    def mostrar_mapa(self, mapa) -> None:
        for fila in self.mapa:
            print(''.join(fila))

    def main_loop(self, laberinto, posicion_inicial, posicion_final = None) -> None:
        
        
        px, py = posicion_inicial
        while (px, py) != posicion_final:
            self.limpiar_pantalla()
            self.mapa[px][py] = 'P'
            self.mostrar_mapa(self.mapa)
            self.mapa[px][py] = '.'

            tecla = readkey()
            if tecla == key.UP and px > 0 and self.mapa[px - 1][py] != '#':
                px -= 1  # Flecha arriba
            elif tecla == key.DOWN and px < len(self.mapa) - 1 and self.mapa[px + 1][py] != '#':
                px += 1  # Flecha abajo
            elif tecla == key.LEFT and py > 0 and self.mapa[px][py - 1] != '#':
                py -= 1  # Flecha izquierda
            elif tecla == key.RIGHT and py < len(self.mapa[0]) - 1 and self.mapa[px][py + 1] != '#':
                py += 1  # Flecha derecha
        print ("Ganaste")

class JuegoArchivo():
    def __init__(self):
        laberinto = self.leer_archivo()
        self.juego = Juego(posicion_inicial=(0,0),laberinto=laberinto,mapa=None,posicion_final = None)
    
    def leer_archivo(self) -> str:
        path = "/Users/haby/Documents/PROTalent/AdaProyectoIntegradorPython/parte5/mapas"
        laberinto = """..###################
        ....#...............#
        #.#.#####.#########.#
        #.#...........#.#.#.#
        #.#####.#.###.#.#.#.#
        #...#.#.#.#.....#...#
        #.#.#.#######.#.#####
        #.#...#.....#.#...#.#
        #####.#####.#.#.###.#
        #.#.#.#.......#...#.#
        #.#.#.#######.#####.#
        #...#...#...#.#.#...#
        ###.#.#####.#.#.###.#
        #.#...#.......#.....#
        #.#.#.###.#.#.###.#.#
        #...#.#...#.#.....#.#
        ###.#######.###.###.#
        #.#.#.#.#.#...#.#...#
        #.#.#.#.#.#.#.#.#.#.#
        #.....#.....#.#.#.#.#
        ###################.."""
        if os.path.exists(path):
            mapas = os.listdir(path)
            laberinto = list()
            if len(mapas) > 0:
                mapa = random.choice(mapas)
                with open(path+'/'+mapa,"r") as archivo:
                    laberinto = archivo.read()
            else:
                raise NotFileError("No hay archivos en la carpeta mapas, se cargara elmapa por defecto")
        return laberinto.strip()
    
    def iniciar_juego(self):
        self.juego.convertir_laberinto(self.juego.laberinto)
        self.juego.main_loop(self.juego.mapa,self.juego.posicion_inicial,posicion_final=(len(self.juego.mapa) - 1, len(self.juego.mapa[0]) - 1))

Jugar = JuegoArchivo()
Jugar.iniciar_juego()

