{ config, pkgs, ... }:

{
  imports = [
    ./default.nix
    ./features/hammerspoon
  ];

  home.username = "sebastian";
  home.homeDirectory = "/Users/sebastian";
}
