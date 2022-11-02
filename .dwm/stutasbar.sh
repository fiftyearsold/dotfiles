#!/bin/dash

bg=#928374
fg=#ebdbb2
interval=0

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$bg^Cpu "
  printf "^c$fg^$cpu_val"
}

pkg_updates() {
  updates=$(checkupdates | wc -l)   # arch

  if [ -z "$updates" ]; then
    printf "  ^c$fg^    Fully Updated"
  else
    printf "^c$bg^updates ""^c$fg^$updates "
  fi
}

sound() {
  VOL=$(pamixer --get-volume-human | tr -d '%')
  printf "^c$bg^Vol " 
  if [ "$VOL" = "muted" ] || [ "$VOL" -eq 0 ]; then
      printf "^c$fg^-"
  else
      printf "^c$fg^$VOL"
  fi
}

mem() {
  printf "^c$bg^Mem "
  printf "^c$fg^$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/enp34s0/operstate 2>/dev/null)" in
	up) printf "^c$bg^Net ^c$fg^On" ;;
	down) printf "^c$bg^Net ^c$fg^Off" ;;
	esac
}

clock() {
	printf "^c$fg^$(date '+%b %d %H:%M')"
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(clock)  $(sound)  $(cpu)  $(mem)  $(wlan)  $updates"
done






#battery() {
#  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
#  printf "^c$blue^   $get_capacity"
#}

#brightness() {
#  printf "^c$pink^   "
#  printf "^c$pink^%.0f\n" $(cat /sys/class/backlight/*/brightness)
#}
