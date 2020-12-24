#line 1 "C:/Users/PARTH/Desktop/PIC Code and Design/SWITCH/Switch.c"


void main() {
 TRISB.RB0=1;
 TRISB.RB7=0;
 while(1)
 {
 if( PORTB.RB0 ==1)
 {
  PORTB.RB7 =1;
 Delay_ms(100);
 }
 else
 {  PORTB.RB7 =0;

 }
 }
}
