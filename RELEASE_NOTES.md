## Apa yang Baru

- **Modul Finance (kas & pengeluaran operasional)**: Telepati kini mencatat kas dan biaya operasional, bukan hanya piutang invoice pelanggan. Admin/accounting bisa mengelola banyak rekening kas/bank/e-wallet sekaligus (termasuk rekening penampungan dana payment gateway yang belum settlement), mencatat kategori & biaya operasional lewat alur draft → posting → void, melakukan transfer antar-rekening, serta menyusun anggaran bulanan per kategori beserta realisasinya.
- Pembayaran invoice pelanggan sekarang memilih rekening kas tujuan dan otomatis tercatat ke ledger kas — saldo kas selalu sinkron dengan uang yang benar-benar diterima.
- Lima widget dashboard Finance yang sebelumnya berstatus "Segera Hadir" (Uang Keluar, Komposisi Pengeluaran, Arus Kas Bersih, Saldo Tersedia, Realisasi Anggaran) sekarang menampilkan data nyata dari ledger kas.
- Role `manager` mendapat akses lihat-saja (read-only) ke modul Finance; role `administrator` dan `accounting` mendapat akses penuh, termasuk mencatat pembayaran invoice.

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

Migration database berjalan otomatis saat service restart pasca-upgrade. Setiap workspace existing otomatis mendapat satu rekening kas kompatibilitas ("Kas belum teralokasi") — admin disarankan masuk ke menu Finance dan mengonfigurasi rekening kas nyata (nama, tipe, saldo awal, tanggal cutover) setelah upgrade.

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
