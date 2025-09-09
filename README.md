# Dotfiles

A cross-platform dotfiles configuration for Linux and macOS systems, featuring Hyprland wayland compositor, Waybar, Rofi, and Neovim.

## Overview

This repository contains configuration files for various applications and window managers, with automated sync scripts for easy deployment and maintenance.

## Scripts

### `sync.sh` - Deploy Configurations

Syncs dotfiles from this repository to your system's config directory (`~/.config`).

**Features:**
- Cross-platform support (Linux/macOS)
- OS-specific configuration selection
- Uses rsync with `--delete` for clean syncing
- Creates necessary directories automatically

**Usage:**
```bash
./sync.sh
```

**Platform-specific configs:**
- **Linux**: `hypr`, `ghostty`, `waybar`, `rofi`, `dunst`, `nvim`
- **macOS**: `ghostty`, `nvim`

### `update.sh` - Backup Configurations

Updates this repository with your current system configurations from `~/.config`.

**Usage:**
```bash
./update.sh
```

**Synced directories:** `hypr`, `ghostty`, `waybar`, `rofi`, `dunst`, `nvim`

## Configuration Overview

### Window Manager & Desktop Environment
- **`hypr/`** - Hyprland wayland compositor configuration
  - Main config, wallpaper settings, and utility scripts
  - Includes reload script and wallpaper management

### Status Bar & Launcher
- **`waybar/`** - System status bar for wayland
  - JSON configuration and CSS styling
- **`rofi/`** - Application launcher and menu system
  - Multiple launcher styles, clipboard manager, emoji picker
  - Bluetooth, WiFi, file browser, and power menu integration

### Notifications & Terminal
- **`dunst/`** - Notification daemon configuration
  - Custom notification styling with SVG assets
- **`ghostty/`** - Terminal emulator configuration

### Editor
- **`nvim/`** - Neovim configuration based on kickstart.nvim
  - Custom plugins for Go development, testing, and troubleshooting
  - Includes autopairs, debugging, git integration, and file explorer

## Quick Start

1. Clone this repository:
   ```bash
   git clone <repository-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Deploy configurations:
   ```bash
   chmod +x sync.sh update.sh
   ./sync.sh
   ```

3. To backup current configs:
   ```bash
   ./update.sh
   ```

## Directory Structure

```
config/
├── dunst/          # Notification daemon
├── ghostty/        # Terminal emulator
├── hypr/           # Hyprland window manager
├── nvim/           # Neovim editor
├── rofi/           # Application launcher
└── waybar/         # Status bar
```

## Requirements

- **Linux**: Hyprland, Waybar, Rofi, Dunst, Ghostty, Neovim
- **macOS**: Ghostty, Neovim
- rsync (for syncing)

## Notes

- Configurations are designed primarily for Linux with Hyprland
- macOS support is limited to terminal and editor configurations
- The sync script automatically detects your OS and applies appropriate configs
- All scripts use `set -euo pipefail` for robust error handling