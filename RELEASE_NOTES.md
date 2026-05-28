## Apa yang Baru

- **Network map backend v2** — tube model (configurable core counts, warna per tube), cable codes, JoinBox device type, core joins API, list APIs untuk kabel dan tiang
- **Topology validation engine** — deteksi cascading ratio berlebih, path closed, mid-route stub, custom core colors per kabel
- **PPPoE proxy** — RouterOS client, CRUD PPPoE servers/profiles/secrets, sync ke MikroTik
- **Production readiness** — security headers, rate limiter, production docker compose
- **Self-hosted anti-crack hardening** — proteksi binary dari reverse engineering dan tampering
- **VPN WireGuard tunnel** — agent binary, vpn_peers table, heartbeat 30s, stale peer sweep, QR code, RouterOS config snippet
- **VPN peer self-registration via dashboard** — customer bisa daftar VPN peer sendiri dari dashboard
- **Cloud entrypoint** — cmd/cloud binary, organizations + subscriptions, tier limits (trial/starter/pro/business)
- **License flexible limits** — Portal bisa set limit per feature per license, WhatsApp feature gate
- **License expired read-only mode** — expired license tidak blokir akses, tapi read-only

## Bug Fixes

- VPN RouterOS config — tambah `ip route` ke VPN network
- Cross-origin cookie SameSite None untuk VPN peer dashboard (akses dari domain berbeda)
- Workspace orgID saat creation — fix 403 di cloud binary
- Migrations TEXT/UUID type mismatch di cloud migrations

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://telepati.in/install.sh | bash
```

Atau download binary langsung dari [GitHub Releases](https://github.com/teliti-dev/telepati-release/releases/tag/v0.0.2).

## Upgrade dari v0.2.0

```bash
sudo telepati update apply
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
