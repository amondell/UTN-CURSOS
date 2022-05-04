problema = "295743861" \
           "431865927" \
           "876192543" \
           "387459216" \
           "612387495" \
           "549216738" \
           "763524189" \
           "928671354" \
           "154938672"


def str_sudoku(problema):

    matriz = []
    for fila in range(9):
        matriz.append(list(problema[fila * 9: (fila + 1) * 9]))
    return matriz


def print_sudoku(sudoku):

    for fila in sudoku:
        for columna in fila:
            print(columna, end=" ")
        print()
    print()


def revisar9(lista):

    return len(set(lista)) == 9


def extraer_caja(sudoku, numero):

    lista = []
    #   Calcular la fila y columna de la esquina
    #   superior izquierda de la caja.
    fila = 3 * (numero // 3)
    columna = 3 * (numero % 3)
    #   Extraer los 9 digitos de la caja y
    #   ponerlos en una lista.
    for row in range(fila, fila + 3):
        lista.extend(sudoku[row][columna:columna + 3])
    return lista


def revisar(sudoku):

    #   Revisar por filas.
    for fila in sudoku:
        if not revisar9(fila):
            return False
    #   Revisar por columnas
    for columna in range(9):
        col = []
        #   Reunir los digitos en la columna
        for fila in range(9):
            col.append(sudoku[fila][columna])
        #   Revisar los digitos.
        if not revisar9(col):
            return False
    #   Revisar por cajas
    for caja in range(9):
        #   Extraer los digitos de la caja
        box = extraer_caja(sudoku, caja)
        #   Revisar los digitos.
        if not revisar9(box):
            return False
    #   A estas alturas, la solución es correcta.
    return True


sudoku = str_sudoku(problema)
print_sudoku(sudoku)

if (revisar(sudoku)):
    print("Si")
else:
    print("No")