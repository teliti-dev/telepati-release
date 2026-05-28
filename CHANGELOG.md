# Changelog

Semua perubahan notable pada Telepati didokumentasikan di sini.

Format mengikuti [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versioning menggunakan [Semantic Versioning](https://semver.org/): `vMAJOR.MINOR.PATCH`.

---

## [Unreleased]

### Added

### Fixed

### Changed

### Removed

---

## [v0.0.2] — 2026-05-28

### Added
- Network map backend v2 — tube model (configurable core counts, colors), cable codes, JoinBox device type, core joins, list APIs
- Topology validation & network graph engine (T-008) — cascading ratio checks, path closed detection, mid-route stub warnings, custom core colors
- PPPoE proxy (T-022) — RouterOS client, PPPoE servers, PPP profiles, PPP secrets CRUD + sync
- Production readiness (T-006) — security headers, rate limiter, production docker compose
- Self-hosted anti-crack hardening (T-040)
- License flexible limits from Portal + WhatsApp feature gate (T-038)
- License expired read-only mode (T-036)
- VPN peer self-registration via dashboard (T-041) — native WireGuard, QR code, RouterOS config
- Cloud entrypoint (T-039) — cmd/cloud, organizations, subscriptions, tier limits
- VPN WireGuard tunnel (T-035) — vpn_peers table, agent binary, heartbeat, stale peer sweep

### Fixed
- VPN RouterOS config — add ip route to VPN network
- Cross-origin cookie SameSite None for T-041
- Workspace orgID on creation (fix 403)
- Migrations TEXT/UUID type mismatch in cloud migrations

### Changed
- Ansible deploy playbook for Telepati Cloud server

---

## [v0.2.0] — 2026-05-26

### Added
- License system tiers — feature gates (`RequireFeature`), resource limits (`CheckLimit`), expiry read-only mode (`EnforceExpiry`), quota endpoint `/license/quota`
- License CLI commands — `telepati license set <key>`, `status`, `deactivate`, `refresh` dengan output tier + expiry + fitur aktif
- Online license validation — heartbeat ke `license.telepati.in:8443` setiap 6 jam; CA cert di-pin di binary production
- Zero-restart auto-rotate — saat license diperpanjang (HTTP 410), server auto-aktivasi kunci baru, simpan ke `/etc/telepati/telepati.conf`, hot-swap `atomic.Pointer` tanpa restart
- Workspace & member limit checks — middleware `CheckLimit` dan `CheckUserWorkspaceLimit` terpasang di route creation
- Dashboard SPA served from backend — `GET /*` di Fiber serves embedded `frontend/dist/`; release pipeline frontend otomatis update binary
- Installer v2 — 9-step wizard, `telepati update apply` + rollback, `telepati manage logs/diagnose`, dry-run mode
- CLI `docker` subcommand — kelola container telepati-wa dan layanan lain tanpa masuk ke server
- WhatsApp Gateway (`telepati-wa`) — integrasi go-whatsapp-web-multidevice sebagai service terpisah, multi-device
- WhatsApp templates CRUD + sent messages persistence layer — simpan riwayat pesan outbound per workspace

### Fixed
- Docker Hub image name `teliti/telepati` (sebelumnya salah: `teeliti`)

### Changed
- `INTERNAL_MODE` pindah dari env var ke build tag `//go:build internal` — tidak bisa di-override di runtime production
- Installer refactor — replace INTERNAL_MODE env var dengan build tag

---

## [v0.1.0] — 2026-05-21

### Added
- Docker install wizard — proxy mode (direct IP, Caddy+domain, Cloudflare Tunnel), database (managed/external), admin credentials, SMTP opsional
- Bare install wizard — setup langsung di server Ubuntu/Debian sebagai systemd service via `sudo telepati install bare`
- Ed25519 offline license key validation — license key terenkripsi, diverifikasi saat instalasi tanpa butuh koneksi internet
- `install.sh` — one-liner installer untuk Linux amd64/arm64
- CI/CD release pipeline — GoReleaser + Docker Hub multi-arch (amd64/arm64)

---

[Unreleased]: https://github.com/teliti-dev/telepati-release/compare/v0.0.2...HEAD
[v0.0.2]: https://github.com/teliti-dev/telepati-release/compare/v0.2.0...v0.0.2
[v0.2.0]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/teliti-dev/telepati-release/releases/tag/v0.1.0
