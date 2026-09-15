## Apa yang Baru

- **Dashboard Network Monitor**: status device infrastruktur (Mikrotik/OLT/RADIUS) sekarang real — online/offline, CPU load, uptime, dan kapan terakhir dicek, dari data `InfraDevice`. Worker proses sekarang otomatis mengecek ulang semua device setiap ~3 menit, jadi status tidak lagi basi menunggu klik "Cek Status" manual. Traffic jaringan, interface, dan log disconnect masih pratinjau data contoh, ditandai jelas "Segera Hadir" di UI.
- **Dashboard Finance**: KPI "Uang Masuk" dan "Piutang Usaha", grafik arus kas (invoice yang dibayar per periode), dan umur piutang (aging invoice belum lunas) sekarang real dari data invoice pelanggan. Tabel "Invoice Mendekati Jatuh Tempo" menggantikan tabel kewajiban vendor fiktif. KPI Uang Keluar/Arus Kas Bersih/Saldo Tersedia serta grafik pengeluaran & anggaran ditandai "Segera" — Telepati belum punya modul pencatatan biaya operasional.

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

Migration database berjalan otomatis saat service restart pasca-upgrade. Tidak ada migration baru pada release ini — skema database sama seperti v0.5.0.

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
