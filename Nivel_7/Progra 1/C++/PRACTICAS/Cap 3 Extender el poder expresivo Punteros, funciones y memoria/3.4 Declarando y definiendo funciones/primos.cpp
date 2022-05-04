#include <iostream>
#include <cmath>

using namespace std;
int main() {
    unsigned long cont = 0, numero, lim = 0;
    cout << "Ingrese el numero a comprobar: ";
    cin >> numero;
  
    cout << "\n";
    cout << "Numero ingresado:\t" << numero << "\n";
    cout << "Numero de divisores:\t";
    for(unsigned long div = 1; div <= numero; div++) {
        if(numero % div == 0) {
            cout << "{" << div << "} ";
            cont++;
            lim++;
            if(lim == 10) {
                cout << "\n\t\t\t";
                lim = 0;
            }
        }
    }
    cout << "Fin!!" << endl;
    
    if(cont == 2) {
        cout << "El numero si es primo:\ttiene " << cont << " divisores." << endl;
    } else {
        cout << "El numero no es primo:\ttiene " << cont << " divisores." << endl;
    }
    return 0;
}
