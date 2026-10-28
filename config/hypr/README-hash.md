# Hash workstation

Super means the Windows/Command key. Noctalia owns the bar, dock, notifications, wallpaper, clipboard, lock screen, night light and settings.

## Everyday shortcuts

- Super + Space or R: application launcher. Search for an app, calculation, or `/win` for windows.
- Super + T: Ghostty. Super + E: Thunar. Super + Shift + E: Yazi in Ghostty. Super + F: Zen.
- Super + S: show/hide the persistent floating Ghostty scratchpad. Super + Shift + S: move a window into it.
- Super + G: workspace overview. Click a workspace to select it, or drag windows between workspaces.
- Super + W: visual window switcher. Alt + Tab: cycle windows.
- Super + H/J/K/L or arrows: focus windows. Super + number: workspace; add Shift to move a window.
- Super + Ctrl + Space: resize mode; H/J/K/L resize, Escape or Enter exits.
- Super + Q: close. Super + V: float. Super + Shift + F: fullscreen.
- Super + Shift + P: quick settings. Super + Tab: show/hide dock; the bottom edge also reveals it. Three-finger swipe up: workspace overview. Three-finger swipe down: closes the overview if it is open, otherwise opens the app launcher. Polkit prompts use hyprpolkitagent; its theme is generated from the Noctalia palette into ~/.config/hypr/hyprtoolkit.conf.
- Super + N: notifications. Super + Shift + N: do not disturb.
- Super + Shift + C: clipboard history. Super + Shift + X: select and annotate a screenshot in Satty.
- Super + Ctrl + R: start/stop recording; default asks the portal to choose a source. Recordings go to ~/Videos/Recordings.
- Super + Shift + K: pick a color. Super + Ctrl + T: switch between Tokyo Night and wallpaper-derived colors.
- Super + Escape or Super + Ctrl + L: lock. Super + Shift + L: session/power menu.

Workspaces 1–5 are web, code, test, chat, and miscellaneous. Slack and Discord route to 4. Apps launched from the dock or launcher open on the current workspace. Use the display editor for monitor arrangements. Unassigned workspaces follow available monitors.

The night light runs 21:00–07:00 local time. Change the schedule and wallpaper in Noctalia Settings. When wallpaper colors are selected, Noctalia updates the shell, Ghostty, GTK/Qt, Hyprland borders, and the Neovim palette. Open Neovim windows refresh on focus.

LocalSend is in the launcher and dock; install it on the other device and use the same network. For phone notifications and file sharing, open KDE Connect on both devices and pair them. Screen sharing uses the Hyprland portal; applications must select a screen and grant the portal request.

Noctalia stores clipboard history encrypted through the unlocked Secret Service. Older cliphist data remains in ~/.cache/cliphist. To remove the old history deliberately, run `cliphist wipe`.

After Hyprland upgrades, run `hyprpm update` to rebuild the workspace overview plugin. If it fails, the desktop still starts; Super + W opens Noctalia's window switcher.

Setup snapshot, package list and reinstall instructions: ~/.local/share/hash-desktop/bundle-v1. Backup from before Noctalia: ~/.local/share/hash-desktop/backups/pre-noctalia-20261028-144716.
