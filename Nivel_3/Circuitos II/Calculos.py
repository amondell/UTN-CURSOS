# -*- coding: utf-8 -*-
"""
Created on Sat Apr 11 15:01:08 2020

@author: Ema
"""



import numpy

#M =[[1, 2,78], [3, 4,2],[4,0,3]]

#print(numpy.linalg.det(M))

def mostrarMatriz(matriz,orden):
	for i in range(0,orden):
		linea = "| "
		for j in range(orden+1):
			linea +=  str(matriz[i][j])+" "
		linea += "| "
		print(linea)	
			
matriz = [[3,2,3,3], [1,3,1,-6], [5,1,3,12]]
#Orden de la matriz
orden=len(matriz) 
mostrarMatriz(matriz,orden);    
#Recorrer la matriz 
for j in range(0,orden+1):
	for i in range(0, orden):
		if i>j:
			#Divir los elementos de la matriz
			division=matriz[i][j]/matriz[j][j]
			for k in range(0, orden+1):
				#Obterner el nuevo valor para los elementos en la diagonal inferior
				matriz[i][k]=matriz[i][k]-division*matriz[j][k];
#Recorrer la matriz
x = [0,0,0]
for i in range(orden,0,-1):
	suma=0
	for j in range(i,orden):
		suma=suma+matriz[i-1][j]*x[j]
	#Obtener los valores de las variables
	x[i-1]=((matriz[i-1][orden]-suma)/matriz[i-1][i-1])	
#Mostrar los valores de las variables
for i in range(0,orden):
	print("x"+str(i)+" = "+str(x[i]))



