## Apa yang Baru

Tidak ada fitur baru pada release ini — patch fix.

## Bug Fixes

- **Dashboard Finance**: halaman Finance bisa terjebak loading tanpa henti dan berulang kali memanggil API ringkasan/pengeluaran (terlihat seperti serangan beruntun di access log, padahal itu satu tab browser yang memuat ulang data dengan sendirinya tanpa henti). Perbaikan ini menghentikan perilaku tersebut.

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

Migration database berjalan otomatis saat service restart pasca-upgrade. Tidak ada migration baru pada release ini — skema database sama seperti v0.8.0.

Kalau workspace Anda sempat mengalami masalah "loading terus" di halaman Finance pada v0.8.0, cukup upgrade ke versi ini — tidak perlu langkah tambahan lain.

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
