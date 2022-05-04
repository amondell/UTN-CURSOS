// Definimos las entradas analogicas
float analogico_0;
float analogico_1;
float analogico_2;
float analogico_3;
float analogico_4;
float analogico_5;

// Definimos el valor de voltaje digital
float voltaje0;
float voltaje1;
float voltaje2;
float voltaje3;
float voltaje4;
float voltaje5;

void setup()
{
  Serial.begin(9600);
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
}

void loop()
{
  analogico_0 = analogRead(A0);
  analogico_1 = analogRead(A1);
  analogico_2 = analogRead(A2);
  analogico_3 = analogRead(A3);
  analogico_4 = analogRead(A4);
  analogico_5 = analogRead(A5);
  
  voltaje0 = analogico_0 * (5.0 / 1023.0);
  voltaje1 = analogico_1 * (5.0 / 1023.0);
  voltaje2 = analogico_2 * (5.0 / 1023.0);
  voltaje3 = analogico_3 * (5.0 / 1023.0);
  voltaje4 = analogico_4 * (5.0 / 1023.0);
  voltaje5 = analogico_5 * (5.0 / 1023.0);
  
  Serial.print(voltaje0);
  Serial.print("/");
  Serial.print(voltaje1);
  Serial.print("/"); 
  Serial.print(voltaje2);
  Serial.print("/");
  Serial.print(voltaje3);
  Serial.print("/");
  Serial.print(voltaje4);
  Serial.print("/");
  Serial.print(voltaje5);
  Serial.print("/");
  
    
  Serial.print('\n');
  
  
}
