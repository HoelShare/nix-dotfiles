{
  pkgs,
  ...
}: {
  services.aerospace = {
    enable = true;
    package = pkgs.aerospace;
    settings = {
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
      on-focus-changed = ["move-mouse window-lazy-center"];

      automatically-unhide-macos-hidden-apps = false;

      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      key-mapping.preset = "qwerty";

      gaps = {
        inner = {
          horizontal = 10;
          vertical = 10;
        };
        outer = {
          left = 10;
          right = 10;
          bottom = 10;
          top = 10;
        };
      };

      workspace-to-monitor-force-assignment = {
        "0" = "built-in";
      };

      mode.main.binding = {
          ctrl-alt-cmd-left = "focus left";
          ctrl-alt-cmd-down = "focus down";
          ctrl-alt-cmd-up = "focus up";
          ctrl-alt-cmd-right = "focus right";

          # -----------------------------
          # Window Movement (SHIFT + HOMEROW)
          # -----------------------------
          ctrl-alt-cmd-shift-left = "move left";
          ctrl-alt-cmd-shift-down = "move down";
          ctrl-alt-cmd-shift-up = "move up";
          ctrl-alt-cmd-shift-right = "move right";

          ctrl-alt-cmd-f = "layout floating tiling";
          ctrl-alt-cmd-shift-f = "fullscreen";

          ctrl-alt-cmd-1 = "workspace 1";
          ctrl-alt-cmd-2 = "workspace 2";
          ctrl-alt-cmd-3 = "workspace 3";
          ctrl-alt-cmd-4 = "workspace 4";
          ctrl-alt-cmd-5 = "workspace 5";
          ctrl-alt-cmd-6 = "workspace 6";
          ctrl-alt-cmd-7 = "workspace 7";
          ctrl-alt-cmd-8 = "workspace 8";
          ctrl-alt-cmd-9 = "workspace 9";
          ctrl-alt-cmd-0 = "workspace 0";

          # Move window to workspace
          ctrl-alt-cmd-shift-1 = "move-node-to-workspace 1";
          ctrl-alt-cmd-shift-2 = "move-node-to-workspace 2";
          ctrl-alt-cmd-shift-3 = "move-node-to-workspace 3";
          ctrl-alt-cmd-shift-4 = "move-node-to-workspace 4";
          ctrl-alt-cmd-shift-5 = "move-node-to-workspace 5";
          ctrl-alt-cmd-shift-6 = "move-node-to-workspace 6";
          ctrl-alt-cmd-shift-7 = "move-node-to-workspace 7";
          ctrl-alt-cmd-shift-8 = "move-node-to-workspace 8";
          ctrl-alt-cmd-shift-9 = "move-node-to-workspace 9";
          ctrl-alt-cmd-shift-0 = "move-node-to-workspace 0";

          # -----------------------------
          # Workspace cycling
          # -----------------------------
          ctrl-alt-cmd-tab = "workspace next";
          ctrl-alt-cmd-shift-tab = "workspace prev";

          ctrl-alt-cmd-l = "mode layout";
          ctrl-alt-cmd-r = "mode resize";

          ctrl-alt-cmd-b = "exec-and-forget open -na /Applications/Comet.app";
          ctrl-alt-cmd-alt-enter = "exec-and-forget open -na /Applications/iTerm.app";
          alt-l = "exec-and-forget pmset displaysleepnow";
      };

      mode.resize.binding = {
        left = "resize width +50";
        right = "resize width -50";
        up = "resize height +50";
        down = "resize height -50";
        enter = "mode main";
        esc = "mode main";
      };

      mode.layout.binding = {
        esc = "mode  main";
        enter = "mode main";
        r = "flatten-workspace-tree";
        alt-left = "join-with left";
        alt-right = "join-with right";
        alt-up = "join-with up";
        alt-down = "join-with down";
        alt-s = "layout v_accordion";
        alt-w = "layout h_accordion";
        alt-e = "layout tiles horizontal vertical";
      };
    };
  };

  services.jankyborders = {
    enable = true;
    inactive_color = "0xff494d64";
  };
}
