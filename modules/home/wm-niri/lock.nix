{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs = {
    swaylock = {
      enable = true;
      settings = {
        image = lib.mkForce "${inputs.sapadal}/assets/durinsgate.jpg";
        scaling = "fill";
        font = config.stylix.fonts.sansSerif.name;
      };
    };

    niri.settings.binds = with config.lib.niri.actions; {
      "Mod+Alt+L".action.spawn = lib.getExe pkgs.swaylock;
    };
  };
}
