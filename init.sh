#!/bin/sh
WORKDIR=`dirname $0`
GATEWAY_IP=192.168.1.1
cd $WORKDIR

iptables -F wifi_hotspot
iptables -t nat -F prerouting_lan

iptables -N wifi_hotspot
iptables -I zone_lan_forward -j wifi_hotspot
iptables -A wifi_hotspot -p tcp ! --dport 80 -j DROP
#iptables -t nat -A wifi_hotspot ! -p tcp --dport 80 -j DROP
iptables -t nat -A prerouting_lan -p tcp --dport 80 -j DNAT --to $GATEWAY_IP:81
uhttpd -c http.cfg -p 81 #-f
