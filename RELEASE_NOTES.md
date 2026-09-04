## Apa yang Baru

Tidak ada fitur baru pada release ini — murni bug fix untuk installer/updater.

## Bug Fixes

- `telepati install` dan `telepati update` gagal resolve versi terbaru ("gagal ambil versi terbaru: exit status 22") karena `/releases/latest` selalu 404 selama semua release berstatus pre-release — sekarang fallback ke daftar semua release kalau itu terjadi.
- `install.sh` sebenarnya sudah punya fallback untuk 404 yang sama, tapi tidak pernah tercapai karena `set -euo pipefail` menghentikan script duluan sebelum sampai ke fallback-nya.

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://get.telepati.id | sudo bash
sudo telepati install
```

## Upgrade dari v0.1.0-alpha.3

```bash
sudo telepati update apply
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
