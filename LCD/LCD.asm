
_LCD_Data:

;LCD.c,4 :: 		void LCD_Data(unsigned char b)
;LCD.c,6 :: 		LCD=b;
	MOVF        FARG_LCD_Data_b+0, 0 
	MOVWF       PORTB+0 
;LCD.c,7 :: 		RS=1;
	BSF         PORTC+0, 0 
;LCD.c,8 :: 		EN=1;
	BSF         PORTC+0, 1 
;LCD.c,9 :: 		Delay_ms(4);
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_LCD_Data0:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Data0
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Data0
	NOP
;LCD.c,10 :: 		EN=0;
	BCF         PORTC+0, 1 
;LCD.c,11 :: 		}
L_end_LCD_Data:
	RETURN      0
; end of _LCD_Data

_LCDcmd:

;LCD.c,12 :: 		void LCDcmd(unsigned char a)
;LCD.c,14 :: 		LCD=a;
	MOVF        FARG_LCDcmd_a+0, 0 
	MOVWF       PORTB+0 
;LCD.c,15 :: 		RS=0;
	BCF         PORTC+0, 0 
;LCD.c,16 :: 		EN=1;
	BSF         PORTC+0, 1 
;LCD.c,17 :: 		Delay_ms(4);
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_LCDcmd1:
	DECFSZ      R13, 1, 1
	BRA         L_LCDcmd1
	DECFSZ      R12, 1, 1
	BRA         L_LCDcmd1
	NOP
;LCD.c,18 :: 		EN=0;
	BCF         PORTC+0, 1 
;LCD.c,19 :: 		}
L_end_LCDcmd:
	RETURN      0
; end of _LCDcmd

_main:

;LCD.c,20 :: 		void main() {
;LCD.c,21 :: 		while(1)
L_main2:
;LCD.c,23 :: 		TRISB=TRISC=0x00;
	CLRF        TRISC+0 
	MOVF        TRISC+0, 0 
	MOVWF       TRISB+0 
;LCD.c,24 :: 		LCDcmd(0x38);
	MOVLW       56
	MOVWF       FARG_LCDcmd_a+0 
	CALL        _LCDcmd+0, 0
;LCD.c,25 :: 		LCDcmd(0x0E);
	MOVLW       14
	MOVWF       FARG_LCDcmd_a+0 
	CALL        _LCDcmd+0, 0
;LCD.c,26 :: 		LCDcmd(0x06);
	MOVLW       6
	MOVWF       FARG_LCDcmd_a+0 
	CALL        _LCDcmd+0, 0
;LCD.c,27 :: 		LCDcmd(0x01);
	MOVLW       1
	MOVWF       FARG_LCDcmd_a+0 
	CALL        _LCDcmd+0, 0
;LCD.c,28 :: 		LCDcmd(0x80);
	MOVLW       128
	MOVWF       FARG_LCDcmd_a+0 
	CALL        _LCDcmd+0, 0
;LCD.c,29 :: 		LCD_Data('D');
	MOVLW       68
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
;LCD.c,30 :: 		LCD_Data('U');
	MOVLW       85
	MOVWF       FARG_LCD_Data_b+0 
	CALL        _LCD_Data+0, 0
;LCD.c,31 :: 		}
	GOTO        L_main2
;LCD.c,32 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
