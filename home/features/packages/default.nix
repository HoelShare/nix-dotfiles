{ pkgs, flake, ... }: {

  home.packages = with pkgs; [
    flake.inputs.devenv.packages.${system}.devenv
    cachix

    nixpkgs-fmt

    _1password-cli
    jq
    gnused
    ripgrep
    unixtools.watch
    htop
    coreutils
    pigz
    ssm-session-manager-plugin
    wget
    uv
    nmap
    tsx
    claude-code

    terraform

    postgresql

    docker-client
    docker-buildx
    dive
    bun
    gh
    awscli2

    kind
  ];
}
