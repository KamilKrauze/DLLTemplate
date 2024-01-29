#include "mathlib.h"

#include <iostream>

int main() {

	std::cout << "10 + 59 = " << matlib::Add(10, 59) << "\n";
	std::cout << "79 - 10 = " << matlib::Sub(79, 10) << "\n" << std::endl;

	std::cout << "33 + 36 = " << Calculator::ADD(33, 36) << "\n";
	std::cout << "420 - 351 = " << Calculator::SUB(420, 351) << "\n";

	std::cin.get();

	return 0;
}