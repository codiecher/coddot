#!/nix/store/nilkcchyj1l9ix3ww4p1fby7v00dwkpc-bash-interactive-5.3p3/bin/sh
# SPDX-License-Identifier: GPL-2.0

SEED="f3143950cde60e996d697e3f7274794e06f6958c97005a51f6cfe91b84198565"
echo "$SEED" > "$1"
HASH=$(echo -n "$SEED" | sha256sum | cut -d" " -f1)
echo "#define RANDSTRUCT_HASHED_SEED \"$HASH\"" > "$2"
