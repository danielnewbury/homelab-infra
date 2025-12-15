#!/bin/bash
set -e

BACKUP_DIR=/opt/backups/pihole
mkdir -p "$BACKUP_DIR"

tar czf "$BACKUP_DIR/pihole-$(date +%F).tar.gz" \
  /etc/pihole \
  /etc/dnsmasq.d

echo "Backup complete"
