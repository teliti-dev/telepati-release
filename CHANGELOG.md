# Changelog

Semua perubahan notable pada Telepati didokumentasikan di sini.

Format mengikuti [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versi menggunakan zero-padded semver: `v01.02.001` ≡ `v1.2.1`.

---

## [Unreleased]

_(tambahkan perubahan di sini saat develop, sebelum release)_

### Added

### Fixed

### Changed

### Removed

---

## [v00.01.000] — 2026-05-21

### Added
- Docker install wizard — proxy mode (direct IP, Caddy+domain, Cloudflare Tunnel), database (managed/external), admin credentials, SMTP opsional
- Bare install wizard — setup langsung di server Ubuntu/Debian sebagai systemd service via `sudo telepati install bare`
- Ed25519 offline license key validation — license key terenkripsi, diverifikasi saat instalasi tanpa butuh koneksi internet
- `install.sh` — one-liner installer untuk Linux amd64/arm64
- CI/CD release pipeline — GoReleaser + Docker Hub multi-arch (amd64/arm64)

---

[Unreleased]: https://github.com/teliti-dev/telepati-release/compare/v00.01.000...HEAD
[v00.01.000]: https://github.com/teliti-dev/telepati-release/releases/tag/v00.01.000
