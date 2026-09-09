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

## [v0.1.0-alpha.18] — 2026-09-09

### Added

### Fixed
- Package installation now waits and retries for up to five minutes when Ubuntu's `unattended-upgrades` temporarily owns the apt/dpkg lock, preventing fresh installs on newly provisioned hosts from requiring a manual rerun.

### Changed

### Removed

---

## [v0.1.0-alpha.17] — 2026-09-09

### Added

### Fixed
- Fresh installs no longer fail when the host cannot attach two secondary IP aliases. Isolir Web and Hotspot Portal now select collision-free bindings for zero, one, or two available aliases, falling back to the local IP on port `8082` when needed.
- Alias addresses are only persisted after the kernel successfully attaches them; failed `ip addr add` operations can no longer produce unusable service configuration.
- Updating an affected alpha.16 installation automatically adds the collision-safe Hotspot Portal binding before required services are restarted and verified.

### Changed

### Removed

---

## [v0.1.0-alpha.16] — 2026-09-09

### Added

### Fixed
- Fresh installs now create private managed-file storage with mode `0750`, matching upgraded installations, and no longer print duplicate progress rows while creating writable storage directories.

### Changed

### Removed

---

## [v0.1.0-alpha.15] — 2026-09-09

### Added

### Fixed
- Upgrades from releases predating managed-file storage now create `/var/lib/telepati/files` with the required `telepati:telepati` ownership before starting the new service. This prevents an otherwise healthy legacy install from failing its post-update health check and rolling back.

### Changed

### Removed

---

## [v0.1.0-alpha.14] — 2026-09-09

### Added

### Fixed
- Updater now compares the target release against `installed_version` in `state.db`, not the bootstrap CLI's own version. This makes the documented alpha.12 transition correctly detect and deploy the newer service/dashboard after refreshing the CLI.

### Changed

### Removed

---

## [v0.1.0-alpha.13] — 2026-09-09

### Added
- Seller account approval flow and private managed-file storage.
- Redesigned billing, finance, package, account, dashboard, reporting, and display-preference experiences.

### Fixed
- `telepati manage migrate` now uses the migration engine embedded in the CLI and the absolute installed migration path; a separate `migrate` executable is no longer required.
- `telepati update apply` now updates and verifies the dashboard together with every service binary, synchronizes the CLI version, and rolls binary/dashboard changes back when startup or health checks fail.
- Fresh installs now keep `/usr/local/bin/telepati` linked to the deployed binary, preventing CLI and service versions from drifting apart.
- Release selection now chooses the highest semantic prerelease instead of trusting GitHub API creation order.
- Dashboard and service downloads now fail closed when their checksum is unavailable or invalid.
- The bootstrap installer now supports the published ARMv7 artifact, and the documented pinned-version command actually passes the version through `sudo`.

### Changed
- Tag pushes now trigger the complete tested release pipeline, including dashboard checksum publication.

### Removed

---

## [v0.1.0-alpha.12] — 2026-09-07

### Added
- Cloudflare Tunnel: superadmin dapat mengaktifkan tunnel token-based (tanpa perlu `cloudflared tunnel login` interaktif) langsung dari `/system/cloudflare` — atur nama tunnel, token, dan ingress rules, lalu Telepati menerapkannya otomatis ke `cloudflared` di host. Instalasi baru maupun `telepati update apply` di host lama sama-sama otomatis menyiapkan wrapper script dan sudoers scope yang dibutuhkan; `telepati uninstall` membersihkannya kembali.

### Fixed

### Changed
- `cloudflared` sekarang berjalan sebagai user `telepati` yang unprivileged, bukan root.

### Removed

---

## [v0.1.0-alpha.11] — 2026-09-07

### Changed
- SNMP Overview page redesigned from reporting the `telepati-snmp` poller process's own health into a fleet health dashboard: stat cards for devices online/offline/never-checked, a device table sorted problem-first (offline/unknown devices surface before healthy ones), and a 3-step getting-started card when no device has SNMP enabled yet. Poller process health is kept but demoted to a compact secondary card.
- ACS, DNS, and Hotspot Portal device tables also now sort offline/never-checked-in devices first, matching the SNMP page.
- Removed leftover page titles from the top header bar across ~40 pages app-wide (accounts, ACS, AI Chat, auth, billing, captive portal, extensions, hotspot, infrastructure, locations, seller, seller admin, system services/settings, technician, workspaces) — the header bar is navigation-only now, matching the current design system.

### Fixed
- ACS, DNS, and Hotspot Portal Overview pages each showed a hardcoded "Online" status for their backing service, regardless of whether it was actually running — now backed by real process health (active state, CPU, memory, uptime), turning red when the service isn't active.

---

## [v0.1.0-alpha.10] — 2026-09-06

