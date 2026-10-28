#!/bin/bash
set -euo pipefail
bundle=$(cd -- "$(dirname -- "$0")" && pwd)
backup="$HOME/.local/share/hash-desktop/backups/before-bundle-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup/config" "$backup/bin" "$HOME/.cache/hash-setup" "$HOME/.local/bin" "$HOME/.local/share/applications" "$HOME/.local/share/backgrounds" "$HOME/.local/share/icons"
for dir in hypr noctalia ghostty nvim satty qt6ct xdg-desktop-portal; do
  if [ -e "$HOME/.config/$dir" ]; then cp -a "$HOME/.config/$dir" "$backup/config/"; fi
done
for file in hash-shell hash-scratchpad hash-screenshot hash-theme hash-verify; do
  if [ -e "$HOME/.local/bin/$file" ]; then cp -a "$HOME/.local/bin/$file" "$backup/bin/"; fi
done
sudo pacman -Syu --needed --noconfirm hyprland hyprpm noctalia ghostty yazi neovim rustup git ripgrep fd lazygit matugen satty grim slurp wl-clipboard hyprpicker obs-studio gpu-screen-recorder kdeconnect inter-font adw-gtk-theme qt6ct kvantum papirus-icon-theme libayatana-appindicator libayatana-indicator pipewire pipewire-pulse wireplumber xdg-desktop-portal-hyprland xdg-desktop-portal-gtk gnome-keyring networkmanager bluez bluez-utils power-profiles-daemon brightnessctl kanshi hyprpolkitagent
if ! command -v zen-browser >/dev/null; then
  if command -v yay >/dev/null; then yay -S --needed --noconfirm zen-browser-bin; else echo 'Install zen-browser-bin from AUR to enable the Zen shortcut.'; fi
fi
if [ ! -e "$HOME/.config/nvim/init.lua" ]; then
  git clone https://github.com/AstroNvim/template "$HOME/.config/nvim"
  git -C "$HOME/.config/nvim" checkout 49a7161b776f8bc6c23508819ea1ad4e7b359bee
fi
cp -a "$bundle/config/." "$HOME/.config/"
cp -a "$bundle/bin/." "$HOME/.local/bin/"
cp -a "$bundle/share/applications/." "$HOME/.local/share/applications/"
cp -a "$bundle/share/backgrounds/." "$HOME/.local/share/backgrounds/"
python3 - "$HOME" <<'PY'
import pathlib, sys
home = pathlib.Path(sys.argv[1])
for path in [home/'.config/satty/config.toml', home/'.config/qt6ct/qt6ct.conf', home/'.local/share/applications/localsend.desktop']:
    path.write_text(path.read_text().replace('/home/ash', str(home)))
PY
curl -fL --retry 2 -o "$HOME/.cache/hash-setup/localsend-1.18.2.tar.gz" https://github.com/localsend/localsend/releases/download/v1.18.2/LocalSend-1.18.2-linux-x86-64.tar.gz
printf '%s  %s\n' 287690a9a8eb6da9c83cc97b3e3030ac67daf32a7331fcf307d0939300658d16 "$HOME/.cache/hash-setup/localsend-1.18.2.tar.gz" | sha256sum -c -
mkdir -p "$HOME/.local/opt/localsend-1.18.2"
tar -xzf "$HOME/.cache/hash-setup/localsend-1.18.2.tar.gz" -C "$HOME/.local/opt/localsend-1.18.2"
curl -fL --retry 2 -o "$HOME/.cache/hash-setup/Bibata-Modern-Ice.tar.xz" https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz
printf '%s  %s\n' a68cae60c4dc706350e194ebc91c5fe48bc7bc9d59e119555834a2a7ee5078ef "$HOME/.cache/hash-setup/Bibata-Modern-Ice.tar.xz" | sha256sum -c -
tar -xJf "$HOME/.cache/hash-setup/Bibata-Modern-Ice.tar.xz" -C "$HOME/.local/share/icons"
rustup toolchain install stable
rustup default stable
rustup component add rust-analyzer rust-src rustfmt clippy
nvim --headless '+Lazy! install' +qa
gsettings set org.gnome.desktop.interface icon-theme Papirus
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice
gsettings set org.gnome.desktop.interface cursor-size 24
if command -v zen-browser >/dev/null; then xdg-settings set default-web-browser zen.desktop; fi
systemctl --user enable kanshi.service
systemctl --user enable hash-overview-watch.service hyprpolkitagent.service
noctalia config validate "$HOME/.config/noctalia/config.toml"
echo "Backed up previous config to $backup"
echo 'Log into Hyprland, then install the workspace overview plugin as described in README.md.'
