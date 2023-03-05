#include <iostream>
#include <ExamplePublicLibraryClass.h>

int main(int argc, char* argv[]){
  ExamplePublicLibraryClass public_library_class;
  public_library_class.printInPublicClass("Hello World!");
  std::cout << public_library_class.getSuperSecretMessage() << std::endl;

  return 0;
}