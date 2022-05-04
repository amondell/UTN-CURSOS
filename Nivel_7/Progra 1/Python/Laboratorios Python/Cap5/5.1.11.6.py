﻿shift = int(input("Ingrese numero para codificar 1- 25"))

text = input("Ingrese texto a codificar")

encryption = ""

for c in text:

    # check if character is an uppercase letter
    if c.isupper():

        # find the position in 0-25
        c_unicode = ord(c)

        c_index = ord(c) - ord("A")

        # perform the shift
        new_index = (c_index + shift) % 26

        # convert to new character
        new_unicode = new_index + ord("A")

        new_character = chr(new_unicode)

        # append to encrypted string
        encryption = encryption + new_character

    else:

        # since character is not uppercase, leave it as it is
        encryption += c
        
print("Texto:",text)

print("Encrypted:",encryption)