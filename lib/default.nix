{ config, pkgs, user, ... }:

{
  scripts = import ./scripts { inherit config pkgs user; };
  mpvSocket = "/run/user/1000/mpv.sock";
}
