## Apa yang Baru

Tidak ada fitur baru pada release ini — murni bug fix installer.

## Bug Fixes

- Installer menampilkan (dan set CORS `ALLOWED_ORIGINS` ke) IP privat yang tidak bisa diakses dari luar, pada VPS cloud yang meng-NAT/float-kan IP publik ke interface yang tidak pernah terlihat langsung oleh VM. Sekarang dicoba dulu lookup IP publik via layanan echo eksternal, baru fallback ke deteksi rute lokal untuk instalasi on-prem/LAN-only.

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://get.telepati.id | sudo bash
sudo telepati install
```

## Upgrade dari v0.1.0-alpha.6

```bash
sudo telepati update apply
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
