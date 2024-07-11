# Mov-cli with Plugins for NixOS
## About
This is a nix-shell script to have mov-cli installed with all of its official plugins. [mov-cli](https://github.com/mov-cli/mov-cli) basically allows you to watch videos from your terminal.

This does not configure mov-cli; to do that, you will need to edit `~/.config/mov-cli/config.toml` yourself using the [mov-cli wiki](https://github.com/mov-cli/mov-cli/wiki/Configuration).

## Usage
Download the shell.nix script and then run it using `nix-shell /path/to/shell.nix`
To avoid writing it down all the time, I made an abbreviation in my fish config: `pymov = "nix-shell ~/.dotfiles/python-env/py-mov-cli/shell.nix --command 'fish'";`

---
I might eventually turn this into a flake or something 🤷
