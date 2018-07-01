#!/usr/bin/env sh

if [ "$(id -u)" -eq 0 ]
then
  systemctl stop log2ram
  systemctl disable log2ram
  rm /etc/systemd/system/log2ram.service
  rm /opt/scripts/log2ram
  rm /etc/log2ram.conf
  rm /etc/cron.weekly/log2ram
  rm /etc/logrotate.d/log2ram

  if [ -d /var/log.hdd ]; then
    rm -r /var/log.hdd
  fi
  echo "Log2Ram is uninstalled, removing the uninstaller in progress"
  rm /opt/scripts/uninstall-log2ram.sh
  echo "##### Reboot isn't needed #####"
else
  echo "You need to be ROOT (sudo can be used)"
fi
