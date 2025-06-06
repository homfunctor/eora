# home-manager apps for user
{flake, ...}: {
  imports = with flake.modules.home; [
    app-floorp
    app-kitty
    app-latex
    app-mate-suite
    app-mathtools
    app-nix-index
    app-onlyoffice
    app-rnote
    app-rofi
    app-simple-scan
    app-zoxide
  ];
}
