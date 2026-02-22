{ config, pkgs, user, latitude, longitude, ... }:

{
  scripts = import ./scripts { inherit config pkgs user latitude longitude; };
}
