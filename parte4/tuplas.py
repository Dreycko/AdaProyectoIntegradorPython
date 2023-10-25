#Crea una tupla llamada peliculas con tres nombres de películas que te gusten.
peliculals = ("El señor de los anillos", "El hobbit", "El padrino")
#Crea otra tupla llamada horarios con tres horarios distintos.
horarios = ("12:00", "16:00", "20:00")
#Imprime la información relacionando la información de las tuplas con sus índices o posiciones: 
#El señor de los anillos se está dando a las 12:00
#El hobbit se está dando a las 16:00
#El padrino se está dando a las 20:00

print(peliculals[0], "se está dando a las", horarios[0])
print(peliculals[1], "se está dando a las", horarios[1])
print(peliculals[2], "se está dando a las", horarios[2])


#Crea una lista llamada lista_de_compras con al menos cinco ítems que necesites comprar.
lista_de_compras = ["leche", "pan", "huevos", "queso", "jamon"]
#imprime los ítems en tu lista uno por uno.
for i in range(len(lista_de_compras)):
    print(lista_de_compras[i]) 
#Recuerda que comiste pastel en casa de un amigo y te gustó. Agrega "pastel" a tu lista_de_compras.
lista_de_compras.append("pastel")
for i in range(len(lista_de_compras)):
    print(lista_de_compras[i]) 

#Crea un diccionario llamado contactos con al menos tres de tus amigos. Las llaves o claves deben ser sus nombres y los valores sus números de teléfono.
contactos = {"Juan": "12345678", "Pedro": "87654321", "Maria": "45678912"}  
#Imprime el número de teléfono de uno de tus amigos buscando en el diccionario por su nombre.
print(contactos["Juan"])
#Te das cuenta de que uno de tus amigos cambió de número. Actualiza su número en el diccionario.
contactos["Juan"] = "12345679"
#Imprime el diccionario actualizado.
print(contactos)
