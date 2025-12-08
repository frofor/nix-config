# nix-config

NixOS configuration with Home Manager.

## Installation

```sh
git clone https://codeberg.org/frofor/nix-config.git ~/nix-config
cd ~/nix-config
cp /etc/nixos/hardware-configuration.nix host/hardware.nix
sudo nixos-rebuild --flake . switch
```

## License

See [COPYING](COPYING).
