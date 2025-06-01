{
  config,
  pkgs,
  ...
}: {
  config.stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font Mono";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
    };

    serif = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
    };
  };
}
