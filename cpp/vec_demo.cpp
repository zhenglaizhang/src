#include <string>
#include <vector>
#include <iostream>
#include <iterator>


using namespace std;
using namespace std;
vector<string> vs;

namespace 
{
	int a = 12;
}

class Cl
{
public:
	Cl(const int & )
	{
	}

	void setVal(int val)
	{
		val = val;
	}
	int val;
};

void foo(int a)
{
	cout << a << endl;
}

// void foo(double a) = delete;

class Super
{
public:
	// virtual void f() {}
	// Super(const std::string& str) {};
};

class Sub : public Super
{
public:
	// Sub(int i) : Super(""+i) {};
};

constexpr int getSize() { return 12; }

int main(int argc, char const *argv[])
{
	int ia[getSize()+1];
	foo(1);
	foo(1.2);

	const int& ca = 2;
	int&& ca2 = 2;

	cout << endl;
	cout << typeid(Sub).name() << endl;
	cout << typeid(Cl).name() << endl;
	cout << typeid(Super).name() << endl;
	cout << endl;
	// uniform initialization
	vector<string> v = { "A first string", "A second string" };
	v.push_back("A third string");
	v.push_back("The last string");

	for (const auto& s : v) {
		cout << s << endl;
	}

	cout << endl;

	for (auto it = cbegin(v); it != cend(v); ++it) {
		cout << *it << endl;
	}

	char t[] = "abcedf";
	cout << sizeof(t) << endl; // 7
	cout << strlen(t) << endl; // 6

	char a[] = "hello";
	a[0] = 'a';
	cout << a << endl;

	const char* p = "hello";
	// p[0] = 'a';

	// string str = R"(Hello \b Workd"\n)";
	// cout << str << endl;

	auto _a = 1;
	auto __b = 2;
	// auto 2a = 3;

	// Cl c;
	// c.setVal(12);
	// cout << c.val << endl;
	// Cl arra[2] = { Cl(), Cl() };
	Sub sub;
	Super* su = reinterpret_cast<Super*>(&sub);
	return 0;
}