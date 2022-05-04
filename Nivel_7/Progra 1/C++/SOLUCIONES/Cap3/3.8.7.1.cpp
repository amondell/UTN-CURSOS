#include <iostream>
#include <cmath>
using namespace std;
// Insert your functions here

bool increment(int var, float exp = 0){
	if (exp == 0){
		return false;
	}else{
		return true;
	}
}

int main(void) {
	int intvar = 0;
	
	float floatvar = 1.5;
	
	for(int i = 0; i < 10; i++)
		if(i % 2) {
			intvar++;
			floatvar += sqrt(intvar);
		}
		else {
			intvar+=i;
			floatvar++;
		}
	cout << intvar * floatvar << endl;
	return 0;
}
