{
  config,
  flake,
  lib,
  osConfig,
  ...
}: let
  inherit (config.home.opts) apps bg;
  inherit (config.lib.stylix) colors;
  inherit (flake.lib) splitArg;
  inherit (lib) getExe zipListsWith;
  opts = osConfig.nixos.opts.niri;
in {
  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = true;

    cursor = with config.stylix.cursor; {
      inherit size;
      theme = name;
    };

    input = {
      keyboard.numlock = true;
      mouse.accel-profile = "flat";
      warp-mouse-to-focus.enable = true;
    };

    layout = {
      border = with colors.withHashtag; {
        enable = true;
        active.color = base07;
        inactive.color = base02;
        urgent.color = base08;
      };
      focus-ring.enable = false;
    };

    overview = {
      workspace-shadow.enable = false;
      backdrop-color = "transparent";
    };

    prefer-no-csd = true;

    screenshot-path = "${config.xdg.userDirs.pictures}/Screenshots/$(date '+%Y%m%d-%H:%M:%S').png";
    spawn-at-startup = [
      # {command = [(getExe opts.bg.pkg)] ++ splitArg opts.bg.args;}
    ];

    workspaces = let
      num = lib.range 1 ((lib.length bg.monitors) * bg.nWS);
      mon =
        bg.monitors
        ++ (
          lib.concatLists (lib.genList (_: bg.monitors) (bg.nWS - 1))
        );
    in
      builtins.listToAttrs (zipListsWith (n: m: {
          name = toString n;
          value.open-on-output = m;
        })
        num
        mon);
  };
}
