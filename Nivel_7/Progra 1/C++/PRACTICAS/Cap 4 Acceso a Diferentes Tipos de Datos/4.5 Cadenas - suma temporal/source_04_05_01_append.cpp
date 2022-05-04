#include <iostream>
#include <string>

using namespace std;

int main(void) {
	string TheString = "content"; 
	string NewString;
	NewString.append(TheString);
	NewString.append(TheString,0,3);
	NewString.append(2,'!');
	cout << NewString << endl;
	return 0;
}
