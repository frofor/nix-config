# nix-config

NixOS configuration with Home Manager.

## Installation

### NixOS

```sh
nix shell nixpkgs#git
git clone https://codeberg.org/frofor/nix-config.git ~/.local/src/nix-config
cd ~/.local/src/nix-config
cp /etc/nixos/hardware-configuration.nix "host/$(hostname)/hardware.nix"
git add "host/$(hostname)/hardware.nix"
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
git pull
doas nixos-rebuild --flake . switch
```

### Home Manager

```sh
git pull
home-manager --flake .#"$(hostname)" switch
```

## License

See [COPYING](COPYING).
