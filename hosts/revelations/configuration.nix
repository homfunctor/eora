# nixos configuration
{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    fsys-revelations
    opts
    type-minTTY

    # nicer tty
    ./fish.nix
    ./stylix.nix
    type-niceTTY

    # work
    ./hardware.nix
    type-work

    # personal
    type-personal

    # extras
    app-nix-ld
    chaotic-kernel
    opt-lix
    opt-rust
    opt-vm
  ];

  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    bg = {
      # number of workspaces per monitor
      nWS = 2;
      monitors = [
        "DP-1"
        "HDMI-A-1"
        "DP-3"
      ];
      resolutions = [
        "1680x1050"
        "1920x1080"
        "1366x768"
      ];
      xy = [
        "287x0"
        "1967x220"
        "0x1050"
      ];
    };

    fontSizes = {
      applications = 12;
      desktop = 12;
      popups = 12;
      terminal = 14;
    };

    hostName = "revelations";

    lanzaboote.enable = true;

    mainMonitor = builtins.elemAt bg.monitors 1;

    sops = {
      keyring.enable = true;
      syncthing.enable = true;
      user.enable = true;
    };

    adminUser = "wael";
    userNames = [adminUser "thaos"];

    wlrBR = "vulkan";
  };
}
