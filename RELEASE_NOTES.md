## Apa yang Baru

- Alur approval akun seller dan penyimpanan file privat terkelola.
- Pengalaman dashboard, billing/finance, pelanggan, paket, laporan, dan pengaturan tampilan yang diperbarui.
- Installer, migrasi, update, dan rollback kini berjalan sebagai satu alur zero-touch yang terverifikasi checksum.

## Perbaikan Upgrade

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

```bash
sudo telepati update apply
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
