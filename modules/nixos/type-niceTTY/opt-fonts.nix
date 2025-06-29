{
  config,
  pkgs,
  ...
}: {
  environment.variables.LOG_ICONS = "true";

  fonts = {
    # enableDefaultPackages = true;

    fontconfig.defaultFonts = with config.stylix.fonts; {
      emoji = [emoji.name];
      monospace = [monospace.name];
      sansSerif = [sansSerif.name];
      serif = [serif.name];
    };
    fontDir.enable = true;

    packages = with pkgs; [
      font-awesome
      material-design-icons
      material-icons
      nerd-fonts.iosevka
      nerd-fonts.symbols-only
      nerd-font-patcher
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-extra
      unifont
    ];
  };
}
