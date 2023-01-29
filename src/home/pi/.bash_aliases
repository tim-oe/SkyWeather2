alias cls='printf "\033c"'
alias aptclean='sudo apt autoremove --purge'
alias osver="cat /etc/os-release | egrep -o  PRETTY_NAME=.* | sed -E 's/PRETTY_NAME=\"(.+)\"/\1/'"
alias piver='cat /proc/device-tree/model;printf "\n"'
alias pimem="free -mh | egrep -0 Mem:.* | sed -E 's/Mem:\s+([0-9]+\.?[0-9]?[GMi]{2})\s+.*/\1/'"
alias pidisk="df -h | egrep -0 /dev/root.* | sed -E 's/\/dev\/root\s+([0-9]+[GM]?)\s+([0-9\.]+[GM]?)\s+([0-9\.]+[GM]?).*/disk total:\1 used:\2/'"
alias pitemp='vcgencmd measure_temp | egrep -o "[0-9]*\.[0-9]*.{2}"'
alias listsvc='systemctl list-unit-files --type=service'
alias listenable='systemctl list-unit-files --type=service --state=enabled'
alias liteon='sudo bash -c "echo 0 > /sys/class/backlight/rpi_backlight/bl_power"'
alias liteoff='sudo bash -c "echo 1 > /sys/class/backlight/rpi_backlight/bl_power"'
alias hdmion='sudo /opt/vc/bin/tvservice -p'
alias hdmioff='sudo /opt/vc/bin/tvservice -o'
alias screenoff='sudo vcgencmd display_power 0'
alias screenon='sudo vcgencmd display_power 1'
alias jimmies='echo 1 | sudo tee /proc/sys/kernel/sysrq;echo s | sudo tee /proc/sysrq-trigger;echo u | sudo tee /proc/sysrq-trigger;echo b | sudo tee /proc/sysrq-trigger'
