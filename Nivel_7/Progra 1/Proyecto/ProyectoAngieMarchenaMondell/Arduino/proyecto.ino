/* 

Angie Marchena Mondell
604650904

Proyecto final - Programacion I

*/

// Bibblioteca para control LCD
#include <LiquidCrystal.h>

// LCD
LiquidCrystal lcd(8, 9, 10, 11, 12, 13);

/*
 Constantes
 Verde    Indica valores aceptados para el circuito
 Amarillo Indica valores controlados de coltaje, que en algunos casos no son sufucuentes para el circuito
 Rojo     Indica valores peligrosos, podrian dañar el circuito
 */

int amarillo = 5;
int verde = 6;
int rojo = 7;
char datos;
float lectura;
float volt;
String vprint;
void setup()

  
{
  lcd.begin(16, 2);
  // Pines
  pinMode(amarillo, OUTPUT);
  pinMode(verde, OUTPUT);
  pinMode(rojo, OUTPUT);
  pinMode(A0,INPUT);
  
  // Serial
  Serial.begin(9600);
}

void loop()
{

  // Medir voltaje
  lectura = analogRead(A0);
  volt = lectura /1023*5.0;
  vprint = String(volt);
  datos = Serial.read();

  
  Serial.println(vprint);
  // Enciende el sistema
  if(datos == '1'){
    // Verifica que el voltaje sea menor que 5 y mayor que 3
    if(3 < volt <= 5 ){
      
      digitalWrite(amarillo, LOW);
      digitalWrite(verde, LOW);
      digitalWrite(rojo, HIGH);
      lcd.setCursor(0,0);
      lcd.print("Voltaje medido: ");
      delay(200);
      lcd.setCursor(0,1);
      lcd.print(vprint);
      delay(200);

    }
    // Verifica que el voltaje sea menor que 3.5 y mayor que 2
    if(volt > 2.00 && volt <= 3.5){

      digitalWrite(rojo, LOW);
      digitalWrite(amarillo, LOW);
      digitalWrite(verde, HIGH);

      lcd.setCursor(0,0);
      lcd.print("Voltaje medido: ");
      delay(200);
      lcd.setCursor(0,1);
      lcd.print(vprint);
      delay(200);

    }
    // Verifica que el voltaje sea menor que 1
    if(volt <= 2.00){

      digitalWrite(rojo, LOW);
      digitalWrite(amarillo, HIGH);
      digitalWrite(verde, LOW);

      lcd.setCursor(0,0);
      lcd.print("Voltaje medido: ");
      delay(200);
      lcd.setCursor(0,1);
      lcd.print(vprint);
      delay(200);

    }
  }
  // Si el usuario selecciona 2, apagaria el sistema.
  if (datos == '2'){

    lcd.clear();

    digitalWrite(verde, LOW);
    digitalWrite(amarillo, LOW);
    digitalWrite(rojo, LOW);

  }
  
}
