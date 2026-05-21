#!/usr/bin/env bash
set -euo pipefail

# ── Config ─────────────────────────────────────────────────────────────────────
REPO="teliti-dev/telepati-release"
INSTALL_DIR="${TELEPATI_INSTALL_DIR:-/usr/local/bin}"
VERSION="${TELEPATI_VERSION:-latest}"
BINARY="telepati"

# ── Colors (hanya jika terminal, bukan pipe) ───────────────────────────────────
if [ -t 1 ]; then
  BOLD="\033[1m"; GREEN="\033[32m"; RED="\033[31m"; YELLOW="\033[33m"; RESET="\033[0m"
else
  BOLD=""; GREEN=""; RED=""; YELLOW=""; RESET=""
fi

info()  { printf "${GREEN}✓${RESET} %s\n" "$*"; }
warn()  { printf "${YELLOW}!${RESET} %s\n" "$*" >&2; }
error() { printf "${RED}✗${RESET} %s\n" "$*" >&2; exit 1; }
step()  { printf "${BOLD}  → %s${RESET}\n" "$*"; }

# ── OS check ───────────────────────────────────────────────────────────────────
if [[ "$(uname -s)" != "Linux" ]]; then
  error "install.sh hanya mendukung Linux (Ubuntu 22.04+ / Debian 12+)."
fi

# ── Detect arch ────────────────────────────────────────────────────────────────
ARCH=$(uname -m)
case "$ARCH" in
  x86_64)  ARCH="amd64" ;;
  aarch64) ARCH="arm64" ;;
  *) error "Arsitektur tidak didukung: $ARCH" ;;
esac

# ── Dependency check ───────────────────────────────────────────────────────────
for dep in curl tar sha256sum; do
  command -v "$dep" &>/dev/null || \
    error "Dependency tidak ditemukan: ${dep}. Install: sudo apt-get install -y ${dep}"
done

# ── Permission check ───────────────────────────────────────────────────────────
if [ ! -w "$INSTALL_DIR" ] && [ "$EUID" -ne 0 ]; then
  error "Butuh akses root untuk install ke ${INSTALL_DIR}.\nJalankan ulang dengan sudo:\n\n  curl -fsSL https://get.telepati.id | sudo bash\n"
fi

# ── Resolve version ────────────────────────────────────────────────────────────
if [ "$VERSION" = "latest" ]; then
  step "Mengambil informasi versi terbaru..."
  VERSION=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" \
    | grep '"tag_name"' \
    | head -1 \
    | sed -E 's/.*"tag_name":[[:space:]]*"([^"]+)".*/\1/')

  [ -n "$VERSION" ] || \
    error "Gagal mendapatkan versi terbaru. Cek koneksi internet, atau set versi secara manual:\n\n  TELEPATI_VERSION=v00.01.000 curl -fsSL https://get.telepati.id | sudo bash\n"
fi

# ── Header ─────────────────────────────────────────────────────────────────────
echo ""
printf "${BOLD}  Telepati Installer${RESET}\n"
printf "  ──────────────────────────────────────\n"
step  "Versi  : ${VERSION}"
step  "Arch   : linux/${ARCH}"
step  "Install: ${INSTALL_DIR}/${BINARY}"
echo ""

# ── Setup tmpdir ───────────────────────────────────────────────────────────────
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

BASE_URL="https://github.com/${REPO}/releases/download/${VERSION}"
FILENAME="telepati_${VERSION}_linux_${ARCH}.tar.gz"

# ── Download binary ────────────────────────────────────────────────────────────
step "Mendownload ${FILENAME}..."
curl -fsSL "${BASE_URL}/${FILENAME}" -o "${TMPDIR}/${FILENAME}" || \
  error "Gagal mendownload binary. Pastikan versi ${VERSION} tersedia:\n  https://github.com/${REPO}/releases"

# ── Verify checksum ────────────────────────────────────────────────────────────
step "Memverifikasi checksum SHA256..."
curl -fsSL "${BASE_URL}/checksums.txt" -o "${TMPDIR}/checksums.txt" || \
  error "Gagal mendownload checksums.txt"

(cd "$TMPDIR" && sha256sum --check --ignore-missing checksums.txt) >/dev/null 2>&1 || \
  error "Checksum tidak cocok — file mungkin corrupt atau dimodifikasi. Coba ulang."

info "Checksum valid"

# ── Extract & install ──────────────────────────────────────────────────────────
step "Mengekstrak dan menginstall..."
tar -xzf "${TMPDIR}/${FILENAME}" -C "$TMPDIR"

[ -f "${TMPDIR}/${BINARY}" ] || \
  error "Binary '${BINARY}' tidak ditemukan dalam archive ${FILENAME}."

install -m 0755 "${TMPDIR}/${BINARY}" "${INSTALL_DIR}/${BINARY}"

# ── Verify install ─────────────────────────────────────────────────────────────
command -v telepati &>/dev/null || \
  warn "${INSTALL_DIR} mungkin tidak ada di PATH Anda. Tambahkan ke ~/.bashrc:\n  export PATH=\"${INSTALL_DIR}:\$PATH\""

# ── Done ───────────────────────────────────────────────────────────────────────
echo ""
info "telepati ${VERSION} berhasil diinstall di ${INSTALL_DIR}/${BINARY}"
echo ""
printf "  ${BOLD}Langkah selanjutnya:${RESET}\n"
printf "    sudo telepati install bare     # Install di server Ubuntu/Debian\n"
printf "    telepati install docker        # Setup menggunakan Docker\n"
echo ""
printf "  Dokumentasi: https://docs.telepati.id\n"
echo ""
