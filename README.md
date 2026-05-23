# nix-config

NixOS configuration with Home Manager.

## Installation

### NixOS

```sh
nix shell nixpkgs#git
git clone https://codeberg.org/frofor/nix-config.git ~/.local/src/nix-config
cd ~/.local/src/nix-config
cp /etc/nixos/hardware-configuration.nix host/hardware.nix
git add host/hardware.nix
sudo nixos-rebuild --flake . switch
```

### Home Manager

```sh
nix shell nixpkgs#git
git clone https://codeberg.org/frofor/nix-config.git ~/.local/src/nix-config
cd ~/.local/src/nix-config
nix profile add nixpkgs#home-manager
home-manager --flake .#"$(hostname)" switch
```

## Updating

### NixOS

```sh
cd ~/.local/src/nix-config
git pull
doas nixos-rebuild --flake . switch
```

### Home Manager

```sh
cd ~/.local/src/nix-config
git pull
home-manager --flake .#"$(hostname)" switch
```

## License

See [COPYING](COPYING).