### Added
- `telepati services` — table of every managed service's status (state, PID, memory, CPU, uptime) in one command; `restart`/`logs`/`start`/`stop`/`status` now all accept an optional service name (default: `telepati` itself) instead of only ever targeting the main API server.
- `telepati uninstall` — removes everything a bare-metal install creates (systemd units, sudoers, WireGuard interface + iptables chains, per-service IP aliases, Caddy/cloudflared config, `/opt/telepati`, `/etc/telepati`, `/var/log/telepati`, the `telepati` system user). Database and `/var/lib/telepati` (state.db, captive portal templates) are left alone by default — `--purge-data` removes those too, taking one last backup first.
- `telepati manage backup`/`restore` now produce/restore one archive covering the database, `state.db`, captive portal templates, and `telepati.conf` — not just a bare database dump. Archives over 1024 MB (configurable) are automatically split into numbered parts; restore reassembles and verifies a checksum before touching anything.

### Fixed
- `telepati update check`/`update apply` (without `--version`) always reported "sudah versi terbaru" even when a newer release existed — the CLI's own version was never wired into the comparison.
- `telepati update apply` replaced the RADIUS and Hotspot Portal binaries but never restarted their services, leaving the old process silently running until a manual restart.

### Changed
- DNS service renamed `telepati-isolir-dns` → `telepati-dns` (binary, systemd unit, CLI references) — it backs both Isolir's redirect-DNS and hotspot flows, not just Isolir. `telepati update apply` on an existing install migrates the old unit automatically.

### Removed
- `telepati manage status`/`logs`/`diagnose` — stale duplicates of the root-level `telepati status`/`logs`/`diagnose` commands, left over from a pre-bare-metal Docker/Kubernetes deployment mode that no longer exists.

---

## [v0.1.0-alpha.9] — 2026-09-06

### Fixed
- A RouterOS connection that finished authenticating just after Telepati's dial timeout expired left an authenticated session running in the background instead of being cleaned up — visible on the device as a clean login/logout pair a few seconds after Telepati had already reported "Gagal — periksa host, port, dan kredensial" to the operator. The device's login genuinely succeeded; Telepati just wasn't listening for the result anymore by the time it arrived. Late successes are now closed instead of abandoned.

---

## [v0.1.0-alpha.8] — 2026-09-06

### Added
- Installer now auto-fills per-service dedicated bind addresses (RADIUS, ACS, Isolir DNS, Isolir Web) from the host's own detected IP on a fresh direct-mode install, instead of leaving them unset until an operator manually edits `telepati.conf`. When Isolir Web and Hotspot Portal would otherwise collide on port 80 sharing that IP, the installer now ARP-probes the local subnet for free addresses and assigns each its own (persisted across reboots).
- App-wide "+ Filter → pick field → chip" UI pattern rolled out across Accounts, Packages, Billing, Hotspot Vouchers, Seller Accounts, and Network Map pages.
- `?type=` filter on the infra device list API.

### Fixed
- Captive Portal, RADIUS, and DNS each resolved a workspace's "dedicated IP" with their own independent (and inconsistent) logic — unified into a single resolver, fixing two workspaces on different network topologies (VLAN vs. WireGuard) from ever showing the same address by coincidence of tier-ordering bugs.
- DNS page's "Redirect IP" field couldn't be cleared back to auto-resolve once a manual override was set (sent `null` instead of an empty string, which the backend treats as "no change").
- Isolir page's HTTP redirect setup wizard refused to generate its Mikrotik NAT command for any workspace relying on auto-resolved addressing (VLAN/WireGuard) instead of a manual override.
- The actual running Isolir DNS/HTTP redirect servers (not just the dashboard) used to fall back to the WireGuard *server's own* tunnel IP, or nothing at all, when a workspace had no manual redirect override — silently breaking the redirect for any auto-resolved workspace. Now resolves the same VLAN/WireGuard subnet the dashboard already computes.
- RADIUS page's Mikrotik auto-provisioning wizard required re-typing an IP already shown a few lines up on the same page; its manual setup snippet also had a hardcoded example IP that didn't match the workspace's actual address.
- Installer wrote systemd units for RADIUS, ACS, Hotspot Portal, Worker, and the AI Agent, but never enabled or started any of them — a fresh install left all five inactive with no error shown, requiring an operator to discover and use the dashboard's Services panel by hand.
- Page headers (title/description) were missing on ~40 dashboard pages after an incomplete prior cleanup.

### Changed

### Removed

---

## [v0.1.0-alpha.7] — 2026-09-04

### Fixed
- Installer advertised (and set CORS `ALLOWED_ORIGINS` to) an unreachable private IP on cloud VPS hosts that float/NAT a public IP onto an interface the VM itself never sees — a public-IP echo lookup is now tried first, falling back to the previous local-routing heuristic for on-prem/LAN-only hosts.

---

## [v0.1.0-alpha.6] — 2026-09-04

### Fixed
- Re-running `telepati install` after an earlier partial-install attempt could leave the Postgres role's actual password out of sync with the freshly-regenerated `telepati.conf`, making the service fail to start with `password authentication failed for user "telepati"`. The role's password is now reset to match on every run instead of left untouched when the role already exists.

---

