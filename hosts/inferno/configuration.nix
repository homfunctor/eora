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
  ];

  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    # unused check if can just be dropped
    bg = {
      nWS = 1;
      monitors = ["eDP-1"];
      resolutions = ["1920x1080"];
      xy = ["0x0"];
    };

    fontSizes = {
      applications = 12;
      desktop = 12;
      popups = 12;
      terminal = 14;
    };

    hostName = "inferno";

    mainMonitor = builtins.elemAt bg.monitors 0;

    opacity = {
      popups = 1.0;
      terminal = 1.0;
    };

    sops = {
      # todo: lightdm -> lxqt should be fine
      # keyring.enable = true;
      user.enable = true;
    };

    adminUser = "magran";
    userNames = [adminUser];
  };
}
