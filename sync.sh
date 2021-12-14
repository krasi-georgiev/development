#!/usr/bin/bash


while inotifywait -r -e modify,create,delete /home/krasi/src/github.com/cryptoriums/packages /home/krasi/src/github.com/cryptoriums/telliot /home/krasi/src/github.com/cryptoriums/telliot-frontr /home/krasi/src/github.com/bonedaddy/go-blocknative
do
rsync -avz --recursive -R --delete --prune-empty-dirs --exclude '.git' --info=progress2 -e 'ssh -p2222' /home/krasi/src/github.com/cryptoriums/packages  root@localhost:/
rsync -avz --recursive -R --delete --prune-empty-dirs --exclude '.git' --info=progress2 -e 'ssh -p2222' /home/krasi/src/github.com/cryptoriums/telliot  root@localhost:/
rsync -avz --recursive -R --delete --prune-empty-dirs --exclude '.git' --info=progress2 -e 'ssh -p2222' /home/krasi/src/github.com/cryptoriums/telliot-frontr  root@localhost:/
rsync -avz --recursive -R --delete --prune-empty-dirs --exclude '.git' --info=progress2 -e 'ssh -p2222' /home/krasi/src/github.com/bonedaddy/go-blocknative  root@localhost:/
done 