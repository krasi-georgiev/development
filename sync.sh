#!/usr/bin/bash


function sync() {
    rsync -avz --recursive -R --delete --prune-empty-dirs --exclude '.git' --info=progress2 -e 'ssh -p2222 ssh -p22 -o "StrictHostKeyChecking=no"' /home/krasi/src/github.com/cryptoriums/flashbot  root@localhost:/
    rsync -avz --recursive -R --delete --prune-empty-dirs --exclude '.git' --info=progress2 -e 'ssh -p2222 ssh -p22 -o "StrictHostKeyChecking=no"' /home/krasi/src/github.com/cryptoriums/packages  root@localhost:/
}

sync

while inotifywait -r -e modify,create,delete /home/krasi/src/github.com/cryptoriums/packages /home/krasi/src/github.com/cryptoriums/flashbot
do
    sync
done 