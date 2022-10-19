# Access devices behind a firewall or behind a LTE router or a firewall

## Using Balena 
 - Create tunnel to the ssh server

```
balena tunnel dfe2c52af38404de1a8d26bd28d686b5 -p 22222:22222
```
 -  Reverse port forwarding from the remote ip and port `192.168.88.1` to the local port `1111`
 
 ```
 ssh -L 1111:192.168.88.1:80 -p 22222 root@127.0.0.1
 ```

## Using  a vpn server. The router connects as a client and allows access to all devices on the local network.
> works only on Linux or OSX

```
docker run -e VPN_IPSEC_PSK=xxx -e VPN_USER=vpnuser -e VPN_PASSWORD=xxx --net=host -it --rm --privileged hwdsl2/ipsec-vpn-server
```
Wait for the connection to be established and run the command below to setup the correct routing.
> NOTE: should run the command again after every disconnect.
```
sudo ip route add 192.168.88.0/24 dev ppp0
```

# Allow access to webfig on a mikrotik router

```
iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 8888 -j DNAT --to-destination 192.168.89.1:80

iptables -A FORWARD -p tcp -d 192.168.89.1 --dport 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
```