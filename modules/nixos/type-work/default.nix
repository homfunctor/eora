{...}: {
  imports = [
    ./chaotic-kernel.nix
    ./hardware.nix
    ./sops-keyring.nix
    ./sops-syncthing.nix
    ./wm-hyprland
  ];
}
