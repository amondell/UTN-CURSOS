import sympy
import matplotlib.pyplot as plt
import numpy as np  
from sympy import *

x = Symbol('x')

def lagrange(vx,vy):
    
#
#Entradas:
#
#Dos vectores vx y vy los cuales contienen los valores en x y en y del polinomio
#
#Salidas:
#
#Polinomio equivalente que pasa por los puntos
#

    n=len(vx)
    k=0
    total=0
    while k<n:
        total =total + vy[k]*L(vx,k)
        k+=1
    return total

def L(vecx,ind):
    resultado = 1
    for i in (range(ind)):
        resultado = resultado*(x-vecx[i])/(vecx[ind]-vecx[i])
    return resultado

print(lagrange([-2,0,1],[0,1,-1]))