{
  imports = [
    ./hw-graphics.nix
    ./sops-keyring.nix
    ./sops-syncthing.nix
    ./wm-hyprland
  ];

  programs.kdeconnect.enable = true;
}
