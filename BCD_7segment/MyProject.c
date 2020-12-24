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