# nix-config

NixOS configuration with Home Manager.

## Installation

```sh
nix shell nixpkgs#git
git clone https://codeberg.org/frofor/nix-config.git ~/.local/src/nix-config
cd ~/.local/src/nix-config
cp /etc/nixos/hardware-configuration.nix "host/$(hostname)/hardware.nix"
sudo nixos-rebuild --flake . switch
```

## License

See [COPYING](COPYING).
