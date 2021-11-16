#!/bin/sh
sudo systemctl stop klipper
cd ~/klipper

make clean KCONFIG_CONFIG=config.host
#make menuconfig KCONFIG_CONFIG=config.host
make flash KCONFIG_CONFIG=config.host

make clean KCONFIG_CONFIG=config.octopus
#make menuconfig KCONFIG_CONFIG=config.octopus
make KCONFIG_CONFIG=config.octopus
## Die richtige Flashmethode auswählen:
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_13001B000B50534841313020-if00  #mit lsusb herausfinden
make flash FLASH_DEVICE=0483:df11
#./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_ ... {BOARD-TYP}

sudo systemctl start klipper
