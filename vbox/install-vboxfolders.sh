#!/bin/bash

set -e

SCRIPT_NAME=vboxfolders.sh
UNIT_NAME=vboxfolders.service

cp $SCRIPT_NAME /usr/local/bin
chown root:root /usr/local/bin/$UNIT_NAME
chmod 0770 /usr/local/bin/$SCRIPT_NAME

cp $UNIT_NAME /etc/systemd/system/
chown root:root /etc/systemd/$UNIT_NAME
chmod 0644 /etc/systemd/$UNIT_NAME
sudo systemctl enable $UNIT_NAME

sudo systemctl daemon-reload
