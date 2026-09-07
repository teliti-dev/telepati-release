## Apa yang Baru

- Cloudflare Tunnel: superadmin dapat mengaktifkan tunnel token-based (tanpa perlu `cloudflared tunnel login` interaktif) langsung dari `/system/cloudflare` — atur nama tunnel, token, dan ingress rules, lalu Telepati menerapkannya otomatis ke `cloudflared` di host. Instalasi baru maupun `telepati update apply` di host lama sama-sama otomatis menyiapkan wrapper script dan sudoers scope yang dibutuhkan; `telepati uninstall` membersihkannya kembali.
- `cloudflared` sekarang berjalan sebagai user `telepati` yang unprivileged, bukan root.

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
