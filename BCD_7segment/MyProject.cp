#line 1 "C:/Users/PARTH/Desktop/PIC Code and Design/BCD_7segment/MyProject.c"
void main() {
while(1)
{
int i;
TRISB=TRISC=0;
for(i=0;i<10;i++)
{
PORTB=i;
PORTC=i;
Delay_ms(100);
}
}
}
