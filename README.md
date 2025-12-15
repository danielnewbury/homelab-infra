# Homelab Infrastructure

This repository is the **source of truth** for my homelab.

## Principles
- Git stores desired state
- Hosts are disposable
- Configuration is reproducible
- Secrets do not live in Git

## Structure
- `docker/`     → Docker Compose stacks
- `baremetal/`  → Non-containerised services (Pi-hole, base OS)
- `inventory/`  → Host definitions
- `ansible/`    → Optional automation
- `secrets/`    → Documentation only (no real secrets)

## Rebuild Goal
Any node should be rebuildable in **< 10 minutes**.
