#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

int main(void) {
    int max = 10;
    srand(time(NULL));
    int rnd = rand() % max + 1;
    cout << rnd << endl;
    return 0;
}
