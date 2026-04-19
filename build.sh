#!/bin/bash
# QuantumOS build script
# Requires: live-build (apt install live-build)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"

echo "==> Preparing QuantumOS build environment..."
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Initialize live-build config
lb config \
  --distribution bookworm \
  --archive-areas "main contrib non-free non-free-firmware" \
  --debian-installer live \
  --bootappend-live "boot=live components hostname=quantumos username=quantum" \
  --iso-volume "QuantumOS 1.0" \
  --iso-application "QuantumOS" \
  --iso-publisher "QuantumOS Project"

# Copy our config into the build dir
cp -r "$SCRIPT_DIR/config/"* "$BUILD_DIR/config/"

# Make hooks executable
chmod +x "$BUILD_DIR/config/hooks/live/"*.hook.chroot 2>/dev/null || true

echo "==> Building QuantumOS ISO (this will take a while)..."
sudo lb build

echo ""
echo "==> Build complete! ISO: $BUILD_DIR/quantumos-1.0-amd64.iso"
