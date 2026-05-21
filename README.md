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
sudo telepati install bare
```

## Artifacts

Each release contains:

| File | Description |
|---|---|
| `telepati_linux_amd64.tar.gz` | Linux x86_64 binary |
| `telepati_linux_arm64.tar.gz` | Linux ARM64 binary |
| `telepati_darwin_arm64.tar.gz` | macOS Apple Silicon binary |
| `telepati_windows_amd64.zip` | Windows x86_64 binary |
| `*.sha256` | Checksum files |
| `checksums.txt` | All checksums |

Frontend builds are released separately as `telepati_frontend_vX.X.X.tar.gz`.

## Documentation

Full documentation at [docs.telepati.id](https://docs.telepati.id).

## License

Telepati is proprietary software. See [telepati.id/pricing](https://telepati.id/pricing) for licensing options.
