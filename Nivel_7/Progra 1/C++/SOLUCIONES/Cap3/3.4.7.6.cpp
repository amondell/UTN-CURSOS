#include <iostream>
#include <cmath>

using namespace std;

bool isPrime(int num) {
// Insert your code here
	for (int i = 2; i< num/2; i++){
	 if (num == 0 || num == 1 || num == 4) return false;
		for (int x = 2; x < num / 2; x++) {
	    	if (num % x == 0) return false;
	  }
	  // Si no se pudo dividir por ninguno de los de arriba, sí es primo
	  return true;
	}	
}
int main(void) {
	for(int i = 0; i <= 21; i++)
	if(isPrime(i))
		cout << i << " ";
		cout << endl;
	return 0;
}
