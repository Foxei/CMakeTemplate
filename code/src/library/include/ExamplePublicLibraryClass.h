#ifndef EXAMPLEPUBLICLIBRARYCLASS_H_
#define EXAMPLEPUBLICLIBRARYCLASS_H_

#include <string>

class ExamplePublicLibraryClass {
 private:
  std::string message_prefix_;

 public:
  ExamplePublicLibraryClass();

  void printInPublicClass(const std::string &message);
};

#endif //EXAMPLEPUBLICLIBRARYCLASS_H_