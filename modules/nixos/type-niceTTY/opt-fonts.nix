{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      freetype
      smile
    ];
    variables.LOG_ICONS = "true";
  };

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    fontconfig = {
      enable = true;

      antialias = true;
      cache32Bit = true;
      hinting.enable = true;

      defaultFonts = with config.stylix.fonts; {
        monospace = [monospace.name "Noto Color Emoji"];
        sansSerif = [sansSerif.name "Noto Color Emoji"];
        serif = [serif.name "Noto Color Emoji"];
      };
    };

    packages = with pkgs; [
      font-awesome

      liberation_ttf
      material-design-icons
      material-icons
      material-symbols
      nerd-font-patcher
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono # for hyprpanel
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
