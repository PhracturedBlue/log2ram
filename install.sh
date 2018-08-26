#!/usr/bin/env sh

systemctl -q is-active armbian-ramlog  && { echo "ERROR: armbian-ramlog service is still running. Please run \"sudo service armbian-ramlog stop\" to stop it."; exit 1; }
[ "$(id -u)" -eq 0 ] || { echo "You need to be ROOT (sudo can be used)"; exit 1; }

# log2ram
mkdir -p /usr/local/bin/
install -m 644 etc/systemd/system/armbian-zram-config.service /etc/systemd/system/armbian-zram-config.service
install -m 644 etc/systemd/system/armbian-ramlog.service /etc/systemd/system/armbian-ramlog.service
install -m 755 usr/local/bin/armbian-zram-config /usr/local/bin/armbian-zram-config
install -m 755 usr/local/bin/armbian-ramlog /usr/local/bin/armbian-ramlog
install -m 644 etc/default/armbian-zram-config /etc/default/armbian-zram-config
install -m 644 etc/default/armbian-ramlog /etc/default/armbian-ramlog
systemctl enable armbian-zram-config
systemctl enable armbian-ramlog

# cron
install -m 755 etc/cron.daily/armbian-ram-logging /etc/cron.daily/armbian-ram-logging


# Make sure we start clean
rm -rf /var/log.hdd

echo "##### Reboot to activate log2ram #####"
