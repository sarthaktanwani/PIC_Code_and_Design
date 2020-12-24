#define sensor PORTB.RB0
#define output PORTB.RB7
void main() {
     TRISB.RB0=1;
     TRISB.RB7=0;
     while(1)
     {
                  if(sensor==1)
                  {
                               output=1;
                               Delay_ms(100);
                  }
                  else
                  {            output=0;
                               //Delay_ms(1000);
                  }
     }
}