#!/nix/store/nilkcchyj1l9ix3ww4p1fby7v00dwkpc-bash-interactive-5.3p3/bin/sh

export MANGOHUD=1

# https://docs.mesa3d.org/envvars.html
export MESA_NO_DITHER=1         # Disables dither
export MESA_BACK_BUFFER=pixmap  # For X only

gamemoderun "$@"
