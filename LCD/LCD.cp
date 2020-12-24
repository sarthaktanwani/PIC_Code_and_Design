#line 1 "C:/Users/PARTH/Desktop/LCD/LCD.c"



void LCD_Data(unsigned char b)
{
  PORTB =b;
  PORTc.RC0 =1;
  PORTC.RC1 =1;
 Delay_ms(4);
  PORTC.RC1 =0;
}
void LCDcmd(unsigned char a)
{
  PORTB =a;
  PORTc.RC0 =0;
  PORTC.RC1 =1;
 Delay_ms(4);
  PORTC.RC1 =0;
}
void main() {
 while(1)
 {
 TRISB=TRISC=0x00;
 LCDcmd(0x38);
 LCDcmd(0x0E);
 LCDcmd(0x06);
 LCDcmd(0x01);
 LCDcmd(0x80);
 LCD_Data('D');
 LCD_Data('U');
 }
}
