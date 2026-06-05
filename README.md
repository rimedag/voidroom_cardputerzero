# Void Room

Offline writing room for NoirSonance Cardputer Zero and regular Linux desktops.

This public repository contains install instructions and release downloads. The
development source lives in the private/local NoirSonance Gitea repository.

## Install

```bash
curl -LO https://github.com/rimedag/Void-Room/releases/latest/download/void-room_0.1.0-noirsonance1_all.deb
sudo apt install ./void-room_0.1.0-noirsonance1_all.deb
```

Or use the install helper:

```bash
curl -fsSL https://raw.githubusercontent.com/rimedag/Void-Room/main/install.sh | sh
```

## Launch

Cardputer Zero / small display:

```bash
void-room-cardputerzero
```

Regular Linux desktop or Raspberry Pi HDMI desktop:

```bash
void-room-desktop
```

Automatic mode:

```bash
void-room
```

## Package

The Debian package is pure Python and marked `Architecture: all`, so the same
download can install on Raspberry Pi OS, Debian, Ubuntu, and other compatible
Linux systems.
