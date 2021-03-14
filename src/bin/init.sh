#!/bin/bash

# add dependent libraries 
sudo apt update
sudo apt upgrade
# https://forum.switchdoc.com/thread/1482/cmake
sudo apt install libtool libusb-1.0-0-dev librtlsdr-dev rtl-sdr build-essential autoconf cmake pkg-config mariadb-server python3-pip git

# setup mariadb
# TODO the SkyWeather app looks to use root to access the db needs to change
sudo mysql_secure_installation

# i would recommend allowing remote access so you can use better tools like toad to look at db
sudo bash -c 'sed -i "s/^#\?\.bind-address*\$/bind-address=0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf';

# startup ssh
# sudo systemctl enable ssh
# sudo systemctl start ssh

# TODO setup
# add python libraries
sudo python3 -m pip install apscheduler remi mysqlclient future i2cdevice

# get SkyWeather driver
git clone https://github.com/switchdoclabs/rtl_433.git

cd rtl_433/
mkdir build
cd build
cmake ..
make
sudo make install

# skyweather software
cd
git clone https://github.com/switchdoclabs/SDL_Pi_SkyWeather2.git

# load sql
sudo mysql -u root -p < WeatherSenseWireless.sql

# start config
cd SDL_Pi_SkyWeather2
python3 SkyWeatherConfigure.py
