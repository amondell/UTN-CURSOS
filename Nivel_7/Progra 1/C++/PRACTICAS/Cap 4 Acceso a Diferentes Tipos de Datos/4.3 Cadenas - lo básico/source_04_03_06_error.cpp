#include <iostream>
#include <string>

using namespace std;

int main(void) {
        string String;
        String = "A" + "B";
        String = String + "C";
        String = "B" + String; 		
        cout << String << endl;
        return 0;
}

