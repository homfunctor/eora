{
  config,
  pkgs,
  ...
}: {
  environment.variables.LOG_ICONS = "true";

  fonts = {
    enableDefaultPackages = true;

    fontconfig.defaultFonts = with config.stylix.fonts; {
      sansSerif = [sansSerif.name];
      monospace = [monospace.name];
      emoji = [emoji.name];
    };
    fontDir.enable = true;

    packages = with pkgs; [
      fontconfig
      nerd-font-patcher
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-extra
    ];
  };
}
