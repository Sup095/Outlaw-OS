#!/bin/bash
# ================================================
# Outlaw OS v1.0 - Boot Manager Build Script
# ================================================

echo "========================================"
echo "   Building Outlaw Boot Manager v1.0"
echo "========================================"

# Create output directory
mkdir -p ../out

# Clean previous build files to avoid conflicts
echo "[1/4] Cleaning old build files..."
rm -rf ../out/work ../out/outlaw-boot-manager-v1.0.iso 2>/dev/null

# Build the ISO
echo "[2/4] Running mkarchiso..."
mkarchiso -v -r "$(dirname "$0")" -o ../out

# Check if ISO was successfully created
if [ -f ../out/outlaw-boot-manager-v1.0.iso ]; then
    echo "[3/4] ISO created successfully!"
    echo "   → ../out/outlaw-boot-manager-v1.0.iso"
    
    # Generate SHA256 checksum (used by Boot Manager for verification)
    echo "[4/4] Generating SHA256 checksum..."
    cd ../out
    sha256sum outlaw-boot-manager-v1.0.iso > outlaw-boot-manager-v1.0.iso.sha256
    cd - > /dev/null
    
    echo "✅ Build completed successfully!"
    echo "   ISO:  outlaw-boot-manager-v1.0.iso"
    echo "   SHA:  outlaw-boot-manager-v1.0.iso.sha256"
    ls -lh ../out/outlaw-boot-manager-v1.0.iso*
else
    echo "❌ ERROR: ISO file was not created."
    echo "   Please check the mkarchiso output above for errors."
    echo "   Common issues: missing packages, permission problems, or errors in airootfs files."
    exit 1
fi

echo "========================================"
