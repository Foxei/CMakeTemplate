#ifndef EXAMPLEPRIVATELIBRARYCLASS_H_
#define EXAMPLEPRIVATELIBRARYCLASS_H_

#include <string>

class ExamplePrivateLibraryClass {
 private:
  std::string message_postfix_;

 public:
  ExamplePrivateLibraryClass();

  void printInPrivateClass(const std::string &message);
};

#endif //EXAMPLEPRIVATELIBRARYCLASS_H_
