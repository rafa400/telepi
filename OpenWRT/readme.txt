ssh-keygen
ssh-copy-id 192.168.X.X
cp /root/.ssh/authorized_keys /etc/dropbear/
ssh 192.168.X.X "iw dev wlan0 station dump" | grep Station

Future:
https://wiki.openwrt.org/doc/howto/wireless.utilities
https://wiki.openwrt.org/doc/techref/ubus
(ubus with json http access)
