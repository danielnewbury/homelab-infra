# Media Finders (*arr stack)

Includes:
- Sonarr
- Radarr
- Lidarr
- Readarr (books + audio)
- Prowlarr

## Notes
- Connects to external `media-network`
- Downloaders live in a separate stack
- All paths are shared via `/data*` for atomic moves

## Usage
```bash
cp .env.example .env
docker compose up -d
