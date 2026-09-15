## Apa yang Baru

- **Dashboard Network Monitor**: kartu "Traffic seluruh jaringan", "Interface terpadat", dan "Disconnect terbaru" sekarang real, tidak lagi berupa pratinjau data contoh. Traffic jaringan dijumlahkan dari interface uplink yang dipilih admin (interface yang di-pin), atau interface tersibuk per device sebagai perkiraan kalau belum ada yang di-pin — kondisi ini ditandai jelas di kartu. Rentang traffic yang bisa dipilih dipersempit ke 30 menit/1 jam/2 jam mengikuti retensi data SNMP interface yang memang hanya 2 jam. Disconnect terbaru menampilkan sesi RADIUS yang baru berhenti beserta nama pelanggan; kolom alasan disconnect (mis. "Lost carrier") dihapus karena data itu memang tidak tersedia di sistem RADIUS.

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

Migration database berjalan otomatis saat service restart pasca-upgrade. Tidak ada migration baru pada release ini — skema database sama seperti v0.6.0.

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
