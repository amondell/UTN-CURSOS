#include <iostream>
 
using namespace std;

int main(void) {
        int  numbers[5];
        int  aux;
        bool swapped;
        // ask the user to enter 5 values 
        for(int i = 0; i < 5; i++) {
                cout << endl << "Enter value #" << i + 1 << ": ";
                cin >> numbers[i];
        }
        // sort them 
        do {
                swapped = false;
                for(int i = 0; i < 4; i++) {
                        if(numbers[i] > numbers[i + 1]) {
                            swapped = true;
                            aux = numbers[i];
                            numbers[i] = numbers[i + 1];
                            numbers[i + 1] = aux;
                         }
                }
        } while(swapped);
        // print results 
        cout << endl << "Sorted array: " << endl;
        for(int i = 0; i < 5; i++)
                cout << numbers[i] << " ";
        cout << endl;
        return 0;
}
