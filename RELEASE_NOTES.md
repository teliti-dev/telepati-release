## Apa yang Baru

- Docker install wizard — wizard interaktif untuk setup via Docker Compose (proxy mode, database, SMTP)
- Bare install wizard — setup langsung di server Ubuntu/Debian sebagai systemd service
- License key validation — Ed25519 offline signed key, diverifikasi saat instalasi

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://get.telepati.id | sudo bash
sudo telepati install bare     # server Ubuntu/Debian
telepati install docker        # Docker Compose
```

Butuh license key? Kunjungi [telepati.id/beta](https://telepati.id/beta)

## Upgrade dari versi sebelumnya

```bash
telepati upgrade
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
