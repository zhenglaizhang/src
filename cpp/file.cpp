#include <fstream>

using namespace std;

int main(int argc, char const *argv[])
{
	ofstream fout("test.out");
	if (!fout) {
		cerr << "Error opening test.out for writing" << endl;
		return -1;
	}

	fout << "12345";

	ios_base::streampos 


	return 0;
}