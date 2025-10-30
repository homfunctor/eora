{
  config,
  pkgs,
  ...
}: {
  environment.variables.LOG_ICONS = "true";

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

    # for onlyoffice:
    # z /nix/store/*-nerd-fonts-tinos*/share/fonts/truetype
    # cp -r * ~/.local/share/fonts
    #
    # for lualatex:
    # black magick rituals. honestly don't know but the following has worked:
    # luaotfload-tool --update --force
    # and repeated attempts to compile
    # also do the above for iosevka as well
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
      noto-fonts-color-emoji
      unifont
    ];
  };
}
