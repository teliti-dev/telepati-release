## Apa yang Baru

Tidak ada fitur baru pada release ini — patch fix.

## Bug Fixes

- **Dashboard**: kartu perhatian "Koneksi pelanggan offline" di halaman utama sekarang mengarahkan ke filter yang benar di halaman Pelanggan (status koneksi PPPoE = offline). Sebelumnya salah mengarah ke filter status akun "Aktif", sehingga daftar yang tampil tidak sesuai dan filter offline terlihat tidak ada.

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

Migration database berjalan otomatis saat service restart pasca-upgrade. Tidak ada migration baru pada release ini — skema database sama seperti v0.8.1.

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
