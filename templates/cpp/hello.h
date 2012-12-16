
#ifndef HELLO_H_
# define HELLO_H_

/*
** Dependencies.
*/

# include <iostream>
# include <string>

/*
** Hello class.
*/

class Hello
{
  std::string name;
  std::string say_message;

public:
  Hello(std::string);
  ~Hello();
  void greet(std::string);
};

#endif /* !HELLO_H_ */