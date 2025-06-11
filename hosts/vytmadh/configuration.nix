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

    # cosmic
    de-cosmic

    # extra
    chaotic-kernel
    opt-rust

    # secure boot
    opt-lanzaboote
  ];

  config = {
    nixos.opts = {
      fontSizes = {
        applications = 14;
        terminal = 14;
        desktop = 14;
        popups = 14;
      };

      hostname = "vytmadh";

      sops = {
        user.enable = true;
      };

      adminuser = "rymrgand";
      usernames = ["rymrgand"];
    };
  };
}
