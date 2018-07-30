// Modified based on https://github.com/mjosaarinen/tiny_sha3/blob/master/main.c
// main.c
// 19-Nov-11  Markku-Juhani O. Saarinen <mjos@iki.fi>

#include <stdio.h>
#include <string.h>
#include <time.h>
#include "sha3.h"

#define BUF_LEN 64

/* abcde */
static char sha[BUF_LEN] = "\x1d\x7c\x3a\xa6\xee\x17\xda\x5f\x4a\xeb\x78\xbe\x96\x8a\xa3\x84\x76\xdb\xee\x54\x84\x2e\x1a\xe2\x85\x6f\x4c\x9a\x5c\xd0\x4d\x45\xdc\x75\xc2\x90\x21\x82\xb0\x7c\x13\xe\xd5\x82\xd4\x76\x99\x5b\x50\x2b\x87\x77\xcc\xf6\x9f\x60\x57\x44\x71\x60\x3\x86\x63\x9b";

int main(int argc, char* argv[])
{
  uint8_t buf[BUF_LEN];
  memset(buf, 0, sizeof(buf));

  sha3(argv[1], strlen(argv[1]), buf, BUF_LEN);

  if (memcmp(sha, buf, BUF_LEN) != 0) {
    printf("FALSE\n");
    return 1;
  }

  printf("TRUE\n");
  return 0;
}
