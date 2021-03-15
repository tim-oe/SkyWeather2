#!/bin/bash
# init script to add system and python deps for SkyWeather2
# requires that wifi is setup
# ssh enabled to make things easier
# ssh enabled only for key auth

# add dependent libraries 
sudo apt update
sudo apt upgrade

# remove since key is only auth used. 
# https://raspberrypi.stackexchange.com/questions/58732/remove-ssh-warning-about-default-password
sudo apt purge libpam-chksshpwd

# https://github.com/switchdoclabs/rtl_433/blob/master/README.md
# git and pip not packaged with lite
sudo apt install libtool libusb-1.0-0-dev librtlsdr-dev rtl-sdr build-essential autoconf cmake pkg-config mariadb-server python3-pip git

# setup mariadb
# TODO the SkyWeather app looks to use root to access the db
sudo mysql_secure_installation

# i would recommend allowing remote access so you can use better tools like toad to look at db
sudo bash -c 'sed -i "s/^bind-address.*\$/bind-address=0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf'
sudo systemctl restart mysql

# add python libraries
sudo python3 -m pip install apscheduler remi mysqlclient future i2cdevice

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
sudo mysql -u root -p < WeatherSenseWireless.sql

# start config app
# use browser to config
cd SDL_Pi_SkyWeather2
python3 SkyWeatherConfigure.py

# test sensors
sudo python3 testWirelessSensors.py
