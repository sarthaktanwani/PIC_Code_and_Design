
_main:

	CLRF        TRISD+0 
	MOVF        TRISD+0, 0 
	MOVWF       TRISC+0 
	MOVF        TRISC+0, 0 
	MOVWF       TRISB+0 
	CLRF        PORTC+0 
	CLRF        _i+0 
	CLRF        _i+1 
L_main0:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVLW       10
	SUBWF       _i+0, 0 
L__main10:
	BTFSC       STATUS+0, 0 
	GOTO        L_main1
	MOVLW       _arr+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_arr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVLW       1
	XORWF       _i+0, 0 
L__main11:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	MOVLW       1
	MOVWF       PORTC+0 
	GOTO        L_main4
L_main3:
	MOVF        PORTC+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDLW       1
	MOVWF       PORTC+0 
L_main4:
	CLRF        _j+0 
	CLRF        _j+1 
L_main5:
	MOVLW       128
	XORWF       _j+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       10
	SUBWF       _j+0, 0 
L__main12:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
	MOVLW       _arr+0
	ADDWF       _j+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_arr+0)
	ADDWFC      _j+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
	INFSNZ      _j+0, 1 
	INCF        _j+1, 1 
	GOTO        L_main5
L_main6:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main0
L_main1:
L_end_main:
	GOTO        $+0
; end of _main
