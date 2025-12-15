#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: restore.sh <backup-file>"
  exit 1
fi

tar xzf "$1" -C /
pihole restartdns

echo "Restore complete"
