#include <iostream>

using namespace std;

namespace What_A_Wonderful_Place_For_A_Young_Sorcerer {
	int Troll = 1;
	float Wizard = -0.5;
}

namespace Mordor {
	int Troll = 2 ;
	float Wizard = 0.5;
}

namespace Hogwarts = What_A_Wonderful_Place_For_A_Young_Sorcerer;

int main(void) {
	cout << Hogwarts::Troll << " " << What_A_Wonderful_Place_For_A_Young_Sorcerer::Wizard << endl;
	cout << Mordor::Troll << " " << Mordor::Wizard << endl;
	return 0;
}

