# uwu-files

This repo contains my dot files

# MacOS set up (current)
``` bash
# 1. make sure you have zsh installed (https://ohmyz.sh/#install)
# 2. install antigen (zsh plugin manager )
# https://github.com/zsh-users/antigen
curl -L git.io/antigen > ~/antigen.zsh

# 3. stow - handles symlinking dotfiles with correct hieararchy
brew install stow

# =======
# Setup 
# ======= 
# use stow to symlink dotfiles:
stow -t $HOME zsh
stow -t $HOME nvim
stow -t $HOME vim
stow -t $HOME emacs
```

# Linux: 

1. dotfiles: mostly just zsh and i3
2. bash aliases: git shortcuts and destinations I use v frequently
3. init script for dot files: copies config files from this repo to the paths expected by each corresponding program:

- to set up the config, run `./setup_config linux` for linux or `./setup_config mac` for mac
  - for personal config, create `~/.config_personal_mac`
  - for work config, create `~/.config_work`

## Programs/Packages I'm currently using (linux)

(make sure these are installed for the config to function properly)

- i3: tiling wm
- compton: lightweight x11 compositor
- kitty: my term em of choice rn
- zsh: my fav shell
- nautilus: file manager
- visual studio code
- [arandr](https://christian.amsuess.com/tools/arandr/): xrandr gui for managing displays more easily
- [autorandr](https://github.com/wertarbyte/autorandr): for auto detecting monitors and applying a config bc I usually use an external monitor
- [srandrd](https://github.com/jceb/srandrd): randr daemon to detect monitor changes and auto reload autorandr
- [ulauncher](https://ulauncher.io/): app launcher though I might swap it out for another one soon
- redshift: flux for linux
- [light](https://github.com/haikarainen/light): controlling brightness
- xautolock: for monitoring x window and auto locking
  \*note about light, make sure to install 1.1.2 or below or else it'll require superuser permissions

# Tips & Tricks

- To set up keyboard remappings after plugging in an external keyboard, just reload i3

# Solutions to common problems

- No polkit auth agent: install [policykit-1-gnome](https://launchpad.net/ubuntu/+source/policykit-1-gnome)
- Scrolling stops working after refresh : follow these [instructions](https://askubuntu.com/questions/1053720/scrolling-not-working-after-suspend-looking-for-permanent-solution)
- Set FF as default browser: `sudo xdg-settings set default-web-browser opera.desktop`
- To use `memory` module for i3status, need to update to v2.12+

# TODO

create scripts to install programs that I always use
