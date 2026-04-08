{
  lib,
  pkgs,
  ...
}: {
  home.activation = {
    installClaudeCode = lib.hm.dag.entryAfter ["writeBoundary"] ''
      claude_bin="$HOME/.local/bin/claude"
      installer_path="${pkgs.curl}/bin:${pkgs.wget}/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

      if [ -x "$claude_bin" ]; then
        verboseEcho "Claude Code native install already present at $claude_bin"
      else
        verboseEcho "Installing Claude Code via Anthropic native installer"
        run /usr/bin/env PATH="$installer_path" ${pkgs.bash}/bin/bash -c "${pkgs.curl}/bin/curl -fsSL https://claude.ai/install.sh | ${pkgs.bash}/bin/bash"
      fi
    '';
  };
}
