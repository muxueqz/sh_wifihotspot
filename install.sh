#!/bin/sh
cp -R ../wifihotspot_cgi/ /overlay/
echo '00 0 * * * /overlay/wifihotspot_cgi/init.sh 2>/dev/null #wifi_hotspot_reinit' | crontab -
sed -i 's/exit 0//g' /etc/rc.local
echo '/overlay/wifihotspot_cgi/init.sh' >> /etc/rc.local
