# Systemd Nostalgia

An Omarchy theme: a cold cyan palette, and a meme video playing behind the desktop.

Omarchy's wallpaper is a still image. This theme ships that still for the lock screen and theme transitions, and plays `video/wallpaper.mp4` on every connected monitor.

`omarchy theme install` will not do this. A theme cloned that way is not allowed to run code, and Omarchy does not play video wallpapers. Clone the repo and run `./install`.

## Install

```bash
git clone https://github.com/1818TusculumSt/systemd-nostalgia-wallpaper.git
cd systemd-nostalgia-wallpaper
omarchy pkg add mpvpaper
./install
```

`./install` links this checkout to `~/.config/omarchy/themes/systemd-nostalgia`, registers hooks, and applies the theme.

- Switching to another theme stops the video.
- Switching back, or logging in with this theme active, starts it again.
- It uses whatever monitors are connected. Nothing in the theme is a home-directory path or a monitor name.

`git pull` in this checkout updates the theme. Run `./install` again only if you moved the checkout.
