#line 1 "C:/Users/PARTH/Desktop/PIC Code and Design/LCD2/MyProject.c"



void LCD_Data(unsigned char b)
{
  PORTC =b;
  PORTB.RB0 =1;
  PORTB.RB1 =1;
 Delay_ms(5);
  PORTB.RB1 =0;
 Delay_ms(100);
}
void LCD_str(unsigned char* b)
{
 while(*b!='\0')
 {
 LCD_Data(*b++);
 }
}
void LCD_cmmd(unsigned char a)
{
  PORTC =a;
  PORTB.RB0 =0;
  PORTB.RB1 =1;
 Delay_ms(5);
  PORTB.RB1 =0;
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
unsigned char b[]="Cool!";
TRISB=TRISC=0;
while(1)
{
 TRISC=TRISE=0;
 LCD_init();
 LCD_str(b);
 LCD_init();
 LCD_str("Awesome!");
 LCD_init();
 LCD_Data('S');

 LCD_Data('A');
 LCD_Data('R');
 LCD_Data('T');
 LCD_Data('H');
 LCD_Data('A');
 LCD_Data('K');
}
}
