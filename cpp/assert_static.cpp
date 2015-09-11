/*
 * =====================================================================================
 *
 *       Filename:  assert_static.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  08/01/2015 14:04:40
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#include <type_traits>
#include <iostream>


using namespace std;

class A {};
class B : public A {};
class C {};

template <typename T>
void process(const T& t)
{
   static_assert(is_base_of<A, T>::value, "A is not base of T");
}

int main()
{
    process(A());
    process(B());
    process(C());
}