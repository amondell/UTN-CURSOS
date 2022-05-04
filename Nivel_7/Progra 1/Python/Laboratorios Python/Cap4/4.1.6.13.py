def DisplayBoard(board):
#
# la función acepta un parámetro el cual contiene el estado actual del tablero
# y lo muestra en la consola
#
	print("+-------+-------+-------+")
	print("|       |       |       |")
	print("| ",board[0][0],"   |  ",board[0][1],"  |   ",board[0][2]," |")
	print("|       |       |       |")
	print("+-------+-------+-------+")
	print("|       |       |       |")
	print("| ",board[1][0],"   |  ",board[1][1],"  |   ",board[1][2]," |")
	print("|       |       |       |")
	print("+-------+-------+-------+")
	print("|       |       |       |")
	print("| ",board[2][0],"   |  ",board[2][1],"  |   ",board[2][2]," |")
	print("|       |       |       |")
	print("+-------+-------+-------+")




def MakeListOfFreeFields(board, num):

	i=0
	j=0
	while i<3:
		while j<3:
			if board[i][j] == num:
				return True
			j+=1
		i+=1
		j=0
	return False

def VictoryFor(board, j):

	#compara las filas del tablero
	if board[0] == [j,j,j] or board[1] == [j,j,j] or board[2] == [j,j,j]:
		return True
	#compara las columnas
	elif board[0][0] == j and board[1][0] == j and board[2][0] == j:
		return True
	elif board[0][1] == j and board[1][1] == j and board[2][1] == j:
		return True
	elif board[0][2] == j and board[1][2] == j and board[2][2] == j:
		return True
	#compara las diagonales
	elif board[0][0] == j and board[1][1] == j and board[2][2] == j:
		return True
	elif board[0][2] == j and board[1][1] == j and board[2][0] == j:
		return True
	return False

def DrawMove(board, num, value):

	i=0
	j=0
	while i<3:
		while j<3:
			if board[i][j] == num:
				board[i][j] = value
			j+=1
		i+=1
		j=0
	return board

def EnterMove(board,turno ,state = 1):

	if state == 1:
		DisplayBoard(board)
		num = int(input("Ingrese tu movimiento: "))

	if (state == 0):
		print("Valor incorrecto u ocupado")
		num = int(input("Ingrese tu movimiento: "))

	if (MakeListOfFreeFields(board, num) == False or num>9):
		return EnterMove(board,turno ,0)

	if turno%2 == 0:
		DrawMove(board, num, "X")
		if VictoryFor(board, "X") == True:
			DisplayBoard(board)
			print("Gano el jugador X")
			return 0

	if turno%2 != 0:
		DrawMove(board, num, "O")
		if VictoryFor(board, "O") == True:
			DisplayBoard(board)
			print("Gano el jugador O")
			return 0
	
	return EnterMove(board,turno+1 ,1)


turno = 0
board = [[1,2,3],[4,5,6],[7,8,9]]



EnterMove(board,turno)