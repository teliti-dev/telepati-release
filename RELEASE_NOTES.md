## Apa yang Baru

- **Network map backend v2** — tube model (configurable core counts, warna per tube), cable codes, JoinBox device type, core joins API, list APIs untuk kabel dan tiang
- **Network map UX update** — tiang sprite marker icons per tipe (ODP/ODC/JB), view-only info panel, extend cable tool
- **Cable management pages** — list dengan search + pagination + kode kabel, config page dengan TubeEditor visual, core colors override, core stubs management, rute kabel
- **Tiang management pages** — list dengan filter tipe, config page 3 tab (perangkat, kabel, sambungan core)
- **Device config pages + Join Box** — device list dengan filter tipe, config page per device (port assignment, inline edit, pass-through toggle), Join Box tipe baru
- **Visual Splice Editor** — SVG drag-and-drop editor untuk menyambung core antar kabel di Join Box, bezier curve connections, tube grouping, TIA-598 colors
- **Cloud/Self-hosted build separation** — pipeline terpisah: cloud (`cloud/v*` tags) vs self-hosted (`v*` tags), mencegah license key leak ke binary cloud

## Bug Fixes

Tidak ada bug fix spesifik pada release ini.

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://telepati.in/install.sh | bash
```

Atau download binary langsung dari [GitHub Releases](https://github.com/teliti-dev/telepati-release/releases/tag/v0.0.4).

## Upgrade dari v0.0.2

```bash
sudo telepati update apply
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
