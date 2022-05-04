def readint(prompt, min, max):
#
# tu codigo aqui
#
    if prompt > max or prompt < min:
        print("Error: el valor no está dentro del rango permitido (min..max)")
        return -1
    if type(prompt) != int:
        print("Error: entrada incorrecta")
    else:
        return prompt
        
v = readint(-66, -10, 10)

if v ==-1:
    print(" ")
else:
    print("El numero es:", v)