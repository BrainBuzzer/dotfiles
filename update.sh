#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/dotfiles/config"

mkdir -p "$DOTFILES_DIR"

# Detect OS
OS="$(uname -s)"

# Determine which directories to sync based on OS
if [[ "$OS" == "Darwin" ]]; then
    # macOS - only nvim and ghostty
    ALL_DIRS=("nvim")
    echo "Detected macOS. Available directories: nvim, ghostty"
else
    # Linux
    ALL_DIRS=("hypr" "ghostty" "waybar" "rofi" "dunst" "nvim")
    echo "Detected Linux. Available directories: ${ALL_DIRS[*]}"
fi

# Check for second argument to specify which folders to sync
if [ $# -eq 2 ]; then
    if [ "$2" = "all" ]; then
        DIRS=("${ALL_DIRS[@]}")
        echo "Syncing all directories..."
    else
        # Split comma-separated list or single directory
        IFS=',' read -ra DIRS <<< "$2"
        echo "Syncing specified directories: ${DIRS[*]}"
        
        # Validate directories
        for dir in "${DIRS[@]}"; do
            if [[ "$OS" == "Darwin" ]] && [[ "$dir" != "nvim" ]] && [[ "$dir" != "ghostty" ]]; then
                echo "Error: '$dir' is not available on macOS. Only 'nvim' and 'ghostty' are supported."
                exit 1
            fi
        done
    fi
else
    # Default behavior - sync all directories
    DIRS=("${ALL_DIRS[@]}")
fi

# Handle ghostty specially for macOS (reverse direction from sync.sh)
if [[ "$OS" == "Darwin" ]]; then
    for dir in "${DIRS[@]}"; do
        if [ "$dir" = "ghostty" ]; then
            GHOSTTY_SOURCE_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
            if [ -d "$GHOSTTY_SOURCE_DIR" ]; then
                echo "Updating ghostty from $GHOSTTY_SOURCE_DIR..."
                rsync -av --delete "$GHOSTTY_SOURCE_DIR/" "$DOTFILES_DIR/ghostty/"
            else
                echo "Skipping ghostty (not found in $GHOSTTY_SOURCE_DIR)"
            fi
        fi
    done
fi

# Sync regular directories
for dir in "${DIRS[@]}"; do
    if [ "$dir" = "ghostty" ] && [[ "$OS" == "Darwin" ]]; then
        # Skip regular ghostty handling on macOS as it's handled above
        continue
    fi
    
    if [ -d "$SOURCE_DIR/$dir" ]; then
        echo "Updating $dir..."
        rsync -av --delete "$SOURCE_DIR/$dir/" "$DOTFILES_DIR/$dir/"
    else
        echo "Skipping $dir (not found in $SOURCE_DIR)"
    fi
done

echo "✅ Dotfiles updated in $DOTFILES_DIR"

