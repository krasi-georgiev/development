# Access devices behind a firewall or behind a LTE router

## Using Balena 
 - Create tunnel to the ssh server

```
balena tunnel dfe2c52af38404de1a8d26bd28d686b5 -p 22222:22222
```
 -  Reverse port forwarding from the remote ip and port 192.168.1.166:80 to the local port 1111
 
 ```
 ssh -L 1111:192.168.88.1:80 -p 22222 root@127.0.0.1
 ```

## Using  a vpn server. The router connects as a client and allows access to all devices on the local network.
```
docker run -e VPN_IPSEC_PSK=xxx -e VPN_USER=vpnuser -e VPN_PASSWORD=xxx --net=host -it --rm --privileged hwdsl2/ipsec-vpn-server
```
```
sudo ip route add 192.168.88.0/24 dev ppp0
```