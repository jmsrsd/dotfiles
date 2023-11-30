### sources
###
source="$(cd "$(dirname "$0")" && pwd)/src"

### destinations
###
home="$HOME"
config="$home/.config"

### cleanings
###
echo ""
tmux="$home/.tmux.conf"
echo "Unlinking $tmux"
unlink "$tmux"

echo ""
zshrc="$home/.zshrc"
echo "Unlinking $zshrc"
unlink "$zshrc"

echo ""
kitty="$config/kitty"
echo "Unlinking $kitty"
mkdir -p "$config"
unlink "$kitty"

### linkings
###
echo ""
echo "Linking $tmux"
echo "from $source/.tmux.conf"
ln -s "$source/.tmux.conf" "$tmux"

echo ""
echo "Linking $zshrc"
echo "from $source/.zshrc"
ln -s "$source/.zshrc" "$zshrc"

echo ""
echo "Linking $kitty"
echo "from $source/kitty"
ln -s "$source/kitty" "$kitty"
