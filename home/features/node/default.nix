{ pkgs, lib, ... }:

let
  version = "2.2.3";

  # Package uipro-cli from npm because it is not (currently) available in nixpkgs.
  uipro-cli = pkgs.stdenvNoCC.mkDerivation {
    pname = "uipro-cli";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/uipro-cli/-/uipro-cli-${version}.tgz";
      hash = "sha256-Tmnux4rq+5bgL7JToMVSTWlmfixUL+N5V+0BDrtmxdU=";
    };

    # The npm tarball unpacks to a directory named "package".
    sourceRoot = "package";

    nativeBuildInputs = [ pkgs.jq pkgs.makeWrapper ];

    dontBuild = true;

    installPhase = ''
      runHook preInstall

      # Install the package contents.
      mkdir -p "$out/lib/uipro-cli"
      cp -R . "$out/lib/uipro-cli"

      # Create a stable wrapper for the CLI.
      mkdir -p "$out/bin"

      # Determine the bin entry from package.json.
      BIN_PATH=$(jq -r '
        .bin as $b |
        if $b == null then "" else
        if ($b|type) == "string" then $b else
        ( $b.uipro // ($b | to_entries | .[0].value) )
        end end
      ' package.json)

      if [ -z "$BIN_PATH" ] || [ "$BIN_PATH" = "null" ]; then
        echo "ERROR: Could not determine bin entry from package.json (.bin)" >&2
        cat package.json >&2
        exit 1
      fi

      makeWrapper "${pkgs.nodejs_22}/bin/node" "$out/bin/uipro" \
        --add-flags "$out/lib/uipro-cli/$BIN_PATH"

      runHook postInstall
    '';

    meta = with lib; {
      description = "CLI to install UI/UX Pro Max skill for AI coding assistants";
      homepage = "https://www.npmjs.com/package/uipro-cli";
      license = licenses.cc-by-nc-40;
      mainProgram = "uipro";
      platforms = platforms.all;
    };
  };
in
{
  home.packages = [
    pkgs.nodejs_22
    uipro-cli
  ];
}