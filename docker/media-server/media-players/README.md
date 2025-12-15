# Media Players Stack

Playback and media-serving services.

## Services
- Plex
- Tautulli
- Audiobookshelf
- Threadfin

## Notes
- Uses external `media-network`
- Media paths are shared with media-finders and downloaders
- No database services included

## Usage
```bash
cp .env.example .env
docker compose up -d
