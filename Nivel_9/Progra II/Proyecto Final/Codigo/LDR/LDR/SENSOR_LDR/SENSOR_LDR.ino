const long LDR_A = 1000;     //Resistencia en oscuridad en KΩ
const int LDR_B = 15;        //Resistencia a la luz (10 Lux) en KΩ
const int LDR_Rc = 10;       //Resistencia calibracion en KΩ
const int LDRPin = A0;   //Pin del LDR

int LDR_V;
int LDR_ilum;

#include <cpu.h>
//#include "core.h"

void setup() 
{
   Serial.begin(9600);
}

void loop()
{
   LDR_V = analogRead(LDRPin);         

   //LDR_ilum = ((long)(1024-V)*A*10)/((long)B*Rc*V);  //usar si LDR entre GND y A0 
   LDR_ilum = ((long)LDR_V*LDR_A*10)/((long)LDR_B*LDR_Rc*(1024-LDR_V));    //usar si LDR entre A0 y Vcc
  
   Serial.println(LDR_ilum);   
   delay(1000);
}
