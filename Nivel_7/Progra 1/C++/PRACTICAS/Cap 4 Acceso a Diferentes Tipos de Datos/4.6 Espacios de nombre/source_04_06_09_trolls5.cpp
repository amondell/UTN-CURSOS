#include <iostream>

using namespace std;

namespace Hogwarts {
	int Troll = 1;
	float Wizard = -0.5;
}

namespace Mordor {
	int Troll = 2 ;
	float Wizard = 0.5;
}

using Mordor::Troll;
using Hogwarts::Wizard;

int main(void) {
	cout << Hogwarts::Troll << " " << Wizard << endl;
	cout << Troll << " " << Mordor::Wizard << endl;
	return 0;
}

