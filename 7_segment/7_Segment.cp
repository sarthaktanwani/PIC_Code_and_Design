#line 1 "C:/Users/PARTH/Desktop/PIC Code and Design/7_segment/7_Segment.c"


int i,j,k;
unsigned char arr[]={0x3f,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6f};
void main() {
 TRISB=TRISC=0x00;
 while(1)
 {
 for(i=0;i<=9;i++)
 {
 for(j=0;j<=9;j++)
 {
 for(k=0;k<100;k++)
 {


 PORTC=0X02;
 PORTB=arr[i];
 Delay_ms(5);
 PORTC=0X01;


 PORTB=arr[j];
 Delay_ms(5);
 }
 }
 }
 }
}
