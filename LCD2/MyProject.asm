
_LCD_Data:

	MOVF        FARG_LCD_Data_b+0, 0 
	MOVWF       PORTC+0 
	BSF         PORTB+0, 0 
	BSF         PORTB+0, 1 
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
	BCF         PORTB+0, 1 
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

_LCD_str:

L_LCD_str2:
	MOVFF       FARG_LCD_str_b+0, FSR0
	MOVFF       FARG_LCD_str_b+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_LCD_str3
	MOVFF       FARG_LCD_str_b+0, FSR0
	MOVFF       FARG_LCD_str_b+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
	INFSNZ      FARG_LCD_str_b+0, 1 
	INCF        FARG_LCD_str_b+1, 1 
	GOTO        L_LCD_str2
L_LCD_str3:
L_end_LCD_str:
	RETURN      0
; end of _LCD_str

_LCD_cmmd:

	MOVF        FARG_LCD_cmmd_a+0, 0 
	MOVWF       PORTC+0 
	BCF         PORTB+0, 0 
	BSF         PORTB+0, 1 
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_LCD_cmmd4:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_cmmd4
	DECFSZ      R12, 1, 1
	BRA         L_LCD_cmmd4
	NOP
	NOP
	BCF         PORTB+0, 1 
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

	MOVLW       67
	MOVWF       main_b_L0+0 
	MOVLW       111
	MOVWF       main_b_L0+1 
	MOVLW       111
	MOVWF       main_b_L0+2 
	MOVLW       108
	MOVWF       main_b_L0+3 
	MOVLW       33
	MOVWF       main_b_L0+4 
	CLRF        main_b_L0+5 
	CLRF        TRISC+0 
	MOVF        TRISC+0, 0 
	MOVWF       TRISB+0 
L_main5:
	CLRF        TRISE+0 
	MOVF        TRISE+0, 0 
	MOVWF       TRISC+0 
	CALL        _LCD_init+0, 0
	MOVLW       main_b_L0+0
	MOVWF       FARG_LCD_str_b+0 
	MOVLW       hi_addr(main_b_L0+0)
	MOVWF       FARG_LCD_str_b+1 
	CALL        _LCD_str+0, 0
	CALL        _LCD_init+0, 0
	MOVLW       65
	MOVWF       ?lstr1_MyProject+0 
	MOVLW       119
	MOVWF       ?lstr1_MyProject+1 
	MOVLW       101
	MOVWF       ?lstr1_MyProject+2 
	MOVLW       115
	MOVWF       ?lstr1_MyProject+3 
	MOVLW       111
	MOVWF       ?lstr1_MyProject+4 
	MOVLW       109
	MOVWF       ?lstr1_MyProject+5 
	MOVLW       101
	MOVWF       ?lstr1_MyProject+6 
	MOVLW       33
	MOVWF       ?lstr1_MyProject+7 
	CLRF        ?lstr1_MyProject+8 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_LCD_str_b+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_LCD_str_b+1 
	CALL        _LCD_str+0, 0
	CALL        _LCD_init+0, 0
	MOVLW       83
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
	MOVLW       65
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
	MOVLW       82
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
	MOVLW       84
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
	MOVLW       72
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
	MOVLW       65
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
	MOVLW       75
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
	GOTO        L_main5
L_end_main:
	GOTO        $+0
; end of _main
