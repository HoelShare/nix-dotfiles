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
    ];

    brews = [
      "docker-credential-helper"
      "lazygit"
      "ollama"
      "jq"
      "ncdu"
      "go-parquet-tools"
      "mysql-client"
    ];

    casks = [
      "orbstack"
      "hammerspoon"
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
    ];
  };
}
