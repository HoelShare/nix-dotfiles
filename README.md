# nix-dotfiles

## Requirements

You need to install Nix, but we are not using their official installer. Instead, we are using the Determinate Systems Nix Installer. You can download it [here](https://install.determinate.systems/determinate-pkg/stable/Universal)!

To update your Nix version to the latest recommended release, use the following command

```bash
sudo determinate-nixd upgrade
```

### Homebrew

Some applications need to be installed through homebrew, so we just install it.
* https://brew.sh/

## Setup

1. Clone the repository

```bash
git clone git@github.com:hoelshare/nix-dotfiles.git ~/.config/nix-dotfiles
```

1. Initialize the Nix setup with

```bash
nix run nix-darwin -- switch --flake ~/.config/nix-dotfiles
```

1. If you want to apply your changes in the future you need to run

```bash
darwin-rebuild switch --flake ~/.config/nix-dotfiles/ --show-trace
```

### Change default shell

You can change your default shell with

```bash
chsh -s <Change this to your shell path which you can find in /etc/shells there is a comment with shells managed by nix>
```
