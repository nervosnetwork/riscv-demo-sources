// Modified based on https://github.com/mjosaarinen/tiny_sha3/blob/master/main.c
// main.c
// 19-Nov-11  Markku-Juhani O. Saarinen <mjos@iki.fi>

#include <stdio.h>
#include <string.h>
#include <time.h>
#include "sha3.h"

// read a hex string, return byte length or -1 on error.

static int test_hexdigit(char ch)
{
  if (ch >= '0' && ch <= '9')
    return  ch - '0';
  if (ch >= 'A' && ch <= 'F')
    return  ch - 'A' + 10;
  if (ch >= 'a' && ch <= 'f')
    return  ch - 'a' + 10;
  return -1;
}

static int test_readhex(uint8_t *buf, const char *str, int maxbytes)
{
  int i, h, l;

  for (i = 0; i < maxbytes; i++) {
    h = test_hexdigit(str[2 * i]);
    if (h < 0)
      return i;
    l = test_hexdigit(str[2 * i + 1]);
    if (l < 0)
      return i;
    buf[i] = (h << 4) + l;
  }

  return i;
}

const char *msg_hex =
    "3A3A819C48EFDE2AD914FBF00E18AB6BC4F14513AB27D0C178A188B61431E7F5"
    "623CB66B23346775D386B50E982C493ADBBFC54B9A3CD383382336A1A0B2150A"
    "15358F336D03AE18F666C7573D55C4FD181C29E6CCFDE63EA35F0ADF5885CFC0"
    "A3D84A2B2E4DD24496DB789E663170CEF74798AA1BBCD4574EA0BBA40489D764"
    "B2F83AADC66B148B4A0CD95246C127D5871C4F11418690A5DDF01246A0C80A43"
    "C70088B6183639DCFDA4125BD113A8F49EE23ED306FAAC576C3FB0C1E256671D"
    "817FC2534A52F5B439F72E424DE376F4C565CCA82307DD9EF76DA5B7C4EB7E08"
    "5172E328807C02D011FFBF33785378D79DC266F6A5BE6BB0E4A92ECEEBAEB1";

const char *sha_hex =
    "6E8B8BD195BDD560689AF2348BDC74AB7CD05ED8B9A57711E9BE71E9726FDA45"
    "91FEE12205EDACAF82FFBBAF16DFF9E702A708862080166C2FF6BA379BC7FFC2";

int main()
{
  int msg_len, sha_len;
  uint8_t sha[64], buf[64], msg[256];

  memset(sha, 0, sizeof(sha));
  memset(buf, 0, sizeof(buf));
  memset(msg, 0, sizeof(msg));

  msg_len = test_readhex(msg, msg_hex, sizeof(msg));
  sha_len = test_readhex(sha, sha_hex, sizeof(sha));

  sha3(msg, msg_len, buf, sha_len);

  if (memcmp(sha, buf, sha_len) != 0) {
    printf("FALSE\n");
    return 1;
  }

  printf("TRUE\n");
  return 0;
}
