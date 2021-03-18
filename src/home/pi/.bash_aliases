alias cls='printf "\033c"'
alias aptclean='sudo apt autoremove --purge'
alias osver='cat /etc/os-release'
alias piver='cat /proc/device-tree/model'
alias gputemp='vcgencmd measure_temp'
alias cputemp='cpu=$(</sys/class/thermal/thermal_zone0/temp); echo "$((cpu/1000)) c"'
p