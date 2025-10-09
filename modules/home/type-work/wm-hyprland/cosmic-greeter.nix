{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts.bg) monitors files;

  # pair up monitors and files
  monitorBgList =
    lib.zipListsWith (monitor: bg: {inherit monitor bg;}) monitors files;

  # use the list to make individual monitor configs
  monitorCfgs = lib.listToAttrs (
    lib.forEach monitorBgList (
      {
        monitor,
        bg,
      }: {
        name = "cosmic/com.system76.CosmicBackground/v1/${monitor}";
        # make life easier by using toINI generator
        value.text = lib.generators.toINI {} {
          "" = {
            filter_by_theme = false;
            filter_method = "Lanczos";
            output = "all";
            rotation_frequency = 300;
            sampling_method = "Alphanumeric";
            scaling_mode = "Zoom";
            source = ''Path("${bg}")'';
          };
        };
      }
    )
  );

  #  make monitor/bg state file
  bgList =
    lib.concatMapStrings (
      {
        monitor,
        bg,
      }: ''
        ("${monitor}", Path("${bg}")),
      ''
    )
    monitorBgList;
in {
  xdg = {
    configFile =
      monitorCfgs
      // {
        "cosmic/com.system76.CosmicBackground/v1/same-on-all".text = "false";
      };

    stateFile."cosmic/com.system76.CosmicBackground/v1/wallpapers".text = ''
      [
        ${bgList}
      ]
    '';
  };
}
