#include <iostream>

using namespace std;

namespace Hogwarts {
	int Troll = 1;
}

namespace Mordor {
	int Troll = 2 ;
}

namespace Hogwarts {
	float Wizard = -0.5;
}

namespace Mordor {
	float Wizard = 0.5;
}

int main(void) {
	cout << Hogwarts::Troll << " " << Hogwarts::Wizard << endl;
	cout << Mordor::Troll << " " << Mordor::Wizard << endl;
	return 0;
}

