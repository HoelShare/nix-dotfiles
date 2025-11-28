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
      "mysql-client"
      "aqua"
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
      "visual-studio-code"
    ];
  };
}
