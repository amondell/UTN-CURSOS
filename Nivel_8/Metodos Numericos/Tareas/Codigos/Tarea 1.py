import math

def f(x):
    return x**2 + math.exp(x-1) - 1 

def biseccion(f,a,b,tol,iterM):
    #Esta función aproxima la solución de la ecuación f(x)=0, utilizando el método de la bisección
    #sintaxis biseccion(f,a,b,tol,iterMax)
    #Entradas:
        #Entra una funcion definida arriba, a su vez dos numeros a y b los cuales
        #seran los valores iniciales para comprobar el teorema de Bolzano
        
    #Salidas:
        #Muestra la ultima iteracion y su valor calculado
    sol=[]
    e = []
    #Teorema de Bolzano
    if(f(a)*f(b) > 0):
        print("No cumple con el teorema de Bolzano")
    else:
        k=0
        error=tol+1
        sol+=[a]

        while (k < iterM) and (error>tol):

            k+=1
            x=(b+a)/2

            error=abs((x-sol[-1])/abs(x))*100
            
            if(f(a)*f(x)<0):
                b=x
            else:
                a=x
                
            sol+=[x]
            e += [error]

    #El valor de la ultima iteracion se muestra
    print("x = ",x)
    print("k = " ,k)
    print("error = ",error)


biseccion(f,0.4,0.8,1,40)


