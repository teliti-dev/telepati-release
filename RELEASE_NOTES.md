## Apa yang Baru

Tidak ada fitur baru pada release ini — patch release untuk memperbaiki build v0.4.0.

## Bug Fixes

- Frontend: perbaiki error TypeScript pada `ACSPage.tsx` (union type tidak konsisten di kartu roadmap ACS Advanced) yang membuat build v0.4.0 gagal di CI/CD. Tidak ada perubahan behavior — murni perbaikan build.

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

Migration database berjalan otomatis saat service restart pasca-upgrade. Tidak ada migration baru pada release ini (sama seperti v0.4.0).

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
