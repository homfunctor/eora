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
      material-symbols
      nerd-font-patcher
      nerd-fonts.iosevka
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-extra
      unifont
    ];
  };
}
