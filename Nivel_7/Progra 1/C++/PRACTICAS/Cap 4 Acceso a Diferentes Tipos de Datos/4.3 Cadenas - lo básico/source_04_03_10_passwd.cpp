#include <iostream>
#include <string>

using namespace std;

int main(void) {
        string secret = "abracadabra";
        string password;
        cout << "Enter password:" << endl;
	getline(cin,password);
	if(secret == password) 
		cout << "Access granted" << endl;
	else
		cout << "Sorry";
        return 0;
}

