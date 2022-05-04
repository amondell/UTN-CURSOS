#include <iostream>
#include <string>

using namespace std;

int main(void) {
	string Drink = "A martini";
	string Needs = "Shaken, not stirred";
		
	cout << Drink << ". " << Needs << "." << endl;
	Drink.swap(Needs);
	cout << Drink << ". " << Needs << "." << endl;
	return 0;
}
