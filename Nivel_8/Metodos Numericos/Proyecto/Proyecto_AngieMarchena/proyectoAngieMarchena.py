#-------------------------------------------------------------------------------------------------
# Bilbiotecas utilizadas
import math
#-------------------------------------------------------------------------------------------------
# Funcion
#-------------------------------------------------------------------------------------------------
#Funcion a calcular sus raices
def f(x):
    return x**3 + x**2 + 6*x +55*math.cos(x) - 10*x*math.exp(0.2*x) - (x**2)*math.exp(-0.3*x)
#-------------------------------------------------------------------------------------------------
# Metodo utilizado
#-------------------------------------------------------------------------------------------------
#Metodo de la secante
def secante(f1,x0,x1,tol,iterM):
    e=[]
    sol=[]
    k=0
    error=tol+1
    
    while (k < iterM) and (error>tol):
        xk= x1-((x1-x0)/(f1(x1)-f1(x0)))*f1(x1)
        error=abs(f1(xk))
        k+=1
        x0=x1
        x1=xk
        e=e+[error]
        sol = sol + [xk]

    return [xk, k, error]
#-------------------------------------------------------------------------------------------------
# Valores iniciales
#-------------------------------------------------------------------------------------------------
#se define el vector con valores iniciales para todas las soluciones
vec = [[-2,-1],[1,2],[4,5],[17,18]]
#iteraciones maximas
iteraciones = 10
#toreancia
tolerancia = pow(10, -8)
#-------------------------------------------------------------------------------------------------
# Calculo
#-------------------------------------------------------------------------------------------------
#funcion que calcula todas las soluciones de la ecuacion
def soluciones(f,vector, tol, iterM):
    resultado = []
    for i in vector:
        valor = secante(f,i[0],i[1],tol,iterM)
        resultado += [valor[0]]
    print("Valores de las soluciones de la ecuacion")

    k=1
    for i in resultado:
        print(f'x{k} = {i}')
        k+=1
#-------------------------------------------------------------------------------------------------
# ejecucion de la funcion
#-------------------------------------------------------------------------------------------------
soluciones(f,vec, tolerancia, iteraciones)
#-------------------------------------------------------------------------------------------------