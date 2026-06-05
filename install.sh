#!/bin/sh
set -eu

asset="void-room_0.1.0-noirsonance1_all.deb"
repo="${VOID_ROOM_REPO:-rimedag/Void-Room}"
url="https://github.com/${repo}/releases/latest/download/${asset}"
tmp_dir="$(mktemp -d)"

cleanup() {
    rm -rf "$tmp_dir"
}
trap cleanup EXIT INT TERM

echo "Downloading ${asset}..."
curl -fL "$url" -o "${tmp_dir}/${asset}"

echo "Installing Void Room..."
sudo apt install "${tmp_dir}/${asset}"

echo "Done. Launch with: void-room-desktop, void-room-cardputerzero, or void-room"
