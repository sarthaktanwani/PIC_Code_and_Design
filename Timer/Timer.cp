#line 1 "C:/Users/PARTH/Desktop/Embedded Systems/PIC Code and Design/Timer/Timer.c"
void T0Delay(void);
void main() {
 TRISB=0;
 while(1)
 {
 PORTB=0X55;
 T0Delay();
 Delay_ms(250);
 PORTB=0XAA;
 T0Delay();
 Delay_ms(250);
 }
} aeg

void T0Delay()
{
 T0CON=0X08;
 TMR0H=0X35;
 TMR0L=0X00;
 T0CON.TMR0ON=1;
 while(INTCON.TMR0IF==0);
 T0CON.TMR0ON=0;
 INTCON.TMR0IF=0;
}
