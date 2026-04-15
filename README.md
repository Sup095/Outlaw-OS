# Outlaw OS v1.0

**A lightweight, retro CRT-styled Linux operating system** with a full terminal aesthetic, built-in apps, and a self-installing Boot Manager.

### Features
- Exact retro green phosphor CRT look with scanlines and flicker
- Real system tools: File Manager, Task Manager, Terminal, Calculator
- Built-in Opera GX (default browser) and Steam
- Local AI Assistant (toggleable, runs offline)
- Live system monitoring (CPU, RAM, processes)
- In-OS updates via Settings
- Donation / Subscription button for development support
- Self-installing Boot Manager USB (WiFi setup + automatic latest OS download)

### Quick Start (for users)
1. Download the latest `outlaw-boot-manager-v1.0.iso` from Releases
2. Burn it to a USB drive (Rufus on Windows, `dd` on Linux/Mac)
3. Boot from the USB
4. Follow the on-screen Boot Manager (WiFi → Download → Install)

### For Developers / Builders

#### Repository Structure
See the full file map at the bottom of this README.

#### Building the Boot Manager ISO
```bash
cd outlaw-installer
sudo ./build.sh
