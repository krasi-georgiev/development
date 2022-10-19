## Dev container

### K8s
```
kubectl run -it --attach dev --image=golang:1.17.2-buster
```
```
kubectl expose pod dev --port=22 --type=NodePort --name=dev-ssh
```

> To see the auto generated external service port.<br/>
There is no way to set external port using the cli. Can only be set using yaml file.
```
kubectl get service
```

### Balena

```
balena run -it -v /:/host-data --net=host --name=dev --privileged --restart unless-stopped golang:1.17.2-buster /bin/bash
```

```
apt-get update && apt install -y sudo build-essential git nano wget curl libatomic1 rsync
bash -c "$(curl -sSL https://raw.githubusercontent.com/microsoft/vscode-dev-containers/main/script-library/sshd-debian.sh)" -- 22 $(whoami) true random
export PATH="/usr/local/go/bin:$PATH"
mkdir -p /root/.ssh/
nano /root/.ssh/authorized_keys
```

