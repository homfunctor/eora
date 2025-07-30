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
  };
}
