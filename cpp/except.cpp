/*
 * =====================================================================================
 *
 *       Filename:  except.cpp
 *
 *    Description:  Test code for C++ exception
 *
 *        Version:  1.0
 *        Created:  07/26/2015 20:32:35
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <iostream>
#include <memory>
#include <string>

using namespace std;

void funOne()
{
    string str1;
    auto str2 = make_unique<string>("hello");
    cout << *str2 << endl;
}

void funTwo()
{
    try {
        long double* p1 = new long double[99999999000000000];
    } catch (const std::bad_alloc& e) {
            cerr << __FILE__ << ":" << __func__ << ":" << __LINE__ << endl;
            throw e;
    }
}


int main()
{
    funTwo();
    cout << "hello world" << endl;
    return 0;
}
