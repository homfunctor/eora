# todo: fix weird config conflict bug
{
  inputs,
  lib,
  ...
}: {
  imports = with inputs; [
    nixcord.homeModules.nixcord
    # plugins.*.enable
    sapadal.modules.home.app-nixcord
  ];
  programs.nixcord = {
    enable = true;

    config = {
      frameless = true;
      useQuickCss = true;
    };

    extraConfig = {
      # json
    };

    quickCss = "some CSS";
  };

  stylix.targets.nixcord.enable = lib.mkForce false;
}
