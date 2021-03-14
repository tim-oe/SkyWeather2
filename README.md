# SkyWeather2
project to house any tweaks and changes for setting up (SkyWeather2)[https://shop.switchdoc.com/products/skyweather2-raspberry-pi-based-weather-station-kit-for-the-cloud]

## Current setup

- Raspberry Pi 4 Model B Rev 1.4
    - 8g memory
    - cat /proc/device-tree/model
- Raspbian GNU/Linux 10 buster
    - [Raspberry Pi OS Lite](https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2021-01-12/2021-01-11-raspios-buster-armhf-lite.zip)
    - cat /etc/os-release
- Python 3.7.3
- 10.3.27-MariaDB-0+deb10u1
- 64g sd card

## utility init script

[init.sh](https://github.com/tim-oe/SkyWeather2/blob/main/src/bin/init.sh) contains commands ran to initialize the dependent software

## sql init script

[init.sql](https://github.com/tim-oe/SkyWeather2/blob/main/src/sql/init.sql) contains sql commands to init mariadb

## steps
- install pi os
- enable [ssh](https://www.raspberrypi.org/documentation/remote-access/ssh/)
- from [manual](https://www.switchdoc.com/wp-content/uploads/2020/12/SkyWeather2AssemblyAndTestManual1.2.pdf)

## TODOs

- add network storage
- add seconday local storage, ssd
- make specific db user for Skyweather schema
- etl process to export data