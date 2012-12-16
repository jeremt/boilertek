
/*
** Dependencies
*/

#include "hello.h"

/*
** Simple class to say hello to cpp :).
*/

Hello::Hello(std::string name)
{
  this->name = name;
  this->say_message = "\x1b[1m" + name + "\x1b[m - ";
  std::cout << "\n  " + this->name + " was born.\n" << std::endl;
}

/*
** Hello destructor.
*/

Hello::~Hello()
{
  std::cout << "\n  Good bye :)\n" << std::endl;
}

/*
** Greet someone.
**
** @param {name} the people to greet
*/

void Hello::greet(std::string name)
{
  std::cout << "    " + this->say_message + "hello, " + name << std::endl;
}