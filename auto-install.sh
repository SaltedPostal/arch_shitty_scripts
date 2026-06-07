# /bin/bash

echo 'label: gpt' | sfdisk /dev/sda

mkfs.ext4 -F /dev/sda

mount /dev/sda /mnt
pacstrap -K /mnt base linux linux-firmware archlinux-keyring networkmanager 


echo The system was been installed in base.
echo please proceed the arch-chroot /mnt to enter your system and install root password and user data.
echo Installed networkmanager so after reboot internet must work automatical
