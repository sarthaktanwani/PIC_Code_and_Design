#line 1 "C:/Users/PARTH/Desktop/PIC Code and Design/Serial/Receiver/Receiver.c"



void LCD_Data(unsigned int i)
{
  PORTB  = i;
  PORTC.RC0 =1;
  PORTC.RC1 =1;
 Delay_ms(5);
  PORTC.RC1 =0;
 Delay_ms(100);
}
#line 20 "C:/Users/PARTH/Desktop/PIC Code and Design/Serial/Receiver/Receiver.c"
void LCD_cmmd(unsigned char a)
{
  PORTB =a;
  PORTC.RC0 =0;
  PORTC.RC1 =1;
 Delay_ms(5);
  PORTC.RC1 =0;
}
void LCD_init()
{
 LCD_cmmd(0X38);
 LCD_cmmd(0X0E);
 LCD_cmmd(0X06);
 LCD_cmmd(0X01);
 LCD_cmmd(0X80);

}
void main() {
 TRISB=TRISC=0;
 TRISC.RC7=1;
 LCD_init();
 LCD_Data('A');
 Delay_ms(100);
 RCSTA=0X90;
 SPBRG=15;
 Delay_ms(100);
 while(1)
 {
 while(PIR1.RCIF==0);
 PORTB=RCREG;
 LCD_Data(PORTB);
 Delay_ms(100);

 }
}
