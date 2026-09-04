## Apa yang Baru

Tidak ada fitur baru pada release ini — murni bug fix installer.

## Bug Fixes

- `telepati install` gagal dengan `database "telepati" already exists` saat dijalankan ulang setelah percobaan sebelumnya gagal di tengah jalan (sudah melewati step pembuatan database). `CREATE DATABASE` sekarang cek dulu apakah database sudah ada sebelum membuat.

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://get.telepati.id | sudo bash
sudo telepati install
```

## Upgrade dari v0.1.0-alpha.4

```bash
sudo telepati update apply
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
