{pkgs, ...}: {
  stylix.fonts.emoji = {
    name = "Noto Color Emoji";
    package = pkgs.noto-fonts-emoji;
  };
}
