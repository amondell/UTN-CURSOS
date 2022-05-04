float analogico_2;
float analogico_5;
float voltaje0;
float voltaje1;


void setup() {
  Serial.begin(9600);
  pinMode(A2, INPUT);
  pinMode(A5, INPUT);
}

void loop() {
  analogico_2 = analogRead(A2);
  voltaje0 = analogico_2 * (5.0 / 1023.0);
  analogico_5 = analogRead(A5);
  voltaje1 = analogico_5 * (5.0 / 1023.0);


  Serial.print(voltaje0);
  Serial.print("/");
  Serial.print (voltaje1);
  Serial.println ("v");

}
