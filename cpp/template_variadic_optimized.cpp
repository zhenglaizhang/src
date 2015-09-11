/*
 * =====================================================================================
 *
 *       Filename:  template_variadic.cpp
 *
 *    Description:  varidic template demo
 *
 *        Version:  1.0
 *        Created:  07/29/2015 22:45:56
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <list>
#include <string>
#include <iostream>
#include <utility>

using namespace std;

template <typename ... Types>
class MyVariadicTemplate {};

MyVariadicTemplate<int> ins1;
MyVariadicTemplate<int, float, double, list<int>> ins2;
MyVariadicTemplate<> ins3;


template <typename T1, typename ... Types>
class MyVariadicTemplate2 {};



void handleValue(int v) { cout << "int: " << v << endl; }
void handleValue(double v) { cout << "double: " << v << endl; }
void handleValue(const string& v) { cout << "string: " << v << endl; }

// base case
template <typename T>
void processValues(T&& arg)
{
    handleValue(std::forward<T>(arg));
}

template <typename T1, typename... Tn>
void processValues(T1&& arg1, Tn&&... args) // parameter pack
{
    handleValue(std::forward<T1>(arg1));
    processValues(std::forward<Tn>(args)...); // parameter pack expension
}

int main()
{
    // fully type-safe...
    processValues(1, 2.1f, "hello");
}