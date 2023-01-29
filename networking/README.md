# Access devices behind a firewall or behind a LTE router or a firewall

# The easiest site2site setup is with tailscale on their free plan. 
Use the free managed service from https://tailscale.com
Router setup https://tailscale.com/kb/1019/subnets/

## site2site with wireguard
check the dedicated folder

## Using Balena 
 - Create tunnel to the ssh server

```
balena tunnel dfe2c52af38404de1a8d26bd28d686b5 -p 22222:22222
```
 -  Reverse port forwarding from the remote ip and port `192.168.88.1` to the local port `1111`
 
 ```
 ssh -L 1111:192.168.88.1:80 -p 22222 root@127.0.0.1
 ```

## Using a vpn server. 
## Setup the router as a vpn client and run the command below to create a server 
## The router will allows access to all devices on the local network.
> works only on Linux or OSX

```
docker run -e VPN_IPSEC_PSK=xxx -e VPN_USER=vpnuser -e VPN_PASSWORD=xxx --net=host -it --rm --privileged hwdsl2/ipsec-vpn-server
```
Wait for the connection to be established and run the command below to setup the correct routing.
> NOTE: should run the command again after every disconnect.
```
sudo ip route add 192.168.88.0/24 dev ppp0
```
When a second client connects to the vpn server a new network device will be created so the router command should be
```
sudo ip route add 192.168.89.0/24 dev ppp1
```
# Allow access to webfig on a mikrotik router

```
chain input accept all from ppp # move somewhere at the top of the rules list
```