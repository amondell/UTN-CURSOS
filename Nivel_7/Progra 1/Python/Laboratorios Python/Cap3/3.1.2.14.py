bloques = int(input("Ingrese el número de bloques:"))

#
# Escribe tu código aquí.
#
altura = 0
fila = 1

while fila <= bloques:
    bloques -=fila
    altura +=1
    fila +=1

print("La altura de la pirámide:", altura)