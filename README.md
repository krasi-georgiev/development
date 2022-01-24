## Dev container

### K8s
kubectl run -it --attach podName --image=golang:1.17.2-buster

# Balena
balena run -it --net=host --name=containerName --privileged --restart unless-stopped golang:1.17.2-buster /bin/bash


apt-get update && apt install -y build-essential git nano wget curl libatomic1 rsync
bash -c "$(curl -sSL https://raw.githubusercontent.com/microsoft/vscode-dev-containers/main/script-library/sshd-debian.sh)" -- 22 $(whoami) true random
mkdir -p /root/.ssh/
nano /root/.ssh/authorized_keys


kubectl expose pod podName --port=22 --type=NodePort --name=podName-ssh

# To see the auto generated external service port.
# There is no way to set external port using the cli. Can only be set using yaml file.
kubectl get service
