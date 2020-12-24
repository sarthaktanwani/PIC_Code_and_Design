#line 1 "C:/Users/PARTH/Desktop/Embedded Systems/PIC Code and Design/test/test.c"
unsigned char arr[]={0x3f,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6f};
int i,j;
void main() {
TRISB=TRISC=TRISD=0x00;
PORTC=0;
for(i=0;i<10;i++)
{
 PORTD=arr[i];



 if(i==1)
 PORTC=0x01;
 else
 PORTC=(PORTC<<1)+1;

 for(j=0;j<10;j++)
 {
 PORTB=arr[j];
 Delay_ms(100);
 }

}
}
