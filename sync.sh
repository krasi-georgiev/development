#!/usr/bin/bash

REMOTE_HOST="f5ef805.local"
REMOTE_PORT=22

FOLDERS=("/home/krasi/src/github.com/arribada/i360" "/home/krasi/src/github.com/arribada/zeroconf")


function sync() {
    for FOLDER in ${FOLDERS[@]}; do
        rsync -avz --recursive -R --delete --prune-empty-dirs --exclude '.git' --info=progress2 -e 'ssh -p'"$REMOTE_PORT"' -o "StrictHostKeyChecking=no"' $FOLDER  root@$REMOTE_HOST:/
    done
}

sync

while inotifywait -r -e modify,create,delete $FOLDERS
do
    sync
done 