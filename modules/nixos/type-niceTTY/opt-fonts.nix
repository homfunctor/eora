{
  config,
  pkgs,
  ...
}: {
  console = {
    font = "ter-124b";
    keyMap = "us";
    packages = [pkgs.terminus_font];
  };

  environment.variables.LOG_ICONS = "true";

  fonts = {
    fontDir.enable = true;

    fontconfig = {
      enable = true;

      antialias = true;
      cache32Bit = true;
      hinting.enable = true;
      subpixel.rgba = "rgb";
      useEmbeddedBitmaps = true;

      defaultFonts = with config.stylix.fonts; {
        monospace = [monospace.name "Noto Color Emoji"];
        sansSerif = [sansSerif.name "Noto Color Emoji"];
        serif = [serif.name "Noto Color Emoji"];
      };
    };

    packages = with pkgs; [
      aporetic
      font-awesome
      material-design-icons
      material-icons
      material-symbols
      nerd-font-patcher
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono # for hyprpanel
      nerd-fonts.symbols-only
      nerd-fonts.tinos # work documents
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];
  };
}
