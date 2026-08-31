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
      {
        name = "aws/tap";
        trusted = true;
      }
      "chattymin/tap"
    ];

    brews = [
      "docker-credential-helper"
      "lazygit"
      "ollama"
      "pi-coding-agent"
      "jq"
      "ncdu"
      "mise"
      "go-parquet-tools"
      "mysql-client"
      "gum"
      "ffmpeg"
      "rtk"
      "vercel-cli"
      "uv"
    ];

    casks = [
      "orbstack"
      "gitify"
      "codex"
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
      "chattymin/tap/poke-token-bar"
    ];
  };
}
