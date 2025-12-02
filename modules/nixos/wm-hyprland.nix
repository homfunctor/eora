{
  config,
  lib,
  ...
}: {
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    uwsm.enable = true;
  };

  nixos.opts = let
    uwsmExe = "${lib.getExe config.programs.uwsm.package}";
  in {loginCmd = "${uwsmExe} start hyprland-uwsm.desktop";};
}
