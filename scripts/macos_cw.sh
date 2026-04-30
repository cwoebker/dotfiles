

# Bluetooth keeps mac running at night:

# log show --style syslog | fgrep "Wake reason"
# pmset -g assertions # what keeps mac from going to sleep?

# sudo pmset -a hibernatemode 25
# sudo pmset -a standby 0
# sudo pmset -a autopoweroff 0