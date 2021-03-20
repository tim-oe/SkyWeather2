# service scripts

scripts for making SkyWeather2 applications into [systemd](https://wiki.debian.org/systemd/documentation) services.
verify that everything is working first it'll make life easier.

## setup
- copy to /lib/systemd/system
- sudo systemctl enable [service name].service
- sudo systemctl start [service name].service
- sudo systemctl status [service name].service

## scripts
- [SkyWeather2 Configuration Service](skyconfig.service)
- [skyWeather2 Service](skyweather.service)
- [Dashboard Service](skydash.service)