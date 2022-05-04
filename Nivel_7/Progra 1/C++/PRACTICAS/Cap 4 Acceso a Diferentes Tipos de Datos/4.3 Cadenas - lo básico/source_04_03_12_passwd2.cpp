#include <iostream>
#include <string>

using namespace std;

int main(void) {
        string secret = "abracadabra";
        string password;
        cout << "Enter password:" << endl;
	getline(cin,password);
	if(secret.compare(password) == 0) 
		cout << "Access granted" << endl;
	else
		cout << "Sorry";
        return 0;
}

