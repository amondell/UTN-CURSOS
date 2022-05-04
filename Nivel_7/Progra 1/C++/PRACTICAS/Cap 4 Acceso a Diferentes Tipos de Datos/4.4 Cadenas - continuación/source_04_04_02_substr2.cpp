#include <iostream>
#include <string>

using namespace std;

int main(void) {
	string str = "12345";
	int pos = 1;
	cout << str.substr(pos).substr(pos).substr(pos).size() << endl;
	return 0;
}
