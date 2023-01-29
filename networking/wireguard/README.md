## This setup is for a site2site connection where the router exposes all devices on the network.

### Router
if needed update the ip/domain of the server Endpoint in `wg0.conf`

```
cd router
docker network create --subnet 172.21.0.0/24 wgnet
docker compose up
```

### Server
```
cd server
docker compose up
```

### Check connection status
```
docker exec -it wireguard-router wg show
docker exec -it wireguard-server wg show
```

> this setup allows a single connection between one router and one server.
> to connect multiple routers, can start multiple servers on different exposed ports and setup the routers to connect to the alternative port.

