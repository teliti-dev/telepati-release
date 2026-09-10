## Apa yang Baru

- `telepati install --domain <ip-atau-host>` — override manual IP/domain akses instalasi, tidak lagi bergantung sepenuhnya pada deteksi otomatis IP publik. Berguna untuk instalasi yang cuma boleh diakses lewat jaringan privat (mis. LXC container di belakang NAT ISP), di mana IP publik hasil deteksi otomatis bukan yang ingin dipakai operator.

## Perbaikan

- Sesi login sekarang tetap bertahan pada instalasi yang memisahkan dashboard dan API ke domain terdaftar berbeda (mis. lewat Cloudflare Tunnel dengan hostname API terpisah) — termasuk kasus subdomain di bawah domain second-level yang berstatus public suffix seperti `my.id`. Sebelumnya login awal berhasil tapi refresh token diam-diam gagal begitu access token pertama kali kedaluwarsa (~15 menit), membuat semua aksi berikutnya gagal 401 tanpa pesan error yang jelas.
- SSH Terminal tidak lagi macet selamanya di "Menghubungkan..." saat sesi ditolak server (device tidak ditemukan, sesi sudah dipakai tab/user lain, role viewer tidak diizinkan) — pesan error sekarang benar-benar ditampilkan ke pengguna.

## Keamanan

- Handshake WebSocket service stream (`telepati-stream`) sekarang menegakkan allowlist `ALLOWED_ORIGINS`, bukan menerima semua origin. Ini diperlukan begitu stream service diekspos lewat hostname publiknya sendiri (mis. ingress rule Cloudflare Tunnel khusus), bukan lagi hanya lewat path reverse-proxy satu origin dengan dashboard/API.

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
