
_main:

	BSF         TRISB+0, 0 
	BCF         TRISB+0, 7 
L_main0:
	BTFSS       PORTB+0, 0 
	GOTO        L_main2
	BSF         PORTB+0, 7 
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	GOTO        L_main4
L_main2:
	BCF         PORTB+0, 7 
L_main4:
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main
