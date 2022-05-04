#include <iostream>
#include <cstdlib>
#include <ctime>

#include<vector>
#include<algorithm>

using namespace std;

bool existeEnVector(vector<string> v, string busqueda) {
    return find(v.begin(), v.end(), busqueda) != v.end();
}

int main(void) {
	int maxball;
	int ballsno;
	cout << "Max ball number? ";
	cin >> maxball;
	cout << "How many balls? ";
	cin >> ballsno;
	
	// Insert your code here
	int rnd;
	
	int arreglo[ ballsno ] = { 0 };
	int i;
	srand( time( 0 ) );
	for ( i = 0; i < ballsno; ++i )
	  arreglo[ i ] = rand() % maxball;
	for ( i = 0; i < ballsno; ++i ){
		cout << arreglo[ i ];
		cout << "\n";
	}
	
	
	
	return 0;
}

