{ pkgs
, remapKeys
, ...
}: {
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.5;

    autohide-time-modifier = 0.2;
    expose-animation-duration = 0.2;
    tilesize = 48;
    launchanim = true;
    static-only = false;
    showhidden = true;
    show-recents = false;
    show-process-indicators = true;
    orientation = "bottom";
    mru-spaces = false;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.NSWindowShouldDragOnGesture = true;
    WindowManager.EnableStandardClickToShowDesktop = true;
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    finder.FXEnableExtensionChangeWarning = true;
    NSGlobalDomain."com.apple.swipescrolldirection" = false;
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.finder" = {
      ShowExternalHardDrivesOnDesktop = true;
      ShowHardDrivesOnDesktop = true;
      ShowMountedServersOnDesktop = true;
      ShowRemovableMediaOnDesktop = true;
      _FXSortFoldersFirst = true;
      # When performing a search, search the current folder by default
      FXDefaultSearchScope = "SCcf";
    };
    "com.apple.desktopservices" = {
      # Avoid creating .DS_Store files on network or USB volumes
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };
    "com.apple.AdLib" = {
      allowApplePersonalizedAdvertising = false;
    };
    "com.apple.SoftwareUpdate" = {
      AutomaticCheckEnabled = true;
      ScheduleFrequency = 1;
      AutomaticDownload = 1;
      CriticalUpdateInstall = 0;
    };
    "com.apple.ImageCapture".disableHotPlug = true;
    "com.apple.commerce".AutoUpdate = true;
  };
}
