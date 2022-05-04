float analogico_2;
float voltaje;

void setup()
{
  Serial.begin(9600);
  pinMode(A2, INPUT);
}

void loop()
{
  analogico_2 = analogRead(A2);
  voltaje = analogico_2 * (5.0 / 1023.0);

  Serial.println(voltaje);
}
