#!/bin/bash
# Outlaw OS v1.0 - Boot Manager Build Script

echo "========================================"
echo "   Building Outlaw Boot Manager v1.0"
echo "========================================"

# Create output directory
mkdir -p ../out

# Clean previous build if it exists
rm -f ../out/outlaw-boot-manager-v1.0.iso

echo "[1/4] Running mkarchiso..."
mkarchiso -v -r "$(dirname "$0")" -o ../out

echo "[2/4] Build completed. Checking output..."
if [ -f ../out/outlaw-boot-manager-v1.0.iso ]; then
    echo "✅ SUCCESS: Boot Manager ISO created!"
    echo "   Location: ../out/outlaw-boot-manager-v1.0.iso"
    
    echo "[3/4] Generating SHA256 checksum..."
    cd ../out
    sha256sum outlaw-boot-manager-v1.0.iso > outlaw-boot-manager-v1.0.iso.sha256
    echo "   Checksum file created: outlaw-boot-manager-v1.0.iso.sha256"
    cd - > /dev/null
    
    echo "[4/4] Done!"
    ls -lh ../out/outlaw-boot-manager-v1.0.iso*
else
    echo "❌ ERROR: ISO was not created. Check the mkarchiso output above for errors."
fi

echo "========================================"