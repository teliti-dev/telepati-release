# Telepati Release

Binary release untuk [Telepati ISP Dashboard](https://telepati.id) — dashboard manajemen ISP self-hosted (pelanggan, billing, PPPoE, network map, MikroTik/GPON, WireGuard VPN).

Repo ini cuma berisi artifact hasil build (binary + dashboard) — source code ada di repo privat terpisah.

## Instalasi

Butuh server Ubuntu 22.04+ / Debian 12+ (bare-metal atau VM), akses root.

```bash
curl -fsSL https://get.telepati.id | sudo bash
sudo telepati install bare
```

Langkah pertama men-download CLI `telepati` ke `/usr/local/bin`. Langkah kedua menjalankan installer — **sepenuhnya otomatis, tanpa pertanyaan apa pun**:

- Install PostgreSQL via `apt`
- Install & konfigurasi WireGuard VPN (interface `telepati`, port `51820/udp`)
- Buat user sistem `telepati`, database, dan seluruh file konfigurasi
- Download dan pasang semua service Telepati (API, SNMP worker, stream, AI agent, billing worker, ACS, isolir DNS/web, WhatsApp gateway) sebagai systemd unit
- Enable + start semua service, lalu tunggu sampai health check lolos

Instalasi selesai dalam beberapa menit. Di akhir, installer menampilkan URL untuk lanjut ke langkah berikutnya:

```
[✓] Telepati berhasil diinstall!

  Buka http://<ip-server-anda>:8080 untuk menyelesaikan setup (buat akun admin & workspace pertama).
```

> **Selama fase alpha/beta** (belum ada release stable), pin versi secara eksplisit:
> ```bash
> TELEPATI_VERSION=v0.1.0-alpha.1 curl -fsSL https://get.telepati.id | sudo bash
> ```
> Lihat versi terbaru di [Releases](https://github.com/teliti-dev/telepati-release/releases).

### Setup akun admin & workspace

Buka `http://<ip-server>:8080` di browser — akan otomatis diarahkan ke layar setup. Isi nama, email, password admin, dan nama workspace pertama Anda, lalu login. Setelah ini selesai, layar setup tidak akan muncul lagi (satu kali saja, per instalasi).

Instalasi default belum punya domain/HTTPS — dashboard diakses langsung via IP + port. Untuk pasang domain dan HTTPS otomatis (Let's Encrypt) atau Cloudflare Tunnel, konfigurasi lewat `telepati config` setelah setup selesai.

## Artifacts

Setiap release berisi:

| File | Deskripsi |
|---|---|
| `telepati_linux_{arch}.tar.gz` | CLI + server binary (`telepati serve`, `telepati install bare`, dll) — berisi juga `migrations/` |
| `telepati-snmp-worker_linux_{arch}.tar.gz` | SNMP polling worker |
| `telepati-stream_linux_{arch}.tar.gz` | Real-time WebSocket (SSH terminal, live monitoring) |
| `telepati-agent_linux_{arch}.tar.gz` | AI chat assistant |
| `telepati-worker_linux_{arch}.tar.gz` | Billing cron, PPPoE sync, VPN watcher |
| `telepati-acs_linux_{arch}.tar.gz` | TR-069/CWMP provisioning ONU/OLT |
| `telepati-isolir-dns_linux_{arch}.tar.gz` / `telepati-isolir-web_linux_{arch}.tar.gz` | Captive portal (DNS + halaman isolir) |
| `telepati-wa_linux_{arch}.tar.gz` | WhatsApp gateway |
| `dashboard_{version}.tar.gz` | Build frontend (dashboard SPA) |
| `checksums.txt` | SHA256 checksum semua artifact |
| `install.sh` | Script installer satu baris |

Arsitektur yang didukung: `amd64`, `arm64`, `arm` (armv7).

Anda tidak perlu download manual satu-satu — `telepati install bare` men-download semua binary yang relevan secara otomatis.

## Upgrade

```bash
sudo telepati update apply
```

## Dokumentasi

Dokumentasi lengkap di [docs.telepati.id](https://docs.telepati.id).
