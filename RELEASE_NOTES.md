## Apa yang Baru

- `telepati services` — tabel status semua service (state, PID, memori, CPU, uptime) dalam satu perintah; `restart`/`logs`/`start`/`stop`/`status` sekarang bisa diarahkan ke service tertentu (bukan cuma `telepati` API server saja).
- `telepati uninstall` — menghapus semua yang dibuat installer (systemd unit, sudoers, WireGuard, alias IP per-service, config Caddy/cloudflared, `/opt/telepati`, `/etc/telepati`, `/var/log/telepati`, user sistem `telepati`). Database dan `/var/lib/telepati` (state.db, captive portal templates) TIDAK ikut dihapus secara default — pakai `--purge-data` untuk ikut menghapusnya juga (backup otomatis dibuat lebih dulu).
- `telepati manage backup`/`restore` sekarang membuat/memulihkan satu archive lengkap (database + state.db + captive portal templates + telepati.conf), bukan cuma dump database. Archive di atas 1024 MB otomatis dipecah jadi beberapa bagian; restore menggabung dan memverifikasi checksum sebelum diproses.

## Bug Fixes

- `telepati update check`/`update apply` (tanpa `--version`) selalu melaporkan "sudah versi terbaru" walau sebenarnya ada rilis baru — versi CLI sendiri belum tersambung dengan benar ke perbandingan versi.
- `telepati update apply` mengganti binary RADIUS dan Hotspot Portal tapi tidak pernah me-restart service-nya, sehingga versi lama tetap berjalan diam-diam sampai di-restart manual.

## Perubahan Lain

- Service DNS di-rename dari `telepati-isolir-dns` menjadi `telepati-dns` (binary, systemd unit, referensi CLI) — service ini dipakai baik oleh redirect-DNS Isolir maupun hotspot, bukan cuma Isolir. `telepati update apply` di instance yang sudah ada otomatis memigrasikan unit lama ke nama baru.
- `telepati manage status`/`logs`/`diagnose` dihapus — duplikat basi dari `telepati status`/`logs`/`diagnose` di root, peninggalan mode deployment Docker/Kubernetes yang sudah tidak dipakai lagi.

## Breaking Changes

Tidak ada breaking changes pada release ini — rename service DNS ditangani otomatis lewat migrasi di `update apply`.

---

## Instalasi

```bash
curl -fsSL https://raw.githubusercontent.com/teliti-dev/telepati-release/main/install.sh | sudo bash
```

## Upgrade dari versi sebelumnya

```bash
sudo telepati update apply
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
