# QuantumOS

A minimal Debian-based Linux distribution.

## Requirements

- Debian/Ubuntu host system
- `live-build` package

```bash
sudo apt install live-build
```

## Build

```bash
chmod +x build.sh
./build.sh
```

The ISO will be output to `build/quantumos-1.0-amd64.iso`.

## Customization

- `config/package-lists/quantum.list.chroot` — add/remove packages
- `config/hooks/live/` — scripts that run inside the chroot during build
- `config/includes.chroot/` — files copied directly into the root filesystem
