/* 

Angie Marchena Mondell
604650904

Proyecto final - Programacion I

*/

#include <iostream>  // Formato de impresion y lectura
#include "SerialClass.h" // Control del Serial para arduino


using namespace std;

// Declaracion de funciones principales.
int menu();
void encender();
void off();
void verdatos();

// instancia de puerto serial
Serial* Arduino = new Serial("COM7");


/*

Selecion en el main, con datos recibidos del menu

*/
int main(){
	int opcion;
	// Verifica que el sistema solo acepte valores 1-3. otra opcion no sera valida.
	while (opcion != 4){
		
		opcion = menu();
		
		switch (opcion){
			case 1: encender;
			break;
			case 2: off;
			break;
			case 3: verdatos;
			break;
			case 4: cout << "Ha salido del sistema";
			break;		
		}	
	}
	return 0;
}

/*

El sistema tiene un menu el cual se muestra acontinuacion

                                                                        
*/

int menu(){
	int op;
	
	system("cls");
	
	string ops[] = {
		"Medir voltaje",
		"Apagar sistema",
		"Ver datos en el puerto",
		"Salir"};
	
	cout << "-----------------Menu---------------------" << endl;
	cout << "-- 1 - "+ ops[0] << endl;
	cout << "-- 2 - "+ ops[1] << endl;
	cout << "-- 3 - "+ ops[2] << endl;
	cout << "-- 4 - "+ ops[3] << endl;
	cout << "-----------------Menu---------------------" << endl;
	cout << "-- Que desea realizar?" << endl;
	cin >> op;
	cout << "\n\t Ha elegido la opcion " + ops[op-1] << endl;
	
	cout<<"Voltaje actual: 4.50"<<endl;
	Sleep(1000);
	
	
	return op;
	
}


// Envia al puerto serial lo que se desea realizar
// En este caso realizar la medicion de voltaje
void encender(){
	if(Arduino -> IsConnected())
		Arduino -> WriteData("1", sizeof("1")-1);
}

// Envia al puerto serial lo que se desea realizar
// En este caso realizar apagar el sistema
void off(){
	if(Arduino -> IsConnected())
		Arduino -> WriteData("2", sizeof("2")-1);
}

// Recibe los datos del puerto, el cual contiene el valor del voltaje medido.
void verdatos(){
	char voltaje[10];
	if(Arduino -> IsConnected())
		Arduino->ReadData(voltaje,sizeof(voltaje)-1);
        cout<<"Voltaje actual: "<<voltaje<<endl;
        Sleep(5000);
        
}
