#include <stdio.h>

int main()
{
  int i = 0;
  for (int j = 0; j < 5; j++) {
    i += j;
  }
  if (i > 10) {
    printf("TRUE\n");
  } else {
    printf("FALSE\n");
  }
  return 0;
}
