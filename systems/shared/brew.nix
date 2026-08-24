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
      "ollama"
      "pi-coding-agent"
      "jq"
      "ncdu"
      "mise"
      "go-parquet-tools"
      "mysql-client"
      "gum"
      "ffmpeg"
      "vercel-cli"
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
      "shopware/tap/shopware-cli"
      "chattymin/tap/poke-token-bar"
    ];
  };
}
