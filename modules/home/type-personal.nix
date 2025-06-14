# personal fun stuff layered on the tippy top
{flake, ...}: {
  imports = with flake.modules.home; [
    # app-apotheosis
    app-baobab
    app-gaming
    app-lutris
    app-nixcord
    app-qbittorrent
    app-strawberry
    app-vivaldi
    app-zipunicode
  ];
}
