## Apa yang Baru

- **License system tiers** — feature gates, resource limits per tier (Ertewe/Pro/Business), mode read-only saat license kedaluwarsa
- **Zero-restart auto-rotate** — saat license diperpanjang, server otomatis aktivasi kunci baru dan hot-swap tanpa restart
- **Online license validation** — heartbeat ke license server setiap 6 jam, CA cert di-pin di binary production (tidak bisa di-spoof)
- **License CLI** — `telepati license set/status/deactivate/refresh` untuk kelola license dari terminal
- **Dashboard embedded di binary** — frontend di-serve langsung oleh backend, tidak perlu web server terpisah
- **Installer v2** — wizard 9-step, `telepati update apply` + rollback otomatis, `diagnose` dan `logs` management
- **WhatsApp Gateway** — integrasi `telepati-wa` sebagai service terpisah, multi-device, template CRUD, riwayat pesan
- **CLI `docker` subcommand** — kelola container layanan telepati langsung dari CLI

## Bug Fixes

- Docker Hub image name diperbaiki: `teliti/telepati` (sebelumnya `teeliti/telepati`)

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://telepati.in/install.sh | bash
```

Atau download binary langsung dari [GitHub Releases](https://github.com/teliti-dev/telepati-release/releases/tag/v0.2.0).

## Upgrade dari v0.1.0

```bash
sudo telepati update apply
```

Jika binary lama belum support `update apply`, download manual:

```bash
curl -fsSL https://telepati.in/install.sh | bash
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
