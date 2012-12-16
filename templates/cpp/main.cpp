
/*
** Dependencies.
*/

#include "hello.h"

/*
** Main, entry point.
*/

int main() {
  Hello h = Hello("Toto");

  h.greet("Titi");
  h.greet("Tata");
  return 0;
}