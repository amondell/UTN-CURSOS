//anemómetro

float ANPin= 0;
float AN_V = 0;
float AN_vel = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  AN_V = analogRead(ANPin);  
  AN_vel= (AN_V*0.190); 
  
  Serial.print(AN_vel*2);
  Serial.println(" Km/h");
  delay(500);

}
