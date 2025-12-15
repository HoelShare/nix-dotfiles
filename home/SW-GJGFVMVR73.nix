{ config, pkgs, flake, ... }:

{
  imports = [
    ./default.nix
    ./features/hammerspoon
  ];

  home.username = "sebastian";
  home.homeDirectory = "/Users/sebastian";
}
