{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts.bg) files monitors;
in {
  programs.noctalia-shell.settings.wallpaper = {
    enabled = true;

    # testing this
    overviewEnabled = true;
  };

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      wallpapers = lib.listToAttrs (
        lib.zipListsWith (
          m: b: {
            name = m;
            value = b;
          }
        )
        monitors
        files
      );
    };
  };
}
