user = input("Le pregunta al usuario su cumpleaños (en el formato AAAAMMDD o AAAADMM o MMDDAAAA)")


while len(user)>=2:
    res = 0
    for i in user:
        res += int(i)
        
    user = str(res)

print(res)


