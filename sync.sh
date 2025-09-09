#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles/config"
TARGET_DIR="$HOME/.config"

mkdir -p "$TARGET_DIR"

# Detect OS
OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
    # macOS
    DIRS=("ghostty" "nvim")
    echo "Detected macOS. Syncing: ${DIRS[*]}"
else
    # Linux (assuming anything not Darwin is Linux for your use case)
    DIRS=("hypr" "ghostty" "waybar" "rofi" "dunst" "nvim")
    echo "Detected Linux. Syncing: ${DIRS[*]}"
fi

for dir in "${DIRS[@]}"; do
    if [ -d "$DOTFILES_DIR/$dir" ]; then
        echo "Syncing $dir → $TARGET_DIR/$dir"
        rsync -av --delete "$DOTFILES_DIR/$dir/" "$TARGET_DIR/$dir/"
    else
        echo "Skipping $dir (not found in dotfiles)"
    fi
done

echo "✅ Sync complete!"

