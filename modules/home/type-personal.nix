# personal fun stuff layered on the tippy top
{flake, ...}: {
  imports = with flake.modules.home; [
    app-apotheosis
    app-baobab
    app-gaming
    app-irony-mod-manager
    app-lutris
    app-nix-tools
    app-nixcord
    app-qbittorrent
    app-strawberry
    app-vivaldi
    app-zipunicode
  ];
}
