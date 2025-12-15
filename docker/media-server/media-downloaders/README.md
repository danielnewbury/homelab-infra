# Media Downloaders Stack

VPN-routed downloader stack using Gluetun.

## Services
- Gluetun (VPN gateway)
- SABnzbd
- qBittorrent

## Notes
- SABnzbd and qBittorrent run in Gluetun's network namespace
- No external Docker networks required
- Ports are exposed on the Gluetun container only

## Usage
```bash
cp .env.example .env
docker compose up -d

