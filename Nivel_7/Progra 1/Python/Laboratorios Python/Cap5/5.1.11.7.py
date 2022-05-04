
texto = input("Ingrese una  palabra: ")

igual, aux = 0, 0

for ind in reversed(range(0, len(texto))):
  if texto[ind].lower() == texto[aux].lower():
    igual += 1
  aux += 1
if len(texto) == igual:
  print("Es un palíndromo")
else:
  print("No es un palíndromo")