{config, ...}: let
  inherit (config.home.opts.cosmic-greeter) monitor bg;
in {
  xdg = {
    configFile = {
      "cosmic/com.system76.CosmicBackground/v1/all".text = ''
        (
           filter_by_theme: false,
           filter_method: Lanczos,
           output: "all",
           rotation_frequency: 300,
           sampling_method: Alphanumeric,
           scaling_mode: Zoom,
           source: Path("${bg}"),
         )
      '';

      "cosmic/com.system76.CosmicBackground/v1/same-on-all".text = "true";
    };

    stateFile = {
      "cosmic/com.system76.CosmicBackground/v1/wallpapers".text = ''
        [
          ("${monitor}", Path("${bg}")),
        ]
      '';
    };
  };
}
