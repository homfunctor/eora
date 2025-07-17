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
    ./sops.nix
    ./stylix.nix
    type-niceTTY

    # work
    ./hyprlock.nix
    type-work

    # extras
    app-nix-ld
    opt-rust
  ];

  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    # background/monitor settings i don't want to do per user
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

    sops.user.enable = true;

    adminUser = "rymrgand";
    userNames = [adminUser];
  };
}
