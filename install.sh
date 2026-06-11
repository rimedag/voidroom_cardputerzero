#!/bin/sh
set -eu

arch="${VOID_ROOM_ARCH:-$(dpkg --print-architecture)}"
case "$arch" in
    amd64|arm64) ;;
    *)
        echo "Unsupported architecture: $arch" >&2
        echo "Void Room public binary packages are available for amd64 and arm64." >&2
        exit 1
        ;;
esac

asset="void-room_0.1.0-noirsonance2_${arch}.deb"
repo="${VOID_ROOM_REPO:-rimedag/voidroom_cardputerzero}"
base_url="${VOID_ROOM_BASE_URL:-https://raw.githubusercontent.com/${repo}/main/pool/main/v/void-room}"
url="${base_url}/${asset}"
tmp_dir="$(mktemp -d)"

cleanup() {
    rm -rf "$tmp_dir"
}
trap cleanup EXIT INT TERM

echo "Downloading ${asset}..."
curl -fL "$url" -o "${tmp_dir}/${asset}"

echo "Installing Void Room..."
(
    cd "$tmp_dir"
    sudo apt install "./${asset}"
)

echo "Done. Launch with: void-room-desktop, void-room-cardputerzero, or void-room"
