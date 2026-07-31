{ pkgs, config, ... }: {

  programs.go = {
    enable = true;
    package = pkgs.go;
    env.GOPATH = "${
    "/Users/sebastian/.go"
    }";
  };
}