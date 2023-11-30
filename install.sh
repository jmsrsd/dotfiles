#!/bin/bash

# Function to unlink and link files
unlink_and_link() {
 local source="$1"
 local destination="$2"

 echo "Unlinking $destination"
 unlink "$destination" || { echo "Error unlinking $destination"; exit 1; }

 echo "Linking $destination"
 echo "from $source"
 ln -s "$source" "$destination" || { echo "Error linking $destination"; exit 1; }
}

# Find and delete broken symbolic links
find "$HOME" -type l -xtype l -delete

# Unlink and link files
unlink_and_link "$(cd "$(dirname "$0")" && pwd)/src/.tmux.conf" "$HOME/.tmux.conf"
unlink_and_link "$(cd "$(dirname "$0")" && pwd)/src/.zshrc" "$HOME/.zshrc"
mkdir -p "$HOME/.config"
unlink_and_link "$(cd "$(dirname "$0")" && pwd)/src/kitty" "$HOME/.config/kitty"
