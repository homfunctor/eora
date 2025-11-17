{
  imports = [
    ./hw-graphics.nix
    ./sops-keyring.nix
    ./sops-syncthing.nix
    ./wm-hyprland
  ];

  programs = {
    file-roller.enable = true;
    kdeconnect.enable = true;
  };
}
