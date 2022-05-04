#include <iostream>
#include <string>

using namespace std;

int main(void) {
	string TheString; 
	for(char c = 'A'; c <= 'Z'; c++)
		TheString.push_back(c);
	cout << TheString << endl;
	return 0;
}
