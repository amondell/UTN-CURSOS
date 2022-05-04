#include <iostream>
using namespace std;
// Insert your function here


bool increment(int var, int exp = 0){
	if (exp == 0){
		return false;
	}else{
		return true;
	}
}
int main(void) {
	int var = 0;
	for(int i = 0; i < 10; i++)
		if(i % 2)
			if(increment(var)){
				var++;
			}
		else{
			if(increment(var,i)){
				var+= i;
			}
		}
			
	cout << var << endl;
	return 0;
}
