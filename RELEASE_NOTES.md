## Apa yang Baru

- Halaman Overview SNMP dirombak jadi dashboard kesehatan jaringan: kartu ringkas device online/offline/belum pernah dicek, tabel device yang diurutkan problem-first (device offline/bermasalah muncul duluan), dan panduan 3 langkah kalau belum ada device yang mengaktifkan SNMP. Kesehatan proses poller-nya sendiri tetap ada, tapi digeser jadi info sekunder.
- Tabel device di ACS, DNS, dan Hotspot Portal juga sekarang diurutkan problem-first, konsisten dengan halaman SNMP.
- Title halaman lama di header/navbar dihapus dari ~40 halaman di seluruh aplikasi (akun, ACS, AI Chat, autentikasi, billing, captive portal, extension, hotspot, infrastruktur, lokasi, seller, seller admin, system services/settings, teknisi, workspace) — header sekarang murni navigasi, sesuai design system terbaru.

## Bug Fixes

- Halaman Overview ACS, DNS, dan Hotspot Portal masing-masing menampilkan status "Online" yang di-hardcode, tidak peduli apakah service-nya benar-benar berjalan atau tidak — sekarang menampilkan kesehatan proses yang sebenarnya (status aktif, CPU, memori, uptime), berubah merah kalau service-nya mati.

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
