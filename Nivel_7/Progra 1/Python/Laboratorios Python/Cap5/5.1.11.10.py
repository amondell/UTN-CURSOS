c1 = "donut"
c2 = "Nabucodonosut"
compare = ""
for i in c1:
    for j in c2:
        if i==j:
            compare +=j

result = ""
for item in compare:
    if item not in result:
        result+=item

if c1 == result:
    print("Si")
else:
    print("No")