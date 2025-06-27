{
  config,
  pkgs,
  ...
}: {
  config.stylix.fonts.emoji = {
    name = "Symbols Nerd Font";
    package = pkgs.nerd-fonts.symbols-only;
  };
}
