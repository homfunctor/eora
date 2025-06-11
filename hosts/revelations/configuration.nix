# nixos configuration
{flake, ...}: {
  imports = with flake.modules.nixos; [
    # imperative
    ./filesystems.nix

    # core
    ./apps.nix
    ./boot.nix
    ./hardware.nix
    ./sops.nix

    chaotic-cachix
    opt-boot
    opt-hardening
    opt-home
    opt-networking
    opt-nix
    opt-services
    opt-sops
    opt-users
    opts

    #  visuals
    ./stylix.nix

    opt-fish
    opt-fonts
    opt-locale
    opt-stylix

    # hyprland
    opt-greeter
    opt-keyring
    wm-hyprland

    # extra
    app-proton-ge
    chaotic-ananicy
    chaotic-kernel
    chaotic-mesa
    opt-rust

    # secure boot
    opt-lanzaboote
  ];

  config = {
    nixos.opts = {
      fontSizes = {
        applications = 12;
        terminal = 14;
        desktop = 12;
        popups = 12;
      };

      hostname = "revelations";

      sops = {
        user.enable = true;
      };

      adminuser = "wael";
      usernames = ["wael" "thaos"];
    };
  };
}
