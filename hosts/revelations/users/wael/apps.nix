# home-manager apps for wael
{flake, ...}: {
  imports = with flake.modules.home; [
    app-apotheosis
    app-baobab
    app-floorp
    app-gaming
    app-gimp
    app-glance
    app-inkscape
    app-kitty
    app-latex
    app-lutris
    app-mate-suite
    app-mathtools
    app-nix-index
    app-nixcord
    app-onlyoffice
    app-pika
    app-qbittorrent
    app-rnote
    app-rofi
    app-simple-scan
    app-strawberry
    app-vivaldi
    app-vlc
    app-zipunicode
    app-zoxide
  ];
}
