def misplit(strng):
#
# coloca tu código aquí
#
    result = []
    strn = ""
    for i in strng:
        if i == " ":
            result+=[strn]
            strn = ""
        else:
            strn+=i
    return result 
print(misplit("Ser o no ser, esa es la pregunta"))
print(misplit("Ser o no ser,esa es la pregunta"))
print(misplit("   "))
print(misplit(" abc "))
print(misplit(""))