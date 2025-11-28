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
    ];

    casks = [
      "orbstack"
      "hammerspoon"
      "gitify"
      "codex"
      "insomnia"
      "lm-studio"
      "cursor"
      "chatgpt"
      "slack"
      "discord"
      "whatsapp"
      "visual-studio-code"
      "postman"
    ];
  };
}
