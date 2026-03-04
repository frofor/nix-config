{ pkgs, colors, ... }:

{
  imports = [
    (import ./profiles { inherit pkgs colors; })
    (import ./profiles/i2p.nix { inherit pkgs colors; })
  ];
  programs.librewolf.enable = true;
}
