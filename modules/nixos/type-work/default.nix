{
  imports = [
    ./hw-graphics.nix
    ./opt-keyring.nix
    ./opt-login.nix
    ./sops-keyring.nix
    ./sops-syncthing.nix
  ];

  hardware.brillo.enable = true;
  programs.kdeconnect.enable = true;
  services.xserver = {
    enable = false;
    desktopManager.runXdgAutostartIfNone = true;
  };
}
