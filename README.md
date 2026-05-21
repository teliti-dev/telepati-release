# Telepati Release

Binary releases for the [Telepati ISP Dashboard](https://telepati.id).

## Install

```bash
curl -fsSL https://get.telepati.id | bash
```

or manually:

```bash
curl -fsSL https://github.com/teliti-dev/telepati-release/releases/latest/download/install.sh | bash
```

Then run the installer:

```bash
sudo telepati install bare      # server Ubuntu/Debian
telepati install docker         # Docker Compose
```

Butuh license key? Kunjungi [telepati.id/beta](https://telepati.id/beta)

## Artifacts

Each release contains:

| File | Description |
|---|---|
| `telepati_{version}_linux_amd64.tar.gz` | CLI binary — Linux x86_64 |
| `telepati_{version}_linux_arm64.tar.gz` | CLI binary — Linux ARM64 |
| `server_{version}_linux_amd64.tar.gz` | Server binary — Linux x86_64 |
| `server_{version}_linux_arm64.tar.gz` | Server binary — Linux ARM64 |
| `checksums.txt` | SHA256 checksums for all artifacts |
| `install.sh` | One-liner installer script |

## Docker

```bash
docker pull teliti/telepati:{version}
docker pull teliti/telepati:latest
```

## Documentation

Full documentation at [docs.telepati.id](https://docs.telepati.id).

## License

Telepati is proprietary software. See [telepati.id/pricing](https://telepati.id/pricing) for licensing options.
