#include <iostream>
#include "ExamplePrivateLibraryClass.h"

void ExamplePrivateLibraryClass::printInPrivateClass(const std::string &message) {
  std::cout << message + " " + this->message_postfix_ << std::endl;
}

ExamplePrivateLibraryClass::ExamplePrivateLibraryClass() : message_postfix_(
    "[ExamplePrivateLibraryClass]") {}
