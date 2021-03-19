# SkyWeather2
project to house any tweaks and changes for setting up [SkyWeather2](https://shop.switchdoc.com/products/skyweather2-raspberry-pi-based-weather-station-kit-for-the-cloud)

[Complete weather station](tim-oe.github.com/SkyWeather2/blob/main/img/porch-wiew.jpg?raw=true)

[Stand](tim-oe.github.com/SkyWeather2/img/stand.jpg)

[mountings](tim-oe.github.com/SkyWeather2/img/mountings.jpg?raw=true)

[pi enclosure](tim-oe.github.com/SkyWeather2/img/pi-enclosure.jpg)

[power enclosure](tim-oe.github.com/SkyWeather2/img/power-enclosure.jpg)

## Current setup

- [Raspberry Pi 4 Model B Rev 1.4](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/)
    - 8g memory
- Raspbian GNU/Linux 10 buster
    - [Raspberry Pi OS Lite](https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2021-01-12/2021-01-11-raspios-buster-armhf-lite.zip)
- Python 3.7.3
- [10.3.27-MariaDB-0+deb10u1](https://mariadb.com/kb/en/documentation/)
- 64g sd card
- 38.8940100°, -90.192002°, 644.6 ft MSL

## utility init script

[init.sh](https://github.com/tim-oe/SkyWeather2/blob/main/src/bin/init.sh) contains commands ran to initialize the dependent software

## sql init script

[init.sql](https://github.com/tim-oe/SkyWeather2/blob/main/src/sql/init.sql) contains sql commands to init mariadb

## steps
- install pi os
- enable [ssh](https://www.raspberrypi.org/documentation/remote-access/ssh/)
- [assemble and test](https://www.switchdoc.com/wp-content/uploads/2020/12/SkyWeather2AssemblyAndTestManual1.2.pdf)
    - utilize [init.sh](https://github.com/tim-oe/SkyWeather2/blob/main/src/bin/init.sh) for software setup
    - you can use it as a guide for each step 
- [configure and operate](https://www.switchdoc.com/wp-content/uploads/2020/12/SkyWeather2ConfigurationAndOperationsManual1.1.pdf)

## [System Services](https://wiki.debian.org/systemd/documentation)
- [Configuration Service](https://github.com/tim-oe/SkyWeather2/blob/main/src/lib/systemd/system/skyconfig.service)
- [skyWeather2 Service](https://github.com/tim-oe/SkyWeather2/blob/main/src/lib/systemd/system/skyweather.service)
- [Dashboard Service](https://github.com/tim-oe/SkyWeather2/blob/main/src/lib/systemd/system/skydash.service)

## BOM
- [enclosure](https://www.amazon.com/gp/product/B0828387BM/ref=ppx_yo_dt_b_asin_title_o03_s01?ie=UTF8&psc=1)

## FAQ
- [verify camera](https://www.raspberrypi.org/forums/viewtopic.php?t=209221)

## TODOs

- add seconday local storage, ssd
- make specific db user for Skyweather schema
- implement MQTT 
- add [air quality sensor](https://shop.switchdoc.com/collections/shop-all/products/grove-laser-pm2-5-air-quality-sensor-for-raspberry-pi-arduino-hm3301)
- add [lightening sensor](https://shop.switchdoc.com/collections/shop-all/products/the-thunder-board-i2c-lightning-detector-grove-connectors)
- add [SolarMax](https://shop.switchdoc.com/products/solarmax-lipo-solar-power-system-and-data-gathering-system-for-skyweather-and-others)
- add gps?