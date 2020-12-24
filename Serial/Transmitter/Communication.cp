#line 1 "C:/Users/PARTH/Desktop/PIC Code and Design/Serial/Transmitter/Communication.c"
#line 27 "C:/Users/PARTH/Desktop/PIC Code and Design/Serial/Transmitter/Communication.c"
void UART_init()
{
 SPBRG=15;
 TXSTA=0X22;
 RCSTA=0X80;
}
char a='A';
void send_byte(unsigned char);
void main()
{

 UART_init();
 while(1)
 {
 send_byte(a);
 Delay_ms(100);
 a++;
 if(a>'Z')
 a='A';

 }
}
void send_byte(unsigned char a)
{
 while(PIR1.TXIF==0);
 TXREG=a;

}
