# nix-config

NixOS configuration with Home Manager.

## Installation

```sh
git clone https://codeberg.org/frofor/nix-config.git ~/.local/src/frofor/nix-config
cd ~/.local/src/frofor/nix-config
cp /etc/nixos/hardware-configuration.nix host/hardware.nix
sudo nixos-rebuild --flake . switch
```

## License

See [COPYING](COPYING).
