
const long LDR_A = 1000;     //Resistencia en oscuridad en KΩ
const int LDR_B = 15;        //Resistencia a la luz (10 Lux) en KΩ
const int LDR_Rc = 10;       //Resistencia calibracion en KΩ
const int LDRPin = A1;   //Pin del LDR

int LDR_V;
int LDR_ilum;

float ANPin= A2;
float AN_V;
float AN_vel;

void setup() 
{
   Serial.begin(9600);
}

void loop()
{
   LDR_V = analogRead(LDRPin);         

   //LDR_ilum = ((long)(1024-V)*A*10)/((long)B*Rc*V);  //usar si LDR entre GND y A0 
      LDR_ilum = ((long)LDR_V*LDR_A*10)/((long)LDR_B*LDR_Rc*(1024-LDR_V));    //usar si LDR entre A0 y Vcc
  
    
    //delay(10);

      AN_V = analogRead(ANPin);  
      AN_vel= (AN_V*0.196); 
      delay(500);
   
      Serial.print("velocidad = ");
      Serial.print(AN_vel);
      Serial.println(" Km/h");
      Serial.print("Luminocidad = ");
      Serial.print(LDR_ilum);  
      Serial.println(" lx");
      
}
