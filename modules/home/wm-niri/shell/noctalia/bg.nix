{
  config,
  inputs,
  lib,
  ...
}: let
  inherit (config.home.opts.bg) files monitors extMonitors;
  genericBG = "${inputs.sapadal}/assets/base.png";
in {
  programs.noctalia-shell.settings.wallpaper = {
    enabled = true;
    transitionType = "none";
  };

  home.file.".cache/noctalia/wallpapers.json" = lib.mkForce {
    text = builtins.toJSON {
      # separated to handle EXTernal/EXTra monitors
      wallpapers = let
        mainMonitors = lib.listToAttrs (
          lib.zipListsWith (
            m: b: {
              name = m;
              value = b;
            }
          )
          monitors
          files
        );

        extraMonitors = lib.listToAttrs (
          map (
            m: {
              name = m;
              value = genericBG;
            }
          )
          extMonitors
        );
      in
        mainMonitors // extraMonitors;
    };
  };
}
