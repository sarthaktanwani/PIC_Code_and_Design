
_UART_init:

	MOVLW       15
	MOVWF       SPBRG+0 
	MOVLW       34
	MOVWF       TXSTA+0 
	MOVLW       128
	MOVWF       RCSTA+0 
L_end_UART_init:
	RETURN      0
; end of _UART_init

_main:

	CALL        _UART_init+0, 0
L_main0:
	MOVF        _a+0, 0 
	MOVWF       FARG_send_byte+0 
	CALL        _send_byte+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	INCF        _a+0, 1 
	MOVF        _a+0, 0 
	SUBLW       90
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
	MOVLW       65
	MOVWF       _a+0 
L_main3:
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main

_send_byte:

L_send_byte4:
	BTFSC       PIR1+0, 4 
	GOTO        L_send_byte5
	GOTO        L_send_byte4
L_send_byte5:
	MOVF        FARG_send_byte_a+0, 0 
	MOVWF       TXREG+0 
L_end_send_byte:
	RETURN      0
; end of _send_byte
