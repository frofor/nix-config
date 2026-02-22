{ config, pkgs, user, ... }:

{
  scripts = import ./scripts { inherit config pkgs user; };
}
