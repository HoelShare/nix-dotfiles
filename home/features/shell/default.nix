{ pkgs, ... }: {

  home.packages = with pkgs; [
    fzf
    fd
    bat
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "git"
        "fzf"
        "docker"
        "aws"
        "terraform"
        "golang"
        "python"
        "php"
        "npm"
        "history"
        "colored-man-pages"
        "command-not-found"
      ];

    };

    # workaround for fixing the path order: https://github.com/LnL7/nix-darwin/issues/122
    initContent = ''
      # Homebrew config
      export HOMEBREW_PREFIX="/opt/homebrew"
      export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
      export HOMEBREW_REPOSITORY="/opt/homebrew"
      export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
      export MANPATH="/opt/homebrew/share/man:$MANPATH"
      export INFOPATH="/opt/homebrew/share/info:$INFOPATH"

      # Go Binaries
      export PATH="$GOPATH/bin:$PATH"

      # MySQL
      export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"


      awsx() {
        if [ -z "$AWSX_PROFILES" ]; then
          export AWS_PROFILES=$(aws configure list-profiles | tr '\n' '\0')
        fi
        export AWS_PROFILE=$(echo "$AWS_PROFILES" | fzf)
        echo "Using profile: $AWS_PROFILE"
        if ! aws sts get-caller-identity &> /dev/null; then
          echo "AWS SSO Session expired. Logging in..."
          aws sso login
        else
          echo "Found valid SSO session, using it!"
        fi
      }
    '';
  };

  programs.starship = {
    enable = true;
  };

  home.file = {
    ".config/starship.toml".source = ./starship.toml;
  };

  home.shellAliases = {
    "cat" = "bat -pp";
    "tailscale" = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
    "k" = "kubectl";
    "ll" = "eza --icons --group --group-directories-first -l";
  };
}
