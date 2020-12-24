#define RS PORTC.RC0
#define EN PORTC.RC1
#define LCD PORTB
void LCD_Data(unsigned int i)
{    
     LCD = i;
     RS=1;
     EN=1;
     Delay_ms(5);
     EN=0;
     Delay_ms(100);
}
/*void LCD_str(unsigned char* b)
{    
     while(*b!='\0')
     {
     LCD_Data(*b++);
     }
}*/
void LCD_cmmd(unsigned char a)
{
     LCD=a;
     RS=0;
     EN=1;
     Delay_ms(5);
     EN=0;
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
            // LCD_init();
     }
}