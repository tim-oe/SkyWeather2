#!/bin/bash
# init script to add system and python deps for SkyWeather2
# use sudo raspi-config
# enable ssh I2C (wifi if needed)
# ssh enabled to make things easier

# make sure OS is up to date 
sudo apt update
sudo apt upgrade

# remove stuff not used. 
# https://raspberrypi.stackexchange.com/questions/58732/remove-ssh-warning-about-default-password
sudo apt purge libpam-chksshpwd vim-tiny vim-common avahi-daemon triggerhappy ed
sudo apt purge busybox flashrom read-edid
# wireless stuff if not used
sudo apt purge wpasupplicant wireless-tools wireless-regdb iw firmware-brcm80211
# drivers
sudo apt purge firmware-atheros firmware-libertas firmware-realtek firmware-misc-nonfree
# blue tooth
sudo apt purge bluez bluez-firmware
# any cruft left hanging
sudo apt autoremove --purge

# https://github.com/switchdoclabs/rtl_433/blob/master/README.md
# https://skpang.co.uk/blog/archives/575
# additional driver deps
sudo apt install libusb-1.0-0-dev librtlsdr-dev rtl-sdr libtool i2c-tools pigpio

# build tools
sudo apt install build-essential autoconf cmake bc dkms 

# skyWeather deps
sudo apt install pkg-config mariadb-server python3-pip git

# dust sensor
sudo apt install pigpio python-pigpio python3-pigpio python3-future

# camera deps
sudo apt install python3-rpi.gpio libopenjp2-7-dev libtiff-dev fonts-freefont-ttf

# dash deps, install with apt and not pip for version compatability 
# https://numpy.org/devdocs/user/troubleshooting-importerror.html
# https://pandas.pydata.org/pandas-docs/stable/getting_started/install.html#install
sudo apt install python3-numpy python3-pandas

# MQTT
# https://pimylifeup.com/raspberry-pi-mosquitto-mqtt-server/
sudo apt install mosquitto mosquitto-clients

# setup mariadb
# TODO the SkyWeather app looks to use root to access the db
sudo mysql_secure_installation

# i would recommend allowing remote access so you can use better tools like dbeaver to look at db
sudo bash -c 'sed -i "s/^bind-address.*\$/bind-address=0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf'
sudo systemctl restart mysql

# add python libraries
sudo python3 -m pip install apscheduler remi mysqlclient future i2cdevice gpiozero pigpio 
sudo python3 -m pip install paho-mqtt vcgencmd python-aqi ffmpeg smbus smbus2
sudo python3 -m pip install SafecastPy
# camera deps
sudo python3 -m pip install picamera pillow
# dash deps
# sudo python3 -m pip install dash dash-bootstrap-components dash_daq psutil 
# https://forum.switchdoc.com/thread/1890/dash-components-update-crashes-app
sudo python3 -m pip install dash==1.21.0 dash-bootstrap-components==0.13.0 dash-core-components==1.17.1 dash-daq==0.5.0 dash-html-components==1.1.4 dash-table==4.12.0
sudo python3 -m pip install psutils

# disable unused services
# https://github.com/wertarbyte/triggerhappy
sudo systemctl disable triggerhappy.service 
# https://avahi.org/
sudo systemctl disable avahi-daemon.service
# blue tooth
sudo systemctl disable hciuart.service
sudo systemctl disable bluetooth.service
# wifi
sudo systemctl disable wpa_supplicant.service

# switchdoclabs software defined radio data reciever
git clone https://github.com/switchdoclabs/rtl_433.git

cd rtl_433/
mkdir build
cd build
cmake ..

# TODO add switch with unput

make
sudo make install

# skyweather software
cd
git clone https://github.com/switchdoclabs/SDL_Pi_SkyWeather2.git

# load sql
sudo mysql -u root -p < SkyWeather2.sql
sudo mysql -u root -p < WeatherSenseWireless.sql

# make sure to enable camera and I2C module
sudo raspi-config

# start config app
# use browser to config
cd SDL_Pi_SkyWeather2
python3 SkyWeatherConfigure.py

# test camera make sure no errors
sudo python3 testSkyCamera.py

# test sensors
sudo python3 testWirelessSensors.py
