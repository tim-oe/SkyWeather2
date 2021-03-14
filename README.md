# SkyWeather2
project to house any tweaks and changes for setting up (SkyWeather2)[https://shop.switchdoc.com/products/skyweather2-raspberry-pi-based-weather-station-kit-for-the-cloud]

## Current setup

- Raspberry Pi 4 Model B Rev 1.4 (cat /proc/device-tree/model)
- Raspbian GNU/Linux 10 buster (cat /etc/os-release)
- Python 3.7.3
- 10.3.27-MariaDB-0+deb10u1
- 64g sd card

## utility init script

bin/init.sh contains commands ran to initialize the dependent software

## sql init script

sql/init.sql contains sql commands to init mariadb

## TODOs

- minimal pi install /w out gui
- add network storage
- add seconday local storage, ssd
- make specific db user for Skyweather schema
- etl process to export data
