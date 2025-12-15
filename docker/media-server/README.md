# Media Server Stack

Primary Docker host running:
- Plex
- *arr stack
- Downloads
- Homepage

## Notes
- Uses named volumes
- Config stored under `/docker`
- Backups handled via restic

## Deploy
```bash
docker compose up -d
