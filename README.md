# Telepati Release

Binary release untuk [Telepati ISP Dashboard](https://telepati.id) — dashboard manajemen ISP self-hosted (pelanggan, billing, PPPoE, network map, MikroTik/GPON, WireGuard VPN).

Repo ini cuma berisi artifact hasil build (binary + dashboard) — source code ada di repo privat terpisah.

## Daftar Isi

- [Instalasi](#instalasi)
- [Setup akun admin & workspace](#setup-akun-admin--workspace)
- [Artifacts](#artifacts)
- [Perintah CLI](#perintah-cli)
  - [install](#telepati-install)
  - [update](#telepati-update)
  - [manage](#telepati-manage)
  - [config](#telepati-config)
  - [Perintah level atas](#perintah-level-atas)
- [Konfigurasi](#konfigurasi)
- [Troubleshooting](#troubleshooting)

---

## Instalasi

Butuh server Ubuntu 22.04+ / Debian 12+ (bare-metal atau VM), akses root.

```bash
curl -fsSL https://raw.githubusercontent.com/teliti-dev/telepati-release/main/install.sh | sudo bash
sudo telepati install
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
> curl -fsSL https://raw.githubusercontent.com/teliti-dev/telepati-release/main/install.sh | sudo env TELEPATI_VERSION=v0.1.0-alpha.1 bash
> ```
> Lihat versi terbaru di [Releases](https://github.com/teliti-dev/telepati-release/releases).

## Setup akun admin & workspace

Buka `http://<ip-server>:8080` di browser — akan otomatis diarahkan ke layar setup. Isi nama, email, password admin, dan nama workspace pertama Anda, lalu login. Setelah ini selesai, layar setup tidak akan muncul lagi (satu kali saja, per instalasi).

Instalasi default belum punya domain/HTTPS — dashboard diakses langsung via IP + port. Untuk pasang domain dan HTTPS otomatis (Let's Encrypt) atau Cloudflare Tunnel, konfigurasi lewat [`telepati config`](#telepati-config) setelah setup selesai.

## Artifacts

Setiap release berisi:

| File | Deskripsi |
|---|---|
| `telepati_linux_{arch}.tar.gz` | **Satu archive gabungan** — 11 binary (API, DNS, isolir web, WhatsApp gateway, stream, SNMP, ACS, worker, AI agent, RADIUS, hotspot portal) + `migrations/` |
| `dashboard_{version}.tar.gz` | Build frontend (dashboard SPA) |
| `checksums.txt` | SHA256 checksum semua artifact |
| `install.sh` | Script installer satu baris |

Arsitektur yang didukung: `amd64`, `arm64`, `arm` (armv7).

`telepati install` men-download satu archive ini dan memasang semua service sekaligus — tidak ada download binary satu-satu lagi.
Binary CLI di `/usr/local/bin/telepati` kemudian diarahkan ke binary deployment yang sama di `/opt/telepati/telepati`, sehingga versi CLI dan service tidak dapat tertinggal satu sama lain saat update.

---

## Perintah CLI

### `telepati install`

Install seluruh stack Telepati (API server, seluruh service pendukung, dan WhatsApp gateway) secara otomatis.

```bash
sudo telepati install
sudo telepati install --version v0.1.0-alpha.1   # pin ke versi tertentu
```

> Harus dijalankan sebagai **root**.

**Sepenuhnya non-interactive** — tidak ada wizard, tidak ada pertanyaan. Semua konfigurasi pakai default otomatis:

| Aspek | Default |
|---|---|
| Database | PostgreSQL diinstall otomatis via `apt`, password di-generate random |
| WireGuard VPN | Aktif, interface `telepati`, port `51820/udp` |
| Akses | `http://<ip-server-terdeteksi>:8080` — tanpa Caddy/domain/HTTPS |
| Frontend | Dashboard SPA dipasang lokal, di-serve dari binary yang sama |

**Akun admin dan workspace pertama dibuat lewat browser** (layar setup satu kali di dashboard — lihat [di atas](#setup-akun-admin--workspace)), bukan lewat CLI.

#### File yang dibuat

| Path | Keterangan |
|---|---|
| `/opt/telepati/telepati` + 8 binary service lainnya | Binary, dari satu archive rilis gabungan |
| `/opt/telepati/public/` | Dashboard SPA (di-serve langsung oleh `telepati serve`, tanpa Caddy) |
| `/opt/telepati/migrations/` | SQL migration, dijalankan otomatis setiap `telepati.service` start |
| `/etc/telepati/telepati.conf` | Semua konfigurasi (DB, secret key, WireGuard, dll) |
| `/etc/systemd/system/telepati*.service` | 8 systemd unit (telepati, isolir-dns, isolir-web, stream, snmp, acs, worker, agent) |
| `/var/lib/telepati/state.db` | Metadata instalasi (versi, domain) |
| `/var/log/telepati/` | Direktori log |

---

### `telepati update`

```bash
telepati update check              # cek apakah ada versi lebih baru
telepati update versions           # daftar versi yang tersedia di GitHub Releases
sudo telepati update apply         # update ke versi terbaru
sudo telepati update apply --version v0.2.0   # update ke versi spesifik
sudo telepati update rollback      # kembali ke binary versi sebelumnya
```

`update apply` memperbarui bundle service, migration, dashboard, dan CLI sebagai satu versi. Semua artifact wajib lolos SHA256. Jika startup atau health check gagal, binary dan dashboard otomatis dikembalikan ke versi sebelumnya.

> Upgrade satu kali dari alpha.12 atau lebih lama: jalankan kembali bootstrap CLI sebelum `update apply`, karena updater lama belum dapat memperbarui dirinya sendiri:
> ```bash
> curl -fsSL https://raw.githubusercontent.com/teliti-dev/telepati-release/main/install.sh | sudo bash
> sudo telepati update apply
> ```

---

### `telepati manage`

```bash
telepati manage status                                  # status semua service
telepati manage backup                                  # backup DB -> ./telepati-backup-<timestamp>.sql.gz
telepati manage backup -o /mnt/nas/backup.sql.gz         # path output custom
telepati manage restore /path/ke/backup.sql.gz           # restore DB dari file backup
telepati manage migrate up                                # apply semua migration
telepati manage migrate down 1                             # rollback 1 migration
telepati manage diagnose                                   # one-stop health check
telepati manage logs                                       # lihat log service
```

`backup`/`restore`/`migrate` membaca kredensial database langsung dari `/etc/telepati/telepati.conf` — tidak perlu set variabel environment apa pun, cukup jalankan di server yang sama dengan instalasi.

> `restore` menimpa data yang ada — pastikan sudah backup dulu.

---

### `telepati config`

```bash
telepati config show               # tampilkan konfigurasi aktif (secret di-mask)
telepati config show --reveal      # tampilkan termasuk secret
telepati config set KEY VALUE      # ubah satu nilai, comment & urutan baris tetap terjaga
```

Contoh mengaktifkan domain custom setelah install:

```bash
sudo telepati config set ALLOWED_ORIGINS "https://telepati.perusahaan.com"
sudo systemctl restart telepati
```

---

### Perintah level atas

```bash
telepati start / stop / restart      # kelola telepati.service
telepati status                      # status service, versi, domain, koneksi DB
telepati logs                        # journalctl -u telepati
telepati diagnose                    # diagnosa sistem, service, database, konfigurasi
telepati version                     # versi CLI/binary
```

---

## Konfigurasi

Semua konfigurasi tersimpan di `/etc/telepati/telepati.conf` (format `KEY=VALUE`, systemd `EnvironmentFile`):

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=telepati
DB_USER=telepati
DB_PASSWORD=<auto-generated>
DB_SSLMODE=disable

SERVER_PORT=8080
PASETO_SYMMETRIC_KEY=<auto-generated>
DEVICE_ENCRYPTION_KEY=<auto-generated>
ALLOWED_ORIGINS=http://<ip-server>:8080

STREAM_URL=http://localhost:9000/stream
STREAM_INTERNAL_SECRET=<auto-generated>

# Muncul kalau WireGuard aktif (default: ya)
WG_INTERFACE=telepati
WG_SERVER_PUBLIC_KEY=<auto-generated>
WG_SERVER_ENDPOINT=<ip-server>:51820
WG_SERVER_TUNNEL_IP=10.99.0.1
```

Setelah mengubah konfigurasi (manual atau lewat `telepati config set`), restart service:

```bash
sudo systemctl restart telepati
```

## Upgrade

```bash
sudo telepati update apply
```

## Troubleshooting

### Service tidak bisa start

```bash
journalctl -u telepati -n 50 --no-pager
systemctl status telepati
```

### Tidak bisa connect ke database

```bash
sudo -u postgres psql -c "SELECT 1"
systemctl status postgresql
```

### Reset password admin

```bash
sudo -u postgres psql telepati -c \
  "UPDATE users SET password = crypt('password-baru', gen_salt('bf', 12)) WHERE email = 'admin@perusahaan.com';"
```

(Perlu ekstensi `pgcrypto` — biasanya sudah aktif; kalau belum: `CREATE EXTENSION IF NOT EXISTS pgcrypto;`)

### Uninstall

```bash
systemctl stop telepati telepati-isolir-dns telepati-isolir-web telepati-stream telepati-snmp telepati-acs telepati-worker telepati-agent
systemctl disable telepati telepati-isolir-dns telepati-isolir-web telepati-stream telepati-snmp telepati-acs telepati-worker telepati-agent
rm /etc/systemd/system/telepati*.service
rm -rf /opt/telepati /etc/telepati /var/log/telepati /var/lib/telepati
systemctl daemon-reload

# Hapus database (opsional, ireversibel)
sudo -u postgres psql -c "DROP DATABASE telepati; DROP ROLE telepati;"

# Hapus WireGuard (opsional)
systemctl stop telepati-wg && systemctl disable telepati-wg
ip link del telepati
rm /etc/systemd/system/telepati-wg.service /etc/wireguard/telepati.conf
```

## Dokumentasi

Dokumentasi lengkap di [docs.telepati.id](https://docs.telepati.id).
