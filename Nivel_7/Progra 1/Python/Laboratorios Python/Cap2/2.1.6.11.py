hora = int(input("Hora de inicio (horas): "))
min = int(input("Minuto de inicio (minutos): "))
dura = int(input("Duración del evento (minutos): "))

# coloca tu código aqui

result = dura + min

while (result >=60):
    hora+=1
    result-=60

print(hora,":",result)