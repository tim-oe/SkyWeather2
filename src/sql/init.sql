-- tweaks for mariadb
-- TODO temp need to make user for skyWeather db
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;

CREATE USER 'skyweather'@'localhost' IDENTIFIED BY 'skyweather';

GRANT INSERT, UPDATE, SELECT ON skyweather2.* TO 'skyweather'@'localhost';
GRANT INSERT, UPDATE, SELECT ON WeatherSenseWireless.* TO 'skyweather'@'localhost';
