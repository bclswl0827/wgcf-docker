docker run -d \
    --cap-add NET_ADMIN \
    --name wgcf \
    --restart always \
    --sysctl net.ipv4.conf.all.src_valid_mark=1 \
    --sysctl net.ipv6.conf.all.disable_ipv6=0 \
    --publish 127.0.0.1:10808:10808 \
    --volume /etc/wireguard:/etc/wireguard \
    wgcf:latest
