/*
 * =====================================================================================
 *
 *       Filename:  locale.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  08/01/2015 21:32:26
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <iostream>
#include <locale>

using namespace std;

int main()
{
    wcout.imbue(locale(""));
    wcout << 32767 << endl;
    cout << locale("en_US").name() << endl;
    cout << locale("").name() << endl;
    cout << locale("C").name() << endl;
}