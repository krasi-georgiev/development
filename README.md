dev container

kubectl run -it --attach double --image=golang:1.17.2-buster
apt-get update && apt install -y build-essential git nano wget curl libatomic1 rsync
bash -c "$(curl -sSL https://raw.githubusercontent.com/microsoft/vscode-dev-containers/main/script-library/sshd-debian.sh)" -- 2222 $(whoami) true
mkdir -p /root/.ssh/
nano /root/.ssh/authorized_keys
