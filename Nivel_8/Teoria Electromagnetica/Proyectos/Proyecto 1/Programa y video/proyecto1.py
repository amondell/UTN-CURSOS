
#Biblitecas utilizadas
import numpy as np #operaciones matematicas
import os          #interacciones con el sistema


#Vector A
vector1 = [2, 1, 3]
#Vector B 
vector2 = [1, -3, 2]

np_vec1 = np.array(vector1)
np_vec2 = np.array(vector2)



'''
Productos realizados usando NumPy

'''

def add(A, B):
    C = A+B
    return C

def sub(A, B):
    C = A-B
    return C

def prodPunto(A,B):
    C = np.dot(A, B, out=None)
    return C

def prodCruz(A,B):
    C = np.cross(A, B)
    C = [C[0], -1*C[1], C[2]]
    return C


'''
Transformacion a distintos tipos de coordenadas

'''
def cilindricas(A):
    r = np.sqrt(A[0]**2+A[1]**2)
    ang = np.arctan2(A[1],A[0])
    z = A[2]
    return [round(r,4),round(ang,4),round(z,4)]

def esfericas(A):
    r0 = np.sqrt(A[0]**2+A[1]**2)
    r = np.sqrt(A[0]**2+A[1]**2+A[2]**2)
    ang1 = np.arctan2(r0,A[2])
    ang2 = np.arctan2(A[1],A[0])
    return [round(r,4),round(ang1,4),round(ang2,4)]


'''
Productos realizados de manera manual

'''

def addM(A, B):
    C = [A[0]+B[0],A[1]+B[1],A[2]+B[2]]
    return C

def subM(A, B):
    C = [A[0]-B[0],A[1]-B[1],A[2]-B[2]]
    return C

def prodPuntoM(A,B):
    C = A[0]*B[0]+A[1]*B[1]+A[2]*B[2]
    return C

def prodCruzM(A,B):
    C = [A[1]*B[2]-A[2]*B[1],A[0]*B[2]-A[2]*B[0],A[0]*B[1]-A[1]*B[0]]
    return C

'''
Menus
'''

def menu1(vec1, vec2):
    os.system ("cls")
    print(" Vectores:", vec1, vec2 )
    print("1 - Coordenadas cartesianas")
    print("2 - Coordenadas Esfericas")
    print("3 - Coordenadas Cilindricas")
    print("4 - Voler al menu")
    select = input("Que resultados quiere observar? ")
    if select == "1":
        print("---Coordenadas cartesianas---")
        print(" Vectores:", vec1, vec2 )
        print(" ")
        print("Valores de las operaciones: ")
        print("A+B --------------------")
        print(add(vec1, vec2))
        print(" ")
        print("B-A --------------------")
        print(sub(vec2, vec1))
        print(" ")
        print("A*B --------------------")
        print(prodPunto(vec1, vec2))
        print(" ")
        print("AxB --------------------")
        print(prodCruz(vec1, vec2))
        input("ENTER para volver al menu de coordenadas. ")
        return menu1(vec1, vec2)

    if select == "2":
        print("---Coordenadas Esfericas---")
        print(" Vectores:", esfericas(vec1), esfericas(vec2))
        print(" ")
        print("Valores de las operaciones: ")
        print("A+B --------------------")
        print(esfericas(add(vec1, vec2)))
        print(" ")
        print("B-A --------------------")
        print(esfericas(sub(vec2, vec1)))
        print(" ")
        print("A*B --------------------")
        print(prodPunto(vec1, vec2))
        print(" ")
        print("AxB --------------------")
        print(esfericas(prodCruz(vec1, vec2)))
        input("ENTER para volver al menu de coordenadas. ")
        return menu1(vec1, vec2)

    if select == "3":
        print("---Coordenadas Cilindricas---")
        print(" Vectores:", cilindricas(vec1), cilindricas(vec2))
        print(" ")
        print("Valores de las operaciones: ")
        print("A+B --------------------")
        print(cilindricas(add(vec1, vec2)))
        print(" ")
        print("B-A --------------------")
        print(cilindricas(sub(vec2, vec1)))
        print(" ")
        print("A*B --------------------")
        print(prodPunto(vec1, vec2))
        print(" ")
        print("AxB --------------------")
        print(cilindricas(prodCruz(vec1, vec2)))
        input("ENTER para volver al menu de coordenadas. ")
        return menu1(vec1, vec2)

    if select == "4":
        return menu()

    else:
        print("Seleccion incorrecta")
        input("ENTER para volver a seleccionar")
        return menu1(vec1, vec2)



def menu():
    os.system ("cls")
    print("Vectores y Operaciones basicas")
    print("Vectores a utilizar de prueba:")
    print("A = (2, 1, 3), B = (1, -3, 2)")
    print("------------------------------")
    print("1 - Valores de prueba")
    print("2 - Valores definidos por el usuario")
    print("3 - Salir")
    select = input("Que desea? ")

    if select == "1":
        return menu1(np_vec1,np_vec2)

    if select == "2":
        print("Ingrese los valores de las componentes x, y, z separados por espacio")
        print("Ejemplo 2 3 6, donde 2 es la coordenada x, 3 en y, 6 en z")
        print("Ingrese vector A: ")
        x1, y1, z1 = map(str,input().split())

        if (x1.isdigit() == False) or (y1.isdigit() == False) or (z1.isdigit() == False):
            print("ERROR: Valor no numerico en algun valor")
            input("ENTER para volver al menu")
            return menu()

        print("Ingrese vector B: ")
        x2, y2, z2 = map(str,input().split())
        if (x2.isdigit() == False) or (y2.isdigit() == False) or (z2.isdigit() == False):
            print("ERROR: Valor no numerico en algun valor")
            input("ENTER para volver al menu")
            return menu()

        vecA=np.array([int(x1), int(y1), int(z1)])
        vecB=np.array([int(x2), int(y2), int(z2)])

        return menu1(vecA,vecB)

    if select == "3":
        print("Gracias!")
        input("ENTER para salir")
        return 0

    else:
        print("Seleccion incorrecta")
        input("ENTER para volver")
        return menu()

menu()



