{ config, pkgs, flake, ... }:

{
  imports = [
    ./default.nix
  ];

  home.username = "sebastian";
  home.homeDirectory = "/Users/sebastian";
}
