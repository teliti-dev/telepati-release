## Apa yang Baru

- **Device Detail — dashboard MikroTik RouterOS berbasis peran**: halaman detail perangkat sekarang mendeteksi otomatis peran perangkat (Router/Switch/OLT/Hybrid) dari model RouterOS, dengan opsi override manual oleh admin/teknisi yang tidak akan tertimpa oleh refresh metadata otomatis. Untuk perangkat Router, ringkasan operasional baru menampilkan status port fisik, WAN utama beserta traffic real-time, VLAN, IP address, PPPoE, DHCP, VPN, dan firewall — seluruhnya diambil langsung dari RouterOS API, tanpa pernah membocorkan username/password/secret.
- **Tiket Dukungan**: pelanggan kini bisa membuka tiket dukungan langsung dari portal pelanggan (dikaitkan ke salah satu layanan/akun mereka), dan tim CS/agent bisa menangani antrean tiket tersebut lewat halaman Dukungan yang sudah ada di dashboard workspace — sebelumnya halaman ini hanya menampilkan data contoh (mock), sekarang sudah tersambung ke data sungguhan. Tiket yang sudah selesai otomatis dibuka kembali begitu pelanggan membalas, dan balasan pertama dari agent otomatis menandai tiket tersebut sebagai miliknya.
- **Listener portal terpisah (opsional)**: operator sekarang bisa mengaktifkan port kedua (`PORTAL_PORT`) supaya hostname khusus pelanggan (mis. `support.<domain-isp>.com`) bisa diarahkan langsung ke portal pelanggan lewat Cloudflare Tunnel yang sudah ada, tanpa perlu aturan tambahan di domain dashboard utama. Fitur ini nonaktif secara default dan tidak mengubah perilaku instalasi yang sudah berjalan.

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

Migration database berjalan otomatis saat service restart pasca-upgrade — release ini menambahkan tabel `tickets`/`ticket_messages` dan kolom peran perangkat baru di `infra_devices`, keduanya murni penambahan (tidak mengubah data/skema yang sudah ada).

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
