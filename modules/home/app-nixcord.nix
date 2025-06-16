# todo: fix weird config conflict bug
{inputs, ...}: {
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
}
