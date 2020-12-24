
_main:

;7_Segment.c,5 :: 		void main() {
;7_Segment.c,6 :: 		TRISB=TRISC=0x00;
	CLRF        TRISC+0 
	MOVF        TRISC+0, 0 
	MOVWF       TRISB+0 
;7_Segment.c,7 :: 		while(1)
L_main0:
;7_Segment.c,9 :: 		for(i=0;i<=9;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main2:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _i+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVF        _i+0, 0 
	SUBLW       9
L__main14:
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;7_Segment.c,11 :: 		for(j=0;j<=9;j++)
	CLRF        _j+0 
	CLRF        _j+1 
L_main5:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _j+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main15
	MOVF        _j+0, 0 
	SUBLW       9
L__main15:
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
;7_Segment.c,13 :: 		for(k=0;k<100;k++)
	CLRF        _k+0 
	CLRF        _k+1 
L_main8:
	MOVLW       128
	XORWF       _k+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main16
	MOVLW       100
	SUBWF       _k+0, 0 
L__main16:
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;7_Segment.c,17 :: 		PORTC=0X02;
	MOVLW       2
	MOVWF       PORTC+0 
;7_Segment.c,18 :: 		PORTB=arr[i];
	MOVLW       _arr+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_arr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
;7_Segment.c,19 :: 		Delay_ms(5);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	NOP
	NOP
;7_Segment.c,20 :: 		PORTC=0X01;
	MOVLW       1
	MOVWF       PORTC+0 
;7_Segment.c,23 :: 		PORTB=arr[j];
	MOVLW       _arr+0
	ADDWF       _j+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_arr+0)
	ADDWFC      _j+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
;7_Segment.c,24 :: 		Delay_ms(5);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	NOP
	NOP
;7_Segment.c,13 :: 		for(k=0;k<100;k++)
	INFSNZ      _k+0, 1 
	INCF        _k+1, 1 
;7_Segment.c,25 :: 		}
	GOTO        L_main8
L_main9:
;7_Segment.c,11 :: 		for(j=0;j<=9;j++)
	INFSNZ      _j+0, 1 
	INCF        _j+1, 1 
;7_Segment.c,26 :: 		}
	GOTO        L_main5
L_main6:
;7_Segment.c,9 :: 		for(i=0;i<=9;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;7_Segment.c,27 :: 		}
	GOTO        L_main2
L_main3:
;7_Segment.c,28 :: 		}
	GOTO        L_main0
;7_Segment.c,29 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
