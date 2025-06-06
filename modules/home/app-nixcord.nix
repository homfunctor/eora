{inputs, ...}: {
  imports = with inputs; [
    nixcord.homeModules.nixcord
    # plugins.*.enable
    sapadal.modules.home.app-nixcord
  ];
  programs.nixcord = {
    enable = true;
    quickCss = "some CSS";

    config = {
      useQuickCss = true;
      frameless = true;
    };

    extraConfig = {
      # json
    };
  };
}
