#include <iostream>
#include <string>

using namespace std;

int main(void) {
	string S = "ABC"; 
	cout << S.compare(1,1,"BC") + S.compare(2,1,S,2,2) << endl;
	return 0;
}
