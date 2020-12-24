
_LCD_Data:

	MOVF        FARG_LCD_Data_i+0, 0 
	MOVWF       PORTB+0 
	BSF         PORTC+0, 0 
	BSF         PORTC+0, 1 
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_LCD_Data0:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Data0
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Data0
	NOP
	NOP
	BCF         PORTC+0, 1 
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_LCD_Data1:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Data1
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Data1
	DECFSZ      R11, 1, 1
	BRA         L_LCD_Data1
	NOP
L_end_LCD_Data:
	RETURN      0
; end of _LCD_Data

_LCD_cmmd:

	MOVF        FARG_LCD_cmmd_a+0, 0 
	MOVWF       PORTB+0 
	BCF         PORTC+0, 0 
	BSF         PORTC+0, 1 
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_LCD_cmmd2:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_cmmd2
	DECFSZ      R12, 1, 1
	BRA         L_LCD_cmmd2
	NOP
	NOP
	BCF         PORTC+0, 1 
L_end_LCD_cmmd:
	RETURN      0
; end of _LCD_cmmd

_LCD_init:

	MOVLW       56
	MOVWF       FARG_LCD_cmmd_a+0 
	CALL        _LCD_cmmd+0, 0
	MOVLW       14
	MOVWF       FARG_LCD_cmmd_a+0 
	CALL        _LCD_cmmd+0, 0
	MOVLW       6
	MOVWF       FARG_LCD_cmmd_a+0 
	CALL        _LCD_cmmd+0, 0
	MOVLW       1
	MOVWF       FARG_LCD_cmmd_a+0 
	CALL        _LCD_cmmd+0, 0
	MOVLW       128
	MOVWF       FARG_LCD_cmmd_a+0 
	CALL        _LCD_cmmd+0, 0
L_end_LCD_init:
	RETURN      0
; end of _LCD_init

_main:

	CLRF        TRISC+0 
	MOVF        TRISC+0, 0 
	MOVWF       TRISB+0 
	BSF         TRISC+0, 7 
	CALL        _LCD_init+0, 0
	MOVLW       65
	MOVWF       FARG_LCD_Data_i+0 
	MOVLW       0
	MOVWF       FARG_LCD_Data_i+1 
	CALL        _LCD_Data+0, 0
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
	MOVLW       144
	MOVWF       RCSTA+0 
	MOVLW       15
	MOVWF       SPBRG+0 
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
L_main5:
L_main7:
	BTFSC       PIR1+0, 5 
	GOTO        L_main8
	GOTO        L_main7
L_main8:
	MOVF        RCREG+0, 0 
	MOVWF       PORTB+0 
	MOVF        PORTB+0, 0 
	MOVWF       FARG_LCD_Data_i+0 
	MOVLW       0
	MOVWF       FARG_LCD_Data_i+1 
	CALL        _LCD_Data+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	GOTO        L_main5
L_end_main:
	GOTO        $+0
; end of _main
