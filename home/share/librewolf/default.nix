{ pkgs, colors, ... }:

{
  imports = [ (import ./profiles { inherit pkgs colors; }) ./profiles/i2p.nix ];
  programs.librewolf.enable = true;
}
