# home-manager apps for rymrgand
{flake, ...}: {
  imports = with flake.modules.home; [
    app-floorp
    app-gimp
    app-inkscape
    app-kitty
    app-latex
    app-mate-suite
    app-mathtools
    app-nix-index
    app-onlyoffice
    app-pika
    app-rnote
    app-rofi
    app-simple-scan
    app-vivaldi
    app-vlc
    app-zoxide
  ];
}
