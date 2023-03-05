#include <iostream>
#include "ExamplePrivateLibraryClass.h"

void ExamplePrivateLibraryClass::printInPrivateClass(const std::string &message) {
  std::cout << message + " " + this->message_postfix_ << std::endl;
}

std::string ExamplePrivateLibraryClass::getSuperSecretMessageWithPrefix(const std::string &prefix){
  return prefix + " This is a super secret message! " + this->message_postfix_;
}


ExamplePrivateLibraryClass::ExamplePrivateLibraryClass() : message_postfix_(
    "[ExamplePrivateLibraryClass]") {}
