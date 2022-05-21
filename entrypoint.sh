#!/bin/sh

# Set route
/sbin/ip -4 rule add from $(ip route get 1.1.1.1 2>/dev/null | grep -oP 'src \K\S+') lookup main prio 18
# Start WireGuard
mkdir -p /etc/wireguard
chmod 600 /etc/wireguard
/usr/bin/wg-quick up wgcf
# Force change DNS
echo "nameserver 8.8.8.8" | tee /etc/resolv.conf
# Start proxy server
/usr/local/bin/gost -L=:10808
