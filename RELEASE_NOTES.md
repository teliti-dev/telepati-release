## Apa yang Baru

- Docker install wizard — proxy mode (direct IP, Caddy+domain, Cloudflare Tunnel), database (managed/external), admin credentials, SMTP opsional
- Bare install wizard — setup langsung di server Ubuntu/Debian sebagai systemd service via `sudo telepati install bare`
- Ed25519 offline license key validation — license key terenkripsi, diverifikasi saat instalasi tanpa butuh koneksi internet
- `install.sh` — one-liner installer untuk Linux amd64/arm64
- CI/CD release pipeline — GoReleaser + Docker Hub multi-arch (amd64/arm64)

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

Ini adalah release pertama — tidak ada upgrade path.

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
