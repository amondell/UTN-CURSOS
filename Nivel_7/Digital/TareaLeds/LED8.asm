;AUTOR          :IVAN SANCHEZ ANGIE MARCHENA MONDELL
;FECHA          :17-03-21
;Version 		:MPLAB IDE v8.91
;Titulo			:LED
;Descripcion	:SECUENCIA DE LEDS

list p=16f628a
include <P16F628A.INC>


;asignación de registros

status 	equ 03h
portb	equ 06h
trisb	equ 86h
conta1	equ 20h
conta2	equ 21h
conta3	equ 22h

reset	org 0
		goto inicio
		org 05

retardo:

		movlw	D'48' 
		movwf	conta3
		movlw	D'49'
		movwf	conta2
		movlw	D'50'
		movwf	conta1
		decfsz	conta1
		goto	$-1
		movlw	D'50'
		movwf	conta1
		decfsz	conta2
		goto	$-5
		movlw	D'49'
		movwf	conta2
		decfsz	conta3
		goto 	$-9


return

inicio	bsf		status,5 
		movlw 	00h     ;cargara el registro con el movlw
		movwf 	trisb	;se selecciona como puerto RB
		bcf		status,5 
		
		clrf portb
		bsf portb,7		 
		call retardo	;retardo de subrutina 1s
		bcf portb,7
		call retardo	;retardo de subrutina 1s
		bsf portb,6
		call retardo	;retardo de subrutina 1s
		bcf portb,6
		call retardo	;retardo de subrutina 1s		
		bsf portb,5	
		call retardo	;retardo de subrutina 1s
		bcf portb,5
		call retardo	;retardo de subrutina 1s
		bsf portb,4	
		call retardo 	;retardo de subrutina 1s	
		bcf portb,4
		call retardo	;retardo de subrutina 1s
		bsf portb,3	
		call retardo	;retardo de subrutina 1s
		bcf portb,3
		call retardo	;retardo de subrutina 1s
		bsf portb,2
		call retardo	;retardo de subrutina 1s
		bcf portb,2
		call retardo	;retardo de subrutina 1s
		bsf portb,1	
		call retardo	;retardo de subrutina 1s
		bcf portb,1
		call retardo	;retardo de subrutina 1s
		bsf portb,0	
		call retardo	;retardo de subrutina 1s
		bcf portb,0
		call retardo	;retardo de subrutina 1s
		bsf portb,1	
		call retardo	;retardo de subrutina 1s
		bcf portb,1
		call retardo	;retardo de subrutina 1s
		bsf portb,2
		call retardo	;retardo de subrutina 1s
		bcf portb,2
		call retardo	;retardo de subrutina 1s
		bsf portb,3	
		call retardo	;retardo de subrutina 1s
		bcf portb,3
		call retardo	;retardo de subrutina 1s
		bsf portb,4	
		call retardo	;retardo de subrutina 1s
		bcf portb,4
		call retardo	;retardo de subrutina 1s
		bsf portb,5	
		call retardo	;retardo de subrutina 1s
		bcf portb,5
		call retardo	;retardo de subrutina 1s
		bsf portb,6
		call retardo	;retardo de subrutina 1s
		bcf portb,6
		call retardo	;retardo de subrutina 1s

		end

