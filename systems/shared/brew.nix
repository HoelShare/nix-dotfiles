{ pkgs
, ...
}: {

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      "aws/tap"
      {
        name = "shopware/tap";
        trusted = true;
      }
      "chattymin/tap"
    ];

    brews = [
      "docker-credential-helper"
      "lazygit"
      "pi-coding-agent"
      "jq"
      "ncdu"
      "mise"
      "go-parquet-tools"
      "mysql-client"
      "gum"
      "ffmpeg"
      "rtk"
      "uv"
    ];

    casks = [
      "orbstack"
      "gitify"
      {
        name = "codex";
        # ponytail: 0.153.2 shipped signed but not notarized, Gatekeeper kills it.
        # brew bundle only passes args on fresh install, not upgrade; if a later
        # release breaks again: xattr -dr com.apple.quarantine /opt/homebrew/Caskroom/codex
        args.no_quarantine = true;
      }
      "insomnia"
      "lm-studio"
      "cursor"
      "ngrok"
      "chatgpt"
      "slack"
      "claude"
      "discord"
      "whatsapp"
      "visual-studio-code"
      "postman"
      "iterm2"
      "dotnet-sdk"
      "godot-mono"
      "shopware-cli"
      "vercel"
      "chattymin/tap/poke-token-bar"
    ];
  };
}
