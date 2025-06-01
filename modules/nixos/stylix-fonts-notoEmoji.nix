{
  config,
  pkgs,
  ...
}: {
  config.stylix.fonts.emoji = {
    package = pkgs.noto-fonts-emoji;
    name = "Noto Color Emoji";
  };
}
