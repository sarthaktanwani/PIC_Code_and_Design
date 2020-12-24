//#define EN1 PORTC.RC0
//#define EN2 PORTC.RC1
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
                                                                // EN1=0;
                                                                 //EN2=1;
                                                                 PORTC=0X02;
                                                                 PORTB=arr[i];
                                                                 Delay_ms(5);
                                                                 PORTC=0X01;
                                                                 //EN1=1;
                                                                 //EN2=0;
                                                                 PORTB=arr[j];
                                                                 Delay_ms(5);
                                               }
                              }
             }
     }
}