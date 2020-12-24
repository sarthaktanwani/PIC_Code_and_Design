
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		while(1)
L_main0:
;MyProject.c,5 :: 		TRISB=TRISC=0;
	CLRF        TRISC+0 
	MOVF        TRISC+0, 0 
	MOVWF       TRISB+0 
;MyProject.c,6 :: 		for(i=0;i<10;i++)
	CLRF        R1 
	CLRF        R2 
L_main2:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	MOVLW       10
	SUBWF       R1, 0 
L__main7:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;MyProject.c,8 :: 		PORTB=i;
	MOVF        R1, 0 
	MOVWF       PORTB+0 
;MyProject.c,9 :: 		PORTC=i;
	MOVF        R1, 0 
	MOVWF       PORTC+0 
;MyProject.c,10 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;MyProject.c,6 :: 		for(i=0;i<10;i++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;MyProject.c,11 :: 		}
	GOTO        L_main2
L_main3:
;MyProject.c,12 :: 		}
	GOTO        L_main0
;MyProject.c,13 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
