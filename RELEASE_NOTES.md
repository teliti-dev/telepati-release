## Apa yang Baru

- Wizard baru `sudo telepati setup` memandu setup admin/workspace, Cloudflare Tunnel opsional, dan VLAN workspace langsung dari terminal.
- Parent interface VLAN dideteksi otomatis dari default route; subnet dapat dipilih otomatis, sedangkan VLAN ID tetap mengikuti trunk switch/router Anda.
- Wizard aman dijalankan ulang dan memakai workspace yang sudah ada tanpa menduplikasi interface atau rule DNAT.
- Service VLAN kini selalu memakai port standar dari sisi MikroTik, lalu DNAT ke IP backend internal `10.255.255.1` dengan port custom yang bebas konflik.
- Alur approval akun seller dan penyimpanan file privat terkelola.
- Pengalaman dashboard, billing/finance, pelanggan, paket, laporan, dan pengaturan tampilan yang diperbarui.
- Installer, migrasi, update, dan rollback kini berjalan sebagai satu alur zero-touch yang terverifikasi checksum.

## Perbaikan Upgrade

- VLAN workspace kini memiliki policy systemd-networkd sendiri, sehingga konfigurasi DHCP catch-all dari Netplan tidak dapat menghapus gateway dan IP service beberapa saat setelah wizard selesai.
- Target DNAT tidak lagi memakai IP management/DHCP server. Interface dummy `telepati-core` menyediakan backend persisten yang tidak diekspos ke jaringan management.
- Mapping VLAN sekarang lengkap: RADIUS auth/accounting, ACS, DNS UDP/TCP, Isolir Web, dan Hotspot Portal.
- RADIUS mempunyai listener backend terpisah untuk authentication dan accounting; DNS Isolir sekarang mendukung transport UDP maupun TCP.
- Sesi login kini tetap aktif setelah refresh pada akses HTTP via IP; koneksi HTTPS melalui Cloudflare/Caddy tetap memakai cookie `Secure`.
- IP Hotspot pada VLAN workspace tetap melayani port 80 dan diteruskan ke backend port 8082 secara otomatis.
- Installer tidak lagi membuat alias IP atau listener service pada interface utama server. IP khusus service dibuat pada VLAN per workspace dan backend memakai interface internal khusus.
- Fresh install pada OS baru otomatis menunggu dan mencoba ulang jika `unattended-upgrades` masih memegang lock apt/dpkg.
- Isolir Web dan Hotspot Portal tidak lagi berebut port 80 ketika VPS tidak mendukung IP alias; installer memakai fallback port 8082 dan updater memperbaiki instalasi alpha.16 yang terdampak secara otomatis.
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
sudo telepati install
sudo telepati setup
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
