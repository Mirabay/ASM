;
; SegunderoASM.asm
;
; Created: 6/8/2023 9:53:17 AM
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
	RCALL Delay1Seg
	SBIC PINC,0		;Si esta en 1 le hace un skip a la siguiente linea
	INC R16
	CPI R16,10
	BRNE Ciclo
	CLR R16
	RJMP Ciclo


Delay1Seg:
	Rcall DelaymedioSeg
	Rcall DelaymedioSeg
	RET

DelayMedioSeg:
	LDI ZH, high(49948);1u
	LDI ZL, low(49948);1u
CicloDelay:
	SBIW ZH:ZL, 1;2u  //cada que pasa por allí se resta uno a z
	NOP;1u
	NOP;1u
	NOP;1u
	NOP;1u
	NOP;1u
	CPI ZH, 0x00;1u
	BRNE CicloDelay;2u si brinca y 1u si no brinca
	CPI ZL, 0x00;1u
	BRNE CicloDelay;2u o 1u
	RET;4u
Tabla:
	.db 0xFC,0x60,0xDB,0xF3,0x66,0xB7,0xBE,0xE1,0xFE,0xF6,0xEE,0x3F,0x9C,0x7B,0x9E,0x8E
