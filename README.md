# uwu-files

This repo contains all the config files I need to set up my workflow
1. dot files: mostly just zsh and i3
2. bash aliases: git shortcuts and destinations I use v frequently
3. init script for dot files: copies config files from this repo to the paths expected by each corresponding program: 

instructions and inspo from [here](https://www.freecodecamp.org/news/dive-into-dotfiles-part-2-6321b4a73608)

# Programs/Packages I'm currently using
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
*note about light, make sure to install 1.1.2 or below or else it'll require superuser permissions

# Tips & Tricks
- To set up keyboard remappings after plugging in an external keyboard, just reload i3  

# Solutions to common problems
- No polkit auth agent: install [policykit-1-gnome](https://launchpad.net/ubuntu/+source/policykit-1-gnome) 
- Scrolling stops working after refresh : follow these [instructions](https://askubuntu.com/questions/1053720/scrolling-not-working-after-suspend-looking-for-permanent-solution)
- Set FF as default browser: `sudo xdg-settings set default-web-browser opera.desktop`
- To use `memory` module for i3status, need to update to v2.12+

# TODO
create scripts to install programs that I always use 