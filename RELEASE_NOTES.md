## Apa yang Baru

- Installer sekarang otomatis mengisi alamat IP dedicated per-service (RADIUS, ACS, Isolir DNS, Isolir Web) dari IP host yang terdeteksi saat instalasi direct-mode baru — tidak perlu lagi edit `telepati.conf` manual. Kalau Isolir Web dan Hotspot Portal berpotensi bentrok di port 80 memakai IP yang sama, installer otomatis mencari alamat IP kosong lain di subnet lokal dan mengalokasikannya secara terpisah (tersimpan permanen, bertahan setelah reboot).
- Pola UI "+ Filter → pilih field → chip" kini konsisten di halaman Accounts, Packages, Billing, Hotspot Voucher, Seller Accounts, dan Network Map.
- Filter `?type=` pada API daftar device infrastruktur.

## Bug Fixes

- Captive Portal, RADIUS, dan DNS masing-masing punya logika sendiri (dan tidak konsisten) untuk menentukan "dedicated IP" sebuah workspace — sekarang disatukan, memperbaiki bug dua workspace dengan topologi jaringan berbeda (VLAN vs WireGuard) yang bisa menampilkan alamat sama karena urutan prioritas yang salah.
- Field "Redirect IP" di halaman DNS tidak bisa dikosongkan kembali ke mode otomatis setelah diisi manual.
- Wizard setup redirect HTTP di halaman Isolir menolak membuat command Mikrotik untuk workspace yang mengandalkan alamat otomatis (VLAN/WireGuard).
- Server Isolir DNS/HTTP yang benar-benar berjalan (bukan cuma tampilan dashboard) salah redirect ke alamat tunnel WireGuard milik server sendiri, atau tidak redirect sama sekali, untuk workspace tanpa alamat manual — sekarang memakai alamat yang benar.
- Wizard auto-provisioning RADIUS di Mikrotik mengharuskan mengetik ulang alamat IP yang sudah ditampilkan di halaman yang sama; contoh command manualnya juga masih pakai alamat contoh yang tidak sesuai.
- Installer menulis unit systemd untuk RADIUS, ACS, Hotspot Portal, Worker, dan AI Agent, tapi tidak pernah mengaktifkan/menjalankannya — instalasi baru diam-diam meninggalkan kelima service ini mati tanpa peringatan apa pun.
- Judul halaman hilang di sekitar 40 halaman dashboard akibat cleanup sebelumnya yang belum tuntas.

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://raw.githubusercontent.com/teliti-dev/telepati-release/main/install.sh | sudo bash
```

## Upgrade dari versi sebelumnya

```bash
sudo telepati update
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
