#!/bin/bash
#check root
if (( $EUID != 0 )); then
    echo "fuck. use sudo or root account to use this shit."
    exit 1
fi


yes | pacman -Syu

#remove all shit not used by system or programs
orphans=$(pacman -Qdtq)
if [ -n "$orphans" ]; then
    yes | pacman -Rns $orphans
fi
#asking for reboot
read -p "reboot rn ? [y/N] " answer

#reboot call on y
if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "rebooting."
    /usr/bin/systemctl reboot
fi
