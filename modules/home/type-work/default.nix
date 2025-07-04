# work environment layered on top of minimal/nicer tty
{
  imports = [
    ./app-alacritty.nix
    ./app-gimp.nix
    ./app-glance.nix
    ./app-inkscape.nix
    ./app-librewolf.nix
    ./app-math
    ./app-nix-index.nix
    ./app-nwg-drawer.nix
    ./app-onlyoffice.nix
    ./app-pika.nix
    ./app-rnote.nix
    ./app-simple-scan.nix
    ./app-syncthing
    ./app-udiskie.nix
    ./app-vlc.nix
    ./app-zathura.nix
    ./opt-mime.nix
    ./opt-stylix
    ./opt-xdg.nix
    ./suite-gnomeApps.nix
    ./suite-hyprEcosystem.nix
    ./suite-miscUtils.nix
    ./suite-qt.nix
    ./wm-hyprland
  ];
}
