{...}: {
  imports = [
    ./chaotic-kernel.nix
    ./graphics.nix
    ./sops-keyring.nix
    ./sops-syncthing.nix
    ./wm-hyprland
  ];
}
