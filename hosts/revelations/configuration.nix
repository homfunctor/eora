# generates nixos configuration for revelations
{flake, ...}: {
  imports = with flake.modules.nixos; [
    # stage 0: imperatively modify filesystems.nix
    ./filesystems.nix
    opt-users

    # stage 1: bare minimum tty
    ./apps.nix
    ./boot.nix
    ./hardware.nix
    ./sops.nix

    chaotic-cachix
    opt-boot
    opt-home
    opt-keyring
    opt-networking
    opt-nix
    opt-services
    opt-sops
    opts

    # stage 2: visuals
    ./stylix.nix

    opt-fish
    opt-fonts
    opt-locale
    opt-stylix
    wm-hyprland

    # stage 2.5: nice things

    chaotic-ananicy
    chaotic-kernel
    chaotic-mesa
    opt-rust

    # stage 3: final security settings
    opt-hardening
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
