

float ANPin= A0;
float AN_V;
float AN_vel;

void setup() 
{
   Serial.begin(9600);
}

void loop()
{

    AN_V = analogRead(ANPin);  
    AN_vel= (AN_V*0.713); 
   
 
    Serial.println(AN_vel);
    delay(10);
         
}
