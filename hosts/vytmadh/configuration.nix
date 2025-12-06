{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    fsys-vytmadh
    opts
    type-minTTY

    # nicer tty
    ./stylix.nix
    type-niceTTY

    # work
    ./hardware.nix
    hw-tablet
    shell-fish
    type-work
    wm-niri

    # extras
    opt-lix
    opt-rust
  ];

  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    bg = {
      nWS = 3;
      monitors = ["eDP-1"];
      resolutions = ["1920x1080"];
      xy = [[0 0]];
    };

    fontSizes = {
      applications = 16;
      desktop = 16;
      popups = 16;
      terminal = 16;
    };

    hostName = "vytmadh";

    lanzaboote.enable = true;

    mainMonitor = builtins.elemAt bg.monitors 0;

    opacity.popups = 1.0;

    sops = {
      syncthing.enable = true;
      user.enable = true;
    };

    adminUser = "rymrgand";
    userNames = [adminUser];
  };
}
