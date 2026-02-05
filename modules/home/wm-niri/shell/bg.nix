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
      wallpapers =
        lib.listToAttrs (
          lib.zipListsWith (
            m: b: {
              name = m;
              value = b;
            }
          )
          monitors
          files
        )
        //
        # handle external monitors if they exist
        (lib.listToAttrs (
          lib.zipListsWith (
            m: {
              name = m;
              value = genericBG;
            }
          )
          extMonitors
        ));
    };
  };
}
