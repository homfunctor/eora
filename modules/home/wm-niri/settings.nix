{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) bg;
  inherit (config.lib.stylix) colors;
  inherit
    (lib)
    concatLists
    elemAt
    genList
    length
    listToAttrs
    range
    zipListsWith
    ;

  screenshotDir = "${config.xdg.userDirs.pictures}/Screenshots";
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

    outputs = listToAttrs (
      zipListsWith (m: p: {
        name = m;
        value.position = {
          x = elemAt p 0;
          y = elemAt p 1;
        };
      })
      bg.monitors
      bg.xy
    );

    overview = {
      workspace-shadow.enable = false;
      backdrop-color = "transparent";
    };

    prefer-no-csd = true;

    screenshot-path = "${screenshotDir}/$(date '+%Y%m%d-%H:%M:%S').png";
    spawn-at-startup = [
    ];

    workspaces = let
      num = range 1 ((length bg.monitors) * bg.nWS);
      mon =
        bg.monitors
        ++ (
          concatLists (genList (_: bg.monitors) (bg.nWS - 1))
        );
    in
      listToAttrs (zipListsWith (n: m: {
          name = toString n;
          value.open-on-output = m;
        })
        num
        mon);
  };
}
