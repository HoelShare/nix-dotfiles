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

      export PATH="$HOME/.local/bin:$PATH"

      # Mise
      eval "$(mise activate zsh)"

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

      codex_commit_all() {
        local diff_file message_file prompt commit_message

        if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
          echo "Not inside a git repository."
          return 1
        fi

        if [ -z "$(git status --short)" ]; then
          echo "Working tree is clean."
          return 1
        fi

        diff_file=$(mktemp)
        message_file=$(mktemp)

        {
          echo "=== GIT STATUS ==="
          git status --short
          echo
          echo "=== STAGED DIFF ==="
          git --no-pager diff --cached --no-ext-diff
          echo
          echo "=== UNSTAGED DIFF ==="
          git --no-pager diff --no-ext-diff

          if [ -n "$(git ls-files --others --exclude-standard)" ]; then
            echo
            echo "=== UNTRACKED FILE DIFFS ==="
            while IFS= read -r file; do
              [ -z "$file" ] && continue
              echo
              echo "--- $file ---"
              git --no-pager diff --no-index -- /dev/null "$file" || true
            done < <(git ls-files --others --exclude-standard)
          fi
        } > "$diff_file"

        cat "$diff_file"
        echo

        prompt=$(cat <<'EOF'
Review the git status and diffs from stdin and return exactly one conventional commit message.
Requirements:
- Output exactly one line.
- Format: type(scope optional): summary
- Choose the most appropriate conventional commit type.
- Keep the summary specific to the provided changes.
- No quotes, bullets, code fences, or explanation.
- Maximum 72 characters.
EOF
)

        if ! codex exec --skip-git-repo-check --color never -C "$(git rev-parse --show-toplevel)" -o "$message_file" "$prompt" < "$diff_file"; then
          rm -f "$diff_file" "$message_file"
          echo "Codex failed to generate a commit message."
          return 1
        fi

        commit_message=$(tr -d '\r' < "$message_file" | tail -n 1 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

        if [ -z "$commit_message" ]; then
          rm -f "$diff_file" "$message_file"
          echo "Codex returned an empty commit message."
          return 1
        fi

        echo "Commit message: $commit_message"
        rm -f "$diff_file" "$message_file"

        git add -A
        git commit -m "$commit_message"
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
    "ccommit" = "codex_commit_all";
    "ll" = "eza --icons --group --group-directories-first -l";
    "ngrokh" = "ngrok http --url=sound-buzzard-picked.ngrok-free.app";
    "rebuild" = "sudo darwin-rebuild switch --flake ~/.config/nix-dotfiles/ --show-trace";
  };
}
