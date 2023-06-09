;
; Retardo0.5seg.asm
;
; Created: 6/7/2023 8:46:17 AM
; Author : Antonio Miranda
;

Inicio:
		;PB0 de salida
SBI DDRB,0 ; == DDRB.0=1
//CBI DDRB,0 ; ==	DDRB.0=0
// Funciona con PORTx tambien
Ciclo:
SBI PORTB,0
RCALL DelayMedioSeg ;3u
CBI PORTB,0
RCALL DelayMedioSeg
RJMP Ciclo

DelayMedioSeg:
LDI ZH,high(34974)	; 1u
LDI ZL,low(34974)	; 1u
CicloDelay:
SBIW ZH:ZL,1		;Z- ; 2u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
CPI ZH,0x00		; 1u
BRNE CicloDelay	; 1u No brinca /2u Si brinca
CPI ZL,0x00		; 1u
BRNE CicloDelay	; 1u No brinca /2u Si brinca
RET				; 4u
/*Inicio:
		;PB0 de salida
SBI DDRB,0 ; == DDRB.0=1
//CBI DDRB,0 ; ==	DDRB.0=0
// Funciona con PORTx tambien
Ciclo:
SBI PORTB,0
RCALL DelayMedioSeg ;3u
CBI PORTB,0
RCALL DelayMedioSeg
RJMP Ciclo

DelayMedioSeg:
LDI ZH,high(49948)	; 1u
LDI ZL,low(49948)	; 1u
CicloDelay:
SBIW ZH:ZL,1		;Z- ; 2u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
NOP				; 1u
CPI ZH,0x00		; 1u
BRNE CicloDelay	; 1u No brinca /2u Si brinca
CPI ZL,0x00		; 1u
BRNE CicloDelay	; 1u No brinca /2u Si brinca
RET				; 4u*/