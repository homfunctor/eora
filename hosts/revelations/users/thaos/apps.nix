# home-manager apps for user
{flake, ...}: {
  imports = with flake.modules.home; [
    app-kitty
    app-latex
    app-mate-suite
    app-mathtools
    app-nix-index
    app-onlyoffice
    app-rnote
    app-rofi
    app-simple-scan
    app-zen-browser
    app-zoxide
  ];
}
