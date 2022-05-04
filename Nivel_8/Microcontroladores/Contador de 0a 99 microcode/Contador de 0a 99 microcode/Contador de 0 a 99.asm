
; PICBASIC PRO(TM) Compiler 2.50, (c) 1998, 2007 microEngineering Labs, Inc. All Rights Reserved.  
_USED			EQU	1

	INCLUDE	"C:\PBP\16F628A.INC"

RAM_START       		EQU	00020h
RAM_END         		EQU	0014Fh
RAM_BANKS       		EQU	00003h
BANK0_START     		EQU	00020h
BANK0_END       		EQU	0007Fh
BANK1_START     		EQU	000A0h
BANK1_END       		EQU	000EFh
BANK2_START     		EQU	00120h
BANK2_END       		EQU	0014Fh
EEPROM_START    		EQU	02100h
EEPROM_END      		EQU	0217Fh

R0              		EQU	RAM_START + 000h
R1              		EQU	RAM_START + 002h
R2              		EQU	RAM_START + 004h
R3              		EQU	RAM_START + 006h
R4              		EQU	RAM_START + 008h
R5              		EQU	RAM_START + 00Ah
R6              		EQU	RAM_START + 00Ch
R7              		EQU	RAM_START + 00Eh
R8              		EQU	RAM_START + 010h
FLAGS           		EQU	RAM_START + 012h
GOP             		EQU	RAM_START + 013h
RM1             		EQU	RAM_START + 014h
RM2             		EQU	RAM_START + 015h
RR1             		EQU	RAM_START + 016h
RR2             		EQU	RAM_START + 017h
_secuencia       		EQU	RAM_START + 018h
_num             		EQU	RAM_START + 022h
_num2            		EQU	RAM_START + 024h
_pausa           		EQU	RAM_START + 026h
T1              		EQU	RAM_START + 028h
_tiempo          		EQU	RAM_START + 02Ah
_x               		EQU	RAM_START + 02Ch
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTA
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISA
_numero          		EQU	 PORTB
#define _PORTA??0        	 PORTA, 000h
#define _PORTA??1        	 PORTA, 001h

; Constants.
_n0              		EQU	00040h
_n1              		EQU	00079h
_n2              		EQU	00024h
_n3              		EQU	00030h
_n4              		EQU	00019h
_n5              		EQU	00012h
_n6              		EQU	00002h
_n7              		EQU	00078h
_n8              		EQU	00000h
_n9              		EQU	00010h
	INCLUDE	"CONTAD~1.MAC"
	INCLUDE	"C:\PBP\PBPPIC14.LIB"

	MOVE?CB	000h, TRISB
	MOVE?CW	028h, _pausa
	MOVE?CB	000h, TRISA
	MOVE?CB	007h, CMCON
	MOVE?CB	000h, PORTA
	MOVE?CW	002h, _tiempo
	MOVE?CB	_n0, _secuencia
	MOVE?CB	_n1, _secuencia + 00001h
	MOVE?CB	_n2, _secuencia + 00002h
	MOVE?CB	_n3, _secuencia + 00003h
	MOVE?CB	_n4, _secuencia + 00004h
	MOVE?CB	_n5, _secuencia + 00005h
	MOVE?CB	_n6, _secuencia + 00006h
	MOVE?CB	_n7, _secuencia + 00007h
	MOVE?CB	_n8, _secuencia + 00008h
	MOVE?CB	_n9, _secuencia + 00009h

	LABEL?L	_ciclo	
	ADD?WCW	_num, 001h, _num
	CMPNE?WCL	_num, 00Ah, L00001
	MOVE?CW	000h, _num
	ADD?WCW	_num2, 001h, _num2
	LABEL?L	L00001	
	CMPNE?WCL	_num2, 00Ah, L00003
	MOVE?CW	000h, _num2
	LABEL?L	L00003	
	MOVE?CW	001h, _x
	LABEL?L	L00005	
	CMPGT?WWL	_x, _tiempo, L00006
	HIGH?T	_PORTA??0
	LOW?T	_PORTA??1
	AOUT?BWB	_secuencia, _num, _numero
	PAUSE?W	_pausa
	LOW?T	_PORTA??0
	HIGH?T	_PORTA??1
	AOUT?BWB	_secuencia, _num2, _numero
	PAUSE?W	_pausa
	NEXT?WCL	_x, 001h, L00005
	LABEL?L	L00006	
	GOTO?L	_ciclo

	END
