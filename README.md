🏠 Homelab Infrastructure

This repository is the single source of truth for my homelab.

All systems are designed to be reprovisioned, not repaired.
If a machine fails, it should be faster to rebuild it from this repository than to debug it in place.

🎯 Objectives

Rebuild any node in under 10 minutes

Treat hosts as disposable

Store desired state in Git

Keep secrets out of version control

Minimise manual configuration

Prefer simple, boring, well-understood tooling

🧭 Operating Principles
Git defines reality

Running systems may drift.
This repository defines what should exist.

If something is not represented here, it is considered non-essential.

Hosts are cattle, not pets

No irreplaceable data or configuration should live on a host.

Containers are stateless where possible

Persistent data lives in volumes or external storage

Rebuilds are expected and normal

Reproducibility over cleverness

The goal is predictable recovery, not novelty.

Docker Compose over bespoke orchestration

Clear separation of concerns

Minimal cross-stack coupling

Secrets are handled out-of-band

Secrets are never committed to Git.

.env files are used at runtime

.env.example documents required values

Long-term goal: centralised secret management

📂 Repository Layout

homelab-infra/
├── docker/
│ ├── media-server/
│ ├── monitoring/
│ └── homepage/
│
├── baremetal/
│ ├── pihole/
│ └── rpi-base/
│
├── inventory/
│ ├── hosts.yaml
│ └── groups.yaml
│
├── ansible/
│ ├── playbooks/
│ └── roles/
│
├── secrets/
│ └── README.md
│
└── README.md

🧩 Docker Stacks

Docker Compose is the primary workload mechanism.

Stacks are modular, self-contained, and independently deployable.

Media Server

Located in docker/media-server/

Includes:

Downloaders (VPN-routed)

Finders (*arr stack)

Players (Plex, Audiobookshelf)

Request management (Overseerr)

Each stack:

Has its own docker-compose.yml

Uses .env for configuration

Shares common external networks where required

Monitoring

Located in docker/monitoring/

Includes:

Prometheus (metrics)

Grafana (visualisation)

Loki (logs)

Promtail (log shipping)

Monitoring is:

Read-only

Non-intrusive

Decoupled from application stacks

Grafana is the primary observability interface.

Homepage

Located in docker/homepage/

Homepage acts as:

A launcher

A service index

A lightweight status surface

It does not replace Grafana or Prometheus.

🧱 Bare Metal

Located in baremetal/

This covers non-containerised responsibilities, such as:

Pi-hole

Base OS setup

Host hardening

Hardware-specific configuration

Anything here is expected to be:

Minimal

Documented

Automatable later

📦 Inventory

Located in inventory/

Defines:

Hosts

Logical groupings

Intended roles

Used by:

Humans (documentation)

Ansible (automation)

Future orchestration tooling

🤖 Automation (Ansible)

Located in ansible/

Automation is optional but encouraged.

Principles:

Idempotent

Safe to re-run

Focused on provisioning, not babysitting

Ansible is used to:

Bootstrap hosts

Install Docker

Deploy known stacks

Apply baseline hardening

🔐 Secrets

Located in secrets/

This directory contains:

Documentation only

No credentials

No tokens

No keys

Secrets are provided via:

.env files

Manual injection

External secret stores (future)

If a secret appears in Git, it is considered a failure.

🔁 Rebuild Workflow

A typical node rebuild looks like:

Provision OS

Apply base hardening

Install Docker

Clone this repository

Inject secrets

Deploy required stacks

If a rebuild requires copying files from the old system, the design is incomplete.

🚫 Explicit Non-Goals

Snowflake servers

Click-ops as the primary configuration method

Long-lived manual state

Tight coupling between unrelated services

📌 Status

This repository is actively evolving toward:

Faster rebuilds

Better automation

Clearer documentation

Reduced operational friction

Stability comes from repeatability, not from uptime alone.