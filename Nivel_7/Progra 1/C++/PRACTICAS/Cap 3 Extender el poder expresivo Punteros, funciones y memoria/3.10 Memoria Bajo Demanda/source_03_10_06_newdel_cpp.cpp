#include <iostream>

using namespace std;
	
int main(void) {
    float *arr;

    arr  = new float[5];
    for(int i = 0; i < 5; i++)
	arr[i] = i * i;
    for(int i = 0; i < 5; i++)
	cout << arr[i] << endl;
    delete [] arr;
    return 0;
}
