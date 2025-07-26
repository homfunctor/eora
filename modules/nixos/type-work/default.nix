{...}: {
  imports = [
    ./chaotic-kernel.nix
    ./hw-graphics.nix
    ./sops-keyring.nix
    ./sops-syncthing.nix
    ./wm-hyprland
  ];
}
