# SkyWeather2
project to house any findings, tweaks, and changes for setting up [SkyWeather2](https://shop.switchdoc.com/products/skyweather2-raspberry-pi-based-weather-station-kit-for-the-cloud)

![Complete weather station](img/porch-wiew.jpg?raw=true)

![Stand](img/stand.jpg?raw=true)

![mountings](img/mountings.jpg?raw=true)

![pi enclosure](img/pi-enclosure.jpg?raw=true)

![power enclosure](img/power-enclosure.jpg?raw=true)

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
- enable [wifi](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md)
- enable [ssh](https://www.raspberrypi.org/documentation/remote-access/ssh/)
- enable [camera](https://www.raspberrypi.org/documentation/configuration/camera.md)
- enable [i2c](https://www.raspberrypi-spy.co.uk/2014/11/enabling-the-i2c-interface-on-the-raspberry-pi/)
- [assemble and test](https://www.switchdoc.com/wp-content/uploads/2020/12/SkyWeather2AssemblyAndTestManual1.2.pdf)
    - utilize [init.sh](https://github.com/tim-oe/SkyWeather2/blob/main/src/bin/init.sh) for software setup
    - you can use it as a guide for each step 
- [configure and operate](https://www.switchdoc.com/wp-content/uploads/2020/12/SkyWeather2ConfigurationAndOperationsManual1.1.pdf)
- [set up services](src/lib/systemd/system)

## [System Services](https://wiki.debian.org/systemd/documentation)
- [Configuration Service](https://github.com/tim-oe/SkyWeather2/blob/main/src/lib/systemd/system/skyconfig.service)
- [skyWeather2 Service](https://github.com/tim-oe/SkyWeather2/blob/main/src/lib/systemd/system/skyweather.service)
- [Dashboard Service](https://github.com/tim-oe/SkyWeather2/blob/main/src/lib/systemd/system/skydash.service)

## BOM
- [pi enclosure](https://www.amazon.com/gp/product/B0828387BM/ref=ppx_yo_dt_b_asin_title_o03_s01?ie=UTF8&psc=1)
- [Nylon Hex Thread Assortment Kit](https://shop.switchdoc.com/products/140pcs-box-m2-nylon-hex-thread-assortment-kit)
- [power enclosure](https://www.homedepot.com/p/Commercial-Electric-2-Gang-Extra-Duty-Non-Metallic-Low-Profile-While-In-Use-Weatherproof-Horizontal-Vertical-Receptacle-Cover-Gray-WCWL2PG/300852530)
- pipe frame
    - [6ft black pipe x 2](https://www.homedepot.com/p/Southland-3-4-in-x-72-in-Black-Steel-Pipe-584-720HC/100144060)
    - [8in black pipe](https://www.homedepot.com/p/LDR-Industries-3-4-in-x-8-in-Black-Steel-Nipple-302-34X8/100558454)
    - [3/4in elbow x 2](https://www.homedepot.com/p/LDR-Industries-3-4-in-Black-Iron-90-FPT-x-FPT-Elbow-2-Pack-312-E90-34-2/305108808)
    - [3/4in floor flange](https://www.homedepot.com/p/3-4-in-Black-Malleable-Iron-Floor-Flange-2-Pack-521-6042P/302148865)
- wood
    - [oak tread (pi mount)](https://www.homedepot.com/p/11-1-2-x-48-in-Red-Oak-Engineered-Tread-8530R-048-HD00L/202088436)
    - [cedar board (pi mount)](https://www.homedepot.com/p/3-4-in-x-6-in-x-8-ft-Select-Tight-Knot-S1S2E-Cedar-Board-0514368/202089034)
    - [pressure treated deck board (power mount)](https://www.homedepot.com/p/WeatherShield-5-4-in-x-6-in-x-8-ft-Pressure-Treated-Pine-Standard-Decking-Board-5310253/100014758)
    - [pressure treated 2x8 (base)](https://www.homedepot.com/p/2-in-x-8-in-x-8-ft-2-Prime-Ground-Contact-Pressure-Treated-Lumber-107523/206937455)
- [3/4in copper bell pipe hanger x 4](https://www.homedepot.com/p/Oatey-1-2-in-Copper-Bell-Pipe-Hanger-33502/301505456)
  
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