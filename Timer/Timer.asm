
_main:

	CLRF        TRISB+0 
L_main0:
	MOVLW       85
	MOVWF       PORTB+0 
	CALL        _T0Delay+0, 0
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
	MOVLW       170
	MOVWF       PORTB+0 
	CALL        _T0Delay+0, 0
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main

_T0Delay:

	MOVLW       8
	MOVWF       T0CON+0 
	MOVLW       53
	MOVWF       TMR0H+0 
	CLRF        TMR0L+0 
	BSF         T0CON+0, 7 
L_T0Delay4:
	BTFSC       INTCON+0, 2 
	GOTO        L_T0Delay5
	GOTO        L_T0Delay4
L_T0Delay5:
	BCF         T0CON+0, 7 
	BCF         INTCON+0, 2 
L_end_T0Delay:
	RETURN      0
; end of _T0Delay
