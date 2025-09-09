#!/usr/bin/env bash
set -euo pipefail

# Adjust these paths as needed
SOURCE_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/dotfiles/config"

# Directories you want to sync
DIRS=("hypr" "ghostty" "waybar" "rofi" "dunst" "nvim")

mkdir -p "$DOTFILES_DIR"

for dir in "${DIRS[@]}"; do
    if [ -d "$SOURCE_DIR/$dir" ]; then
        echo "Updating $dir..."
        rsync -av --delete "$SOURCE_DIR/$dir/" "$DOTFILES_DIR/$dir/"
    else
        echo "Skipping $dir (not found in $SOURCE_DIR)"
    fi
done

echo "✅ Dotfiles updated in $DOTFILES_DIR"

