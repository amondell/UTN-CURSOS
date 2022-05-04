palabra = "cBabAa"

palabra = palabra.lower()

palabra = ''.join(palabra)

freq = {} 
  
for i in palabra: 
    if i in freq: 
        freq[i] += 1
    else: 
        freq[i] = 1



for clave in freq:

    print(clave,"->", freq[clave] )