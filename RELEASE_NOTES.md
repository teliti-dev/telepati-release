## Apa yang Baru

Tidak ada fitur baru pada release ini — patch fix saja.

## Bug Fixes

- Koneksi RouterOS yang berhasil login tepat setelah batas waktu (timeout) Telepati habis meninggalkan sesi login yang menggantung di device, bukan ditutup dengan benar — terlihat di log device sebagai login lalu logout beberapa detik setelah Telepati sudah terlanjur melaporkan "Gagal — periksa host, port, dan kredensial" ke pengguna. Login di device sebenarnya berhasil; Telepati saja yang sudah berhenti menunggu hasilnya. Sekarang koneksi yang berhasil telat tetap ditutup dengan benar, tidak dibiarkan menggantung.

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
