{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    ./hardware.nix
    fsys-inferno
    opts
    type-minTTY

    # nicer tty
    ./fish.nix
    ./stylix.nix
    type-niceTTY

    # family PC
    # type-familyPC

    # extras
    app-nix-ld
    opt-lix
    opt-rust
  ];

  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    bg = {
      nWS = 1;
      monitors = ["eDP-1"];
      resolutions = ["1920x1080"];
      xy = ["0x0"];
    };

    fontSizes = {
      applications = 16;
      desktop = 16;
      popups = 16;
      terminal = 16;
    };

    hostName = "inferno";

    lanzaboote.enable = true;

    mainMonitor = builtins.elemAt bg.monitors 0;

    opacity = {
      popups = 1.0;
      terminal = 1.0;
    };

    sops = {
      keyring.enable = true;
      user.enable = true;
    };

    adminUser = "magran";
    userNames = [adminUser];
  };
}
