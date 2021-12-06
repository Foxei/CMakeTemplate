#include "ExamplePublicLibraryClass.h"
#include "ExamplePrivateLibraryClass.h"

void ExamplePublicLibraryClass::printInPublicClass(const std::string &message) {
  ExamplePrivateLibraryClass private_class;
  private_class.printInPrivateClass(this->message_prefix_ + " " + message);
}

ExamplePublicLibraryClass::ExamplePublicLibraryClass() : message_prefix_(
    "[ExamplePublicLibraryClass]") {}
