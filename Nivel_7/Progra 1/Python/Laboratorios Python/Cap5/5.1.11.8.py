def anagramaSolucion2(cadena1,cadena2):
    cadena1 = cadena1.lower()
    cadena2 = cadena2.lower()
    
    unaLista1 = list(cadena1)
    unaLista2 = list(cadena2)

    unaLista1.sort()
    unaLista2.sort()

    pos = 0
    coincide = "Anagramas"

    while pos < len(cadena1) and coincide:
        if unaLista1[pos]==unaLista2[pos]:
            pos = pos + 1
        else:
            coincide = "No son Anagramas"

    return coincide

print(anagramaSolucion2('Listen','Silent'))