## Apa yang Baru

Tidak ada fitur baru pada release ini — murni bug fix installer.

## Bug Fixes

- Menjalankan ulang `telepati install` setelah percobaan sebelumnya gagal di tengah jalan bisa membuat password role Postgres tidak sinkron dengan `telepati.conf` yang baru ditulis ulang, membuat service gagal start dengan error `password authentication failed for user "telepati"`. Password role sekarang selalu di-reset supaya sinkron di setiap kali dijalankan.

## Breaking Changes

Tidak ada breaking changes pada release ini.

---

## Instalasi

```bash
curl -fsSL https://get.telepati.id | sudo bash
sudo telepati install
```

## Upgrade dari v0.1.0-alpha.5

```bash
sudo telepati update apply
```

---

Changelog lengkap: [CHANGELOG.md](https://github.com/teliti-dev/telepati-release/blob/main/CHANGELOG.md)
