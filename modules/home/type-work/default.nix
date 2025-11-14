# work environment layered on top of minimal/nice tty
{
  imports = [
    ./app-firefox.nix
    ./app-glance.nix
    ./app-graphics.nix
    ./app-hyprApps.nix
    # ./app-joplin.nix
    ./app-kitty.nix
    ./app-math
    ./app-minimal.nix
    ./app-neovide.nix
    ./app-nix-index.nix
    ./app-nwg-drawer.nix
    ./app-office.nix
    ./app-pika.nix
    ./app-simple-scan.nix
    ./app-sioyek.nix
    ./app-starship.nix
    ./app-syncthing
    ./app-thunderbird.nix
    ./app-udiskie.nix
    ./app-utils.nix
    ./opt-dconf.nix
    ./opt-mime.nix
    ./opt-qt.nix
    ./opt-stylix
    ./opt-xdg.nix
    ./wm-hyprland
  ];
}
