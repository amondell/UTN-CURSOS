#include <iostream>
#include <string>

using namespace std;

int main(void) {
	string quote = "Whyserious?", anyword = "monsoon"; 
	quote.insert(3,2, ' ').insert(4,anyword,3,2);	
	cout << quote << endl;
	return 0;
}
