#include <iostream>
#include <string>

using namespace std;

int main(void) {
	string WhereAreWe = "I've got a feeling we're not in Kansas anymore"; 
		
	WhereAreWe.erase(38, 8).erase(25, 4);
	cout << WhereAreWe << endl;
	return 0;
}
