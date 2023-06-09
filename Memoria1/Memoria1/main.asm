;
; Memoria1.asm
;
; Created: 6/1/2023 9:24:48 AM
; Author : Usuario
;
//Codigo 3
Inicio:					;Version 2 de arriba hacia abajo
	LDI R16,0xFF
	LDI ZH,0x09
	LDI ZL,0x00
Ciclo:
	
	ST -Z,R16
	DEC R16				;Decrementa R16

	CPI ZH,0x01			;Compara el registro
	BRNE Ciclo			; Branch not equal, Si el resultado de la comparación es 
	CPI ZLx,0x00
	BRNE Ciclo
Fin:
	RJMP Fin 


//Codigo 2
/*Inicio:
	LDI R16,0x35
	LDI ZH,0x01
	LDI ZL,0x00
Ciclo:
	ST Z+,R16
	CPI ZH,0x02			;Compara el registro
	BRNE Ciclo			; Branch not equal, Si el resultado de la comparación es 
Fin:
	RJMP Fin 

*/

//Codigo 1
; Replace with your application code
/*Inicio:
	LDI R16,0x55
	LDI ZH,0x01
	LDI ZL,0x00
Ciclo:
	ST Z+,R16
	CPI ZH,0x09			;Compara el registro
	BRNE Ciclo			; Branch not equal, Si el resultado de la comparación es 
Fin:
	RJMP Fin 
*/