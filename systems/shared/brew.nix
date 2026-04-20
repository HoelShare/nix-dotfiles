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
      "mise"
      "go-parquet-tools"
      "mysql-client"
      "gum"
      "ffmpeg"
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
