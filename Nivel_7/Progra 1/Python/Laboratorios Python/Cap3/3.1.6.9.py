miLista = [1, 2, 4, 4, 1, 4, 2, 6, 2, 9]
#
# coloca tu código aquí
#

result = []
for item in miLista:
    if item not in result:
        result.append(item)
        

print("La lista solo con elementos únicos:")
print(result)
