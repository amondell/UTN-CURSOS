﻿digit =[[
'###',
'# #',
'# #',
'# #',
'###',
],
[
'  #',
'  #',
'  #',
'  #',
'  #',
],
[
'###',
'  #',
'###',
'#  ',
'###',
],
[
'###',
'  #',
'###',
'  #',
'###',
],
[
'# #',
'# #',
'###',
'  #',
'  #',
],
[
'###',
'#  ',
'###',
'  #',
'###',
],
[
'###',
'#  ',
'###',
'# #',
'###',
],
[
'###',
'  #',
'  #',
'  #',
'  #',
],
[
'###',
'# #',
'###',
'# #',
'###',
],
[
'###',
'# #',
'###',
'  #',
'###',
]]
numero = (input("ingresa un numero:"))

for i in range(5):
  for cifra in numero:
    cifra= int(cifra)
    renglon = (digit[cifra][i])
    renglon += " "
    renglon += (digit[cifra][i])
    print(renglon)