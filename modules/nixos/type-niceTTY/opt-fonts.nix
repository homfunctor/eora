{
  config,
  pkgs,
  ...
}: {
  environment = {
    # todo: i forgot why i added this
    systemPackages = with pkgs; [freetype];

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

    # imperative step: copy fonts to ~/.local/share/fonts and apply chmod 644
    # this is needed for onlyoffice and maybe others
    # todo: declarative way
    packages = with pkgs; [
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
      noto-fonts-emoji
      noto-fonts-extra
      unifont
    ];
  };
}
