{config, ...}: {
  fonts.fontconfig.defaultFonts = with config.stylix.fonts; {
    emoji = [emoji.name];
    monospace = [monospace.name];
    sansSerif = [sansSerif.name];
    serif = [serif.name];
  };
}
