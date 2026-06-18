#!/nix/store/nilkcchyj1l9ix3ww4p1fby7v00dwkpc-bash-interactive-5.3p3/bin/sh
# SPDX-License-Identifier: GPL-2.0

cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev/null 2>&1
#include <stdio.h>
int main(void)
{
	printf("\n");
	return 0;
}
END
