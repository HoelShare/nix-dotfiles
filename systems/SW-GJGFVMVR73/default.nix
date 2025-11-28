{ pkgs
, home-manager
, flake
, lib
, config
, ...
}: {
  imports = [
    ../shared/aerospace.nix
    ../shared/brew.nix
    ../shared/system.nix
    ../shared/fonts.nix
  ];

  system.stateVersion = 5;
  system.primaryUser = "sebastian";

  ids.gids.nixbld = 30000;

  users.users.sebastian = {
    home = "/Users/sebastian";
    shell = "${pkgs.zsh}/bin/zsh";
  };

  home-manager.users.sebastian = {
    imports = [
      ../../home/SW-GJGFVMVR73.nix
    ];
  };

  environment.systemPackages = with pkgs; [
    raycast
  ];

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  environment.shells = [ "${pkgs.zsh}/bin/zsh" ];

  documentation.enable = false;
  documentation.man.enable = true;

  time.timeZone = "Europe/Berlin";

  nix.enable = false;
}
