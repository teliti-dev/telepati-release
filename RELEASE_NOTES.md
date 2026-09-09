## Apa yang Baru

- Alur approval akun seller dan penyimpanan file privat terkelola.
- Pengalaman dashboard, billing/finance, pelanggan, paket, laporan, dan pengaturan tampilan yang diperbarui.
- Installer, migrasi, update, dan rollback kini berjalan sebagai satu alur zero-touch yang terverifikasi checksum.

## Perbaikan Upgrade

- Fresh install membuat private managed-file storage dengan mode `0750`, konsisten dengan host yang di-upgrade.
- Host lama sekarang otomatis memperoleh direktori private managed-file dengan ownership dan permission yang benar sebelum service versi baru dijalankan.
- Update check sekarang membaca versi deployment aktual dari `state.db`, sehingga refresh CLI dari alpha.12 tidak lagi membuat updater salah menganggap service lama sudah terbaru.
- `telepati manage migrate` tidak lagi membutuhkan executable eksternal.
- `telepati update apply` memperbarui service, dashboard, dan CLI ke versi yang sama.
- Kegagalan startup atau health check mengembalikan binary dan dashboard otomatis.
- Pemilihan versi alpha/beta mengikuti semantic version tertinggi.

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://raw.githubusercontent.com/teliti-dev/telepati-release/main/install.sh | sudo bash
```

## Upgrade dari versi sebelumnya

Khusus dari `v0.1.0-alpha.12` atau lebih lama, refresh CLI satu kali sebelum update:

```bash
curl -fsSL https://raw.githubusercontent.com/teliti-dev/telepati-release/main/install.sh | sudo bash
sudo telepati update apply
```

Mulai alpha.13, CLI dan service memakai binary deployment yang sama sehingga release berikutnya cukup menjalankan `sudo telepati update apply`.

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
