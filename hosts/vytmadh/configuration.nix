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
    type-work

    # extras
    # app-nix-ld
    opt-lix
    opt-rust
  ];

  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    bg = {
      nWS = 3;
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

    hostName = "vytmadh";

    # lanzaboote.enable = true;

    mainMonitor = builtins.elemAt bg.monitors 0;

    opacity = {
      popups = 1.0;
      terminal = 0.80;
    };

    sops = {
      keyring.enable = true;
      syncthing.enable = true;
      user.enable = true;
    };

    adminUser = "rymrgand";
    userNames = [adminUser];
  };

  services.libinput.touchpad = {
    horizontalScrolling = true;
    naturalScrolling = true;
    # thinkpad has nice red button and triple buttons. touchpad is pointless.
    tapping = false;
  };
}
