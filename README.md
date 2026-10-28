# Hash desktop snapshot

This is the Noctalia 5.3 / Hyprland 0.56 workstation configuration. `config/`, `bin/`, and `share/` are a snapshot; editing the live files does not automatically update this bundle. `explicit-packages.txt` records the source machine's explicit Arch packages, including unrelated software, for reference only.

To install on another Arch machine, inspect `install.sh` and run it as the desktop user. It backs up existing configuration, performs a full system upgrade while installing packages, downloads the pinned LocalSend and Bibata releases with checksum checks, installs Rust components, and installs the AstroNvim plugins. It does not install an AUR helper; if `yay` is absent, install Zen separately.

After logging into Hyprland, install the version-matched overview plugin:

    hyprpm update
    hyprpm add https://github.com/sandwichfarm/hyprexpo
    hyprpm enable hyprexpo

Run `hash-verify` in the graphical session. `hyprpm update` rebuilds the plugin after Hyprland upgrades. Noctalia's official screen-recorder plugin downloads on shell startup. Pair KDE Connect and approve screen-sharing requests on the relevant devices.

For rollback on hash, the pre-migration files are in `~/.local/share/hash-desktop/backups/pre-noctalia-20261028-144716/config/` and `bin/`. Copy the desired files back after backing up the current configuration, then reload Hyprland or log in again. The previous GTK icon theme was Papirus. The user's previous browser default was Firefox.
