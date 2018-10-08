#!/bin/bash

set -e

USER_UID=1000
USER_GID=1000

USER_NAME=$(getent passwd "$USER_UID" | cut -d: -f1)

declare -A SHARES
SHARES["AWSOnMac"]="/home/$USER_NAME/.aws"
SHARES["SSHOnMac"]="/home/$USER_NAME/.ssh"
SHARES["ProjectsOnMac"]="/home/$USER_NAME/Projects"

start() {
  for SHARE in "${!SHARES[@]}"
  do 
    if [ ! -d "${SHARES[$SHARE]}" ]
    then
      mkdir "${SHARES[$SHARE]}"
      chown "${USER_NAME}":"${USER_NAME}" "${SHARES[$SHARE]}" 
      chmod 0700 "${SHARES[$SHARE]}"
    fi
    if [ -d "${SHARES[$SHARE]}" ]
    then
      mount -t vboxsf "${SHARE}" "${SHARES[$SHARE]}" -o uid=${USER_UID},gid=${USER_GID}
    fi
  done
}

stop() {  
  for SHARE in "${!SHARES[@]}"
  do 
    if [ -d "${SHARES[$SHARE]}" ]
    then
      umount "${SHARES[$SHARE]}"
      rmdir "${SHARES[$SHARE]}"
    fi
  done
}

case $1 in
  start|stop) "$1" ;;
esac
