#!/bin/bash

# Function to unlink and link files
unlink_and_link() {
  local source="$1"
  local destination="$2"

  echo ""
  echo "🔓  Unlinking    \`$destination\`"

  unlink "$destination" || { echo "Error unlinking $destination"; }

  echo ""
  echo "🔗  Linking      \`$destination\`"
  echo "    from         \`$source\`"

  ln -s "$source" "$destination" || { echo "Error linking $destination"; }

  return 0
}

echo ""
echo "🛠️  Installing dotfiles..."

# Find and delete broken symbolic links
find "$HOME" -type l -xtype l -delete

# Make sure .config folder is exist
mkdir -p "$HOME/.config"

# Unlink and link files
src="$(cd "$(dirname "$0")" && pwd)/src"

unlink_and_link "$src/.tmux.conf" "$HOME/.tmux.conf"
unlink_and_link "$src/.zshrc" "$HOME/.zshrc"
unlink_and_link "$src/kitty" "$HOME/.config/kitty"

echo ""
echo "✔️  All set!"
echo ""

