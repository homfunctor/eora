{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    ./hardware.nix
    fsys-vytmadh
    opts
    type-minTTY

    # nicer tty
    ./fish.nix
    ./stylix.nix
    type-niceTTY

    # work
    ./hyprlock.nix
    type-work

    # extras
    app-nix-ld
    opt-lix
    opt-rust
  ];

  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    bg = {
      monitors = ["eDP-1"];
      resolutions = ["1920x1080"];
      xy = ["0x0"];
    };

    fontSizes = {
      applications = 14;
      desktop = 14;
      popups = 14;
      terminal = 14;
    };

    hostName = "vytmadh";

    lanzaboote.enable = true;

    opacity = {
      popups = 1.0;
      terminal = 1.0;
    };

    sops = {
      keyring.enable = true;
      syncthing.enable = true;
      user.enable = true;
    };

    adminUser = "rymrgand";
    userNames = [adminUser];
  };
}
