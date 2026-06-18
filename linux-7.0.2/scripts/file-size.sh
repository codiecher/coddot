#!/nix/store/nilkcchyj1l9ix3ww4p1fby7v00dwkpc-bash-interactive-5.3p3/bin/sh
# SPDX-License-Identifier: GPL-2.0
set -- $(ls -dn "$1")
printf '%s\n' "$5"
