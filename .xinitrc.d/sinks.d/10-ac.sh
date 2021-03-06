#!/bin/zsh

case $@ in
  UDEV*change*/devices/*/AC*)
    AC=$(echo $@ | cut -d' ' -f 4)
    ONLINE=$(cat /sys/${AC}/online)

    if [[ "${ONLINE}" == "1" ]]; then
      xset -dpms
      xset s off
      xbacklight -time 0 -set 100
    else
      xset +dpms
      xset s 120
      [[ $(xbacklight -get) -gt 30 ]] && xbacklight -time 0 -set 30
    fi
    ;;
esac
