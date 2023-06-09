;
; DecoderV2.asm
;
; Created: 6/8/2023 8:57:34 AM
; Author : Usuario
;


Inicio:
	LDI R16,0x0F
	OUT PORTC,R16	;Pull-ups en PC0 a PC03
	LDI R16,0xFF
	OUT DDRD,R16	;Salidas en PD0 a PD7
Ciclo:
	IN R16,PINC
	ANDI R16,0x0F
	//Cargamos en Z el primer elemento de la tabla
	LDI ZH,high(Tabla*2)
	LDI ZL,low(Tabla*2)
	ADD ZL,R16		;ZL=ZL+R16
	CLR R1			;R1=0
	ADC ZH,R1		;ZH=ZH+C+0
	LPM				;	R0 <-(Z)8bits
	OUT PORTD,R0	;Sale el valor de R0
	RJMP Ciclo
Tabla:
	.db 0xFC,0x60,0xDB,0xF3,0x66,0xB7,0xBE,0xE1,0xFE,0xF6,0xEE,0x3F,0x9C,0x7B,0x9E,0x8E
