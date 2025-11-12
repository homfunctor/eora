{
  imports = [
    ./hw-graphics.nix
    ./sops-keyring.nix
    ./sops-syncthing.nix
    ./wm-hyprland
  ];

  # doesn't really fit anywhere else
  programs.kdeconnect.enable = true;
}
