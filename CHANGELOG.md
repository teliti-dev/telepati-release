# Changelog

Semua perubahan notable pada Telepati didokumentasikan di sini.

Format mengikuti [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versioning menggunakan [Semantic Versioning](https://semver.org/): `vMAJOR.MINOR.PATCH`.

---

## [Unreleased]

_(tambahkan perubahan di sini saat develop, sebelum release)_

### Added

### Fixed

### Changed

### Removed

---

## [v0.1.0] — 2026-05-21

### Added
- Docker install wizard — proxy mode (direct IP, Caddy+domain, Cloudflare Tunnel), database (managed/external), admin credentials, SMTP opsional
- Bare install wizard — setup langsung di server Ubuntu/Debian sebagai systemd service via `sudo telepati install bare`
- Ed25519 offline license key validation — license key terenkripsi, diverifikasi saat instalasi tanpa butuh koneksi internet
- `install.sh` — one-liner installer untuk Linux amd64/arm64
- CI/CD release pipeline — GoReleaser + Docker Hub multi-arch (amd64/arm64)

---

[Unreleased]: https://github.com/teliti-dev/telepati-release/compare/v0.1.0...HEAD
[v0.1.0]: https://github.com/teliti-dev/telepati-release/releases/tag/v0.1.0
