# work environment layered on top of minimal/nicer tty
{flake, ...}: {
  imports = with flake.modules.home; [
    app-alacritty
    app-gimp
    app-glance
    app-inkscape
    app-librewolf
    app-math
    app-nix-index
    app-onlyoffice
    app-pika
    app-rnote
    app-rofi
    app-simple-scan
    app-syncthing
    app-udiskie
    app-vlc
    app-zathura
    opt-keyring
    opt-mime
    opt-stylix
    opt-xdg
    wm-hyprland
  ];
}
