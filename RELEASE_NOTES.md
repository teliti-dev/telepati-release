## Apa yang Baru

- **Dashboard DNS Redirect**: halaman DNS Redirect kini terhubung penuh ke API DNS Redirect (v0.4.0) — summary service & upstream, konfigurasi listener/cache/query-log, redirect rules (CRUD + enable/disable), query log, dan metrics. Sebelumnya halaman ini masih memakai konfigurasi Isolir sebagai sumber data.
- **Dashboard Campaign Studio**: halaman Campaign kini benar-benar berfungsi — daftar campaign dengan filter, form create/edit lengkap (audience/placement/creative/schedule/frequency cap), lifecycle publish/pause/resume/archive, upload asset, dan analytics per-campaign. Sebelumnya halaman ini hanya menampilkan placeholder "campaign tracking belum diaktifkan".
- **Dashboard ACS Advanced Management**: halaman baru untuk Presets, Provisions, Virtual Parameters, Files, Faults & Tasks (termasuk bulk operation ke banyak device sekaligus), Audit Log, dan Config — semuanya terhubung ke API ACS Advanced Management (v0.4.0). Presets/Provisions/Virtual Parameters/Config secara jelas ditandai di UI sebagai definisi + preview/validasi saja, belum diterapkan otomatis ke sesi CWMP perangkat.

## Bug Fixes

Tidak ada bug fix pada release ini.

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://get.telepati.id/install.sh | sudo bash
```

## Upgrade dari versi sebelumnya

```bash
sudo telepati update
```

Migration database berjalan otomatis saat service restart pasca-upgrade. Tidak ada migration baru pada release ini — hanya perubahan frontend, skema database sama seperti v0.4.0/v0.4.1.

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
