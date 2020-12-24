
/*void SerTx(unsigned char c)
{    TXREG=c;
     while(PIR1.TXIF==0);
     
} 
void main() {
     TXSTA=0X20;
     SPBRG=12;
     TXSTA.TXEN=1;
     RCSTA.SPEN=1;
     while(1)
     {              
             SerTx('Y');
             Delay_ms(10);
             SerTx('E');  
             Delay_ms(10);
             SerTx('S');
             Delay_ms(10);
     }
}   
 */




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
     //TRISB=0XFE;
     UART_init();
     while(1)
     {       
             send_byte(a);
             Delay_ms(100);
             a++;
             if(a>'Z')
             a='A';
             //send_str("Welcome");
     }
}
void send_byte(unsigned char a)
{    
     while(PIR1.TXIF==0);
     TXREG=a;
     //TXREG=' ';
}