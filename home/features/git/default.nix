{ pkgs, ... }: {

  home.packages = with pkgs; [
    delta
  ];

  programs.git = {
    enable = true;
    package = pkgs.git;
    lfs = {
      enable = true;
    };

    signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGzSQRZ5tV5xO8s/cp2Q2PwGYQzTdTIcWQ91Mf8xL4+k";
    signing.signByDefault = true;

    settings = {
      user = {
        email = "s.hoelscher@shopware.com";
        name = "Sebastian Hölscher";
      };
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
      fetch.prune = true;

      # Use 1Password op-ssh-sign as the SSH/GPG signer on macOS
      gpg.format = "ssh";
      gpg."ssh".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";

      url."git@github.com:".insteadOf = "https://github.com";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      git = {
        overrideGpg = true;
        pagers = [
          {
            colorArg = "always";
            pager = "delta --dark --paging=never";
          }
        ];
      };
    };
  };

  home.file = {
    ".ssh/allowed_signers".text = "s.hoelscher@shopware.com namespaces=\"git\" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGzSQRZ5tV5xO8s/cp2Q2PwGYQzTdTIcWQ91Mf8xL4+k";
  };
}
