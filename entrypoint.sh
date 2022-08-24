#!/bin/sh

# Set route
/sbin/ip -4 rule add from $(ip route get 1.1.1.1 2>/dev/null | grep -oP 'src \K\S+') lookup main prio 18
# Start WireGuard
mkdir -p /etc/wireguard
/usr/bin/wg-quick up wgcf
# Force change DNS
echo "nameserver 8.8.8.8" | tee /etc/resolv.conf
# Keep VPN connection
while(true); do
    sleep 30
    /usr/bin/curl --connect-timeout 5 \
        --silent https://1.0.0.1/cdn-cgi/trace
    if [ $? != 0 ]; then
        /usr/bin/killall socks5
    fi
done &
# Start proxy server
/usr/local/bin/socks5
