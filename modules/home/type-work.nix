# work environment layered on top of minimal tty
{flake, ...}: {
  imports = with flake.modules.home; [
    app-alacritty
    app-gimp
    app-glance
    app-inkscape
    app-latex
    app-mathtools
    app-nix-index
    app-onlyoffice
    app-pika
    app-rnote
    app-simple-scan
    app-syncthing
    app-vlc
    app-zathura
    app-zen-browser
    dewm
    opt-stylix
  ];
}
