{
  lib,
  ...
}: {
  home.activation = {
    iTermDefaults = lib.hm.dag.entryAfter ["writeBoundary"] ''
        defaults write com.googlecode.iterm2 ScrollbackLines -int 0
        defaults write com.googlecode.iterm2 PromptOnQuit -bool false
        defaults write com.googlecode.iterm2 BlinkingCursor -bool true
        defaults write com.googlecode.iterm2 ShowFullScreenTabBar -bool true
    '';
  };

}
