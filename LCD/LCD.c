#define RS PORTc.RC0
#define EN PORTC.RC1
#define LCD PORTB
void LCD_Data(unsigned char b)
{
     LCD=b;
     RS=1;
     EN=1;
     Delay_ms(4);
     EN=0;
}
void LCDcmd(unsigned char a)
{
     LCD=a;
     RS=0;
     EN=1;
     Delay_ms(4);
     EN=0;
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