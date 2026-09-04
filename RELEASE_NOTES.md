## Apa yang Baru

- **Web-based first-run setup screen** — buat akun admin + workspace pertama langsung lewat browser di `/setup` setelah `telepati install`, tidak perlu lagi set `ADMIN_EMAIL`/`ADMIN_PASSWORD` manual.
- **Hotspot RADIUS + Captive Portal** — autentikasi RADIUS untuk hotspot, guest mode, kebijakan double-login, pemilihan template captive portal per profile, dashboard CRUD untuk profile portal.
- **Captive Portal Template editor** — upload file/zip (dengan dukungan folder), rename, folder nested asli dengan drag-and-drop, rute asset publik untuk CSS/JS/gambar template, dukungan logo/banner, grid preview template.
- **Cloud captive portal hotspot authorize/deauthorize** — Telepati mengelola siklus hidup sesi hotspot langsung lewat RouterOS API, opt-in per profile.
- **Router auto-provisioning** — alur onboarding MikroTik otomatis.
- **Halaman status layanan DNS / Captive Portal** — status page per-layanan, port layanan distandarisasi (53/80/80).
- Redesign template captive portal bawaan — responsive, mode light/dark/system, footer sosial media, CSS/JS terpisah.
- Redesign dashboard workspace — style card konsisten di seluruh dashboard, widget tagihan jatuh tempo, grup sidebar "Aplikasi & CS" dipisah dari daftar pelanggan.

## Bug Fixes

- Hotspot user tanpa tanggal expired manual tidak pernah expired (sekarang auto-expire dari login pertama + validitas paket, sama seperti voucher).
- Tombol logout di captive portal tersembunyi akibat bentrok CSS selector.
- Opsi template "Default (bawaan)" tidak benar-benar merender konten template bawaan.
- Timeout command RouterOS hotspot.
- Folder nested di Upload Template `.zip` sebelumnya ditolak validasi.

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://get.telepati.id | sudo bash
sudo telepati install
```

## Upgrade dari v0.1.0-alpha.2

```bash
sudo telepati update apply
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
