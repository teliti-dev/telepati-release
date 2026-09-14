## Apa yang Baru

- **DNS Redirect**: konfigurasi DNS per-workspace terpisah dari Isolir (upstream servers, cache, query log), redirect rules generik berdasarkan subnet/account/address_list/all, log aktivitas query, dan metrics time-series. Layanan DNS (`telepati-dns`) sekarang benar-benar forward query ke upstream untuk domain yang tidak match rule, bukan cuma redirect Isolir seperti sebelumnya.
- **Captive Portal Campaign**: CRUD campaign lengkap dengan lifecycle (publish/pause/resume/archive), upload creative asset, endpoint runtime untuk resolve campaign & catat event (impression/click/login/redeem) dari portal, serta analytics ringkasan dan per-campaign.
- **ACS Advanced Management**: dashboard summary, fault log otomatis dari command TR-069 yang gagal, device task (reboot/factory-reset/download/refresh/get-set-parameter) beserta bulk operation ke banyak device sekaligus, preset & provision & virtual parameter (dengan validasi script), managed file khusus ACS, konfigurasi ACS per-workspace, dan audit log untuk semua perubahan.

## Bug Fixes

- Isolir: menghapus template yang sedang aktif sekarang mengembalikan error yang jelas (409, bukan 400 generik), dan menghapus template yang tidak ada/beda workspace mengembalikan 404.

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

Migration database berjalan otomatis saat service restart pasca-upgrade.

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
