#!/bin/bash

set -Eeuo pipefail

TIMESTAMP=$(date -u +"%Y-%m-%dT%H-%M-%SZ")
JOPLIN_DIR="$HOME/.config/joplin-desktop"
JOPLIN_BACKUP_DIR="$HOME/Documents/joplin-backups"
JOPLIN_BACKUP="joplin-backup-$TIMESTAMP.zip"

echo "Backing up $JOPLIN_DIR"

zip -r "$JOPLIN_BACKUP_DIR/$JOPLIN_BACKUP" "$JOPLIN_DIR"