## [v0.1.0-alpha.5] — 2026-09-04

### Fixed
- `telepati install` failed with `database "telepati" already exists` when re-run after an earlier install attempt failed partway through (past the DB-creation step but before completing). `CREATE DATABASE` now checks existence first instead of running unconditionally.

---

## [v0.1.0-alpha.4] — 2026-09-04

### Fixed
- `telepati install` and `telepati update` failed to resolve the latest version ("gagal ambil versi terbaru: exit status 22") because `/releases/latest` 404s while every release is a pre-release — both now fall back to listing all releases when that happens.
- `install.sh`'s own fallback for the same 404 existed but was unreachable — `set -euo pipefail` aborted the script before it could run.

---

## [v0.1.0-alpha.3] — 2026-09-04

### Added
- **Web-based first-run setup screen** — `/setup` route creates the first admin + workspace through the browser after `telepati install`, calling the previously-unused `GET/POST /api/v1/setup/*` endpoints. Auto-redirects: `/auth/sign-in` → `/setup` when no admin exists yet, and back once setup is done.
- **Hotspot RADIUS + Captive Portal system** — RADIUS auth for hotspot users, guest mode, double-login policy, per-profile captive portal template selection, dashboard CRUD for portal profiles.
- **Captive Portal Template editor** — upload, rename, real nested folders with drag-and-drop move, zip upload (with folder support), public asset route for template CSS/JS/images, logo/banner support, live template preview grid.
- **Cloud captive portal hotspot authorize/deauthorize** — Telepati owns hotspot session lifecycle via the RouterOS API, opt-in per profile.
- **Router auto-provisioning** — automated MikroTik onboarding flow.
- **DNS / Captive Portal service status pages** — per-service status pages, standardized service ports (53/80/80).
- Redesigned default captive portal template — responsive, light/dark/system theme, social footer, separated CSS/JS assets.
- Redesigned workspace dashboard — consistent card styling app-wide, overdue invoices widget, "Aplikasi & CS" sidebar group split out from customer accounts.

### Fixed
- Hotspot users without a manually-set expiry date never expired (now auto-expire from first login + package validity, matching voucher behavior).
- Captive portal logout button silently hidden by an unscoped CSS selector collision.
- "Default (bawaan)" captive portal template option didn't actually render the built-in template's content.
- RouterOS hotspot command timeout handling.
- Nested folders in Upload Template `.zip` were previously rejected.

### Changed
- telepati-server is now a single monorepo (`server/` + `web/`) — the frontend previously synced from a separate `webapp` checkout.

---

## [v0.0.4] — 2026-05-28

### Added
- Network map UX update (T-043) — tiang sprite marker icons per tipe, view-only info panels, extend cable tool
- Cable management pages (T-044) — list dengan search + kode kabel, config page dengan TubeEditor visual, core colors override, core stubs management, rute kabel
- Tiang management pages (T-045) — list dengan filter tipe, config page 3 tab (perangkat, kabel, sambungan core)
- Device config pages + Join Box (T-046) — device list dengan filter tipe, config page per device, Join Box tipe baru
- Visual Splice Editor (T-047) — SVG drag-and-drop editor untuk sambungan core di Join Box, bezier curve connections, tube grouping, TIA-598 colors
- Cloud/Self-hosted build separation — pipeline terpisah: cloud binary (cloud/v* tags) vs self-hosted (v* tags), mencegah license key leak ke binary cloud

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

[Unreleased]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.18...HEAD
[v0.1.0-alpha.18]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.17...v0.1.0-alpha.18
[v0.1.0-alpha.17]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.16...v0.1.0-alpha.17
[v0.1.0-alpha.16]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.15...v0.1.0-alpha.16
[v0.1.0-alpha.15]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.14...v0.1.0-alpha.15
[v0.1.0-alpha.14]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.13...v0.1.0-alpha.14
[v0.1.0-alpha.13]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.12...v0.1.0-alpha.13
[v0.1.0-alpha.12]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.11...v0.1.0-alpha.12
[v0.1.0-alpha.11]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.10...v0.1.0-alpha.11
[v0.1.0-alpha.10]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.9...v0.1.0-alpha.10
[v0.1.0-alpha.9]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.8...v0.1.0-alpha.9
[v0.1.0-alpha.8]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.7...v0.1.0-alpha.8
[v0.1.0-alpha.7]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.6...v0.1.0-alpha.7
[v0.1.0-alpha.6]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.5...v0.1.0-alpha.6
[v0.1.0-alpha.5]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.4...v0.1.0-alpha.5
[v0.1.0-alpha.4]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.3...v0.1.0-alpha.4
[v0.1.0-alpha.3]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0-alpha.2...v0.1.0-alpha.3
[v0.0.4]: https://github.com/teliti-dev/telepati-release/compare/v0.0.2...v0.0.4
[v0.0.2]: https://github.com/teliti-dev/telepati-release/compare/v0.2.0...v0.0.2
[v0.2.0]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/teliti-dev/telepati-release/releases/tag/v0.1.0
