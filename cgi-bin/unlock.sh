#!/bin/sh
REMOTE_MAC=`cat /proc/net/arp | awk '{print $1,$4}' | grep "^${REMOTE_HOST} " | cut -d ' ' -f2`
iptables -t nat -I prerouting_lan -s ${REMOTE_HOST} -m mac --mac-source ${REMOTE_MAC} -j ACCEPT
iptables -I wifi_hotspot -s ${REMOTE_HOST} -m mac --mac-source ${REMOTE_MAC} -j ACCEPT

uri='http://www.laou.me'
echo "Content-type: text/html"
echo "Status: 302 Temporary Redirect"
echo "Location: $uri"
echo ""
