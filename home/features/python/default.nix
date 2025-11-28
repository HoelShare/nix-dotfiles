{ pkgs
, ...
}: {
  home.packages = [
    (pkgs.python314.withPackages (ppkgs: []))
    pkgs.pipenv
    pkgs.virtualenv
    pkgs.uv
  ];
}