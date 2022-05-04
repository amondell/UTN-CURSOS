#Angie Marchena Mondell - 604650904

import math

def f(x):
    return (math.sin(x))**(1/3)

def punto_fijo(f1,a,tol,iterM):
    #Esta función aproxima la solución de la ecuación f(x)=0, utilizando el método del punto fijo
    #sintaxis punto_fijo(f1,a,tol,iterM)
    #Entradas:
        #Entra una funcion definida arriba, a, el valor inicial, tolerancia e iteraciones maximas
        
    #Salidas:
        #Muestra la tabla de valores por iteracion
    x=a
    k=0
    sol = []
    error=tol+1
    while (k < iterM) and (error>tol):
        sol+=[x]
        x=f1(x)
        error = abs(f1(x)-x)
        k+=1
            
    #Tabla de iteraciones
    i=0
    print("i      X(i)")
    for j in sol:
        print(i, "     ", j)
        i+=1
punto_fijo(f,1,1e-8,7)