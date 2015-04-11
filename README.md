# telepi
.deb package to install and configure a Telegram controled RaspberryPi

This is the starting point to get inside the .deb pack

*gpio-admin:*http://www.miraculum.ch/2012/08/13/installing-and-using-quik2wire-gpio-admin/
git clone https://github.com/quick2wire/quick2wire-gpio-admin.git
cd quick2wire-gpio-admin/
make install
cd ..
rm quick2wire-gpio-admin -R
*Telegram:*https://github.com/vysheng/tg
apt-get update
apt-get -y install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make
cd /opt
git clone --recursive https://github.com/vysheng/tg.git && cd tg
./configure
make
*lighttpd+php5:*http://www.penguintutor.com/linux/light-webserver
apt-get -y install lighttpd php5-common php5-cgi php5
lighty-enable-mod fastcgi-php
service lighttpd force-reload
chown www-data:www-data /var/www
chmod 775 /var/www
usermod -a -G www-data pi
screen:http://unix.stackexchange.com/questions/110055/send-command-to-detached-screen-and-get-the-output
mkdir /var/lib/telepi
useradd -d /var/lib/telepi telepi
usermod -a -G tty telepi
mkfifo /tmp/fifoout
chown telepi:telepi mkfifo /tmp/fifoout
¿¿¿ tail -f /tmp/fifoout ??? Si queremos verlo en otro terminal aparte
screen -d -m -S telepi
screen -S telepi -X stuff 'su - telepi\n'
screen -S telepi -X stuff '/opt/tg/bin/telegram-cli -k /opt/tg/tg-server.pub -W -s telepi.lua 2>&1 | tee /tmp/fifoout\n'
