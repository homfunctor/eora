# nixos configuration
{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    fsys-revelations
    opts
    type-minTTY

    # nicer tty
    ./stylix.nix
    type-niceTTY

    # work
    ./fish.nix
    ./hardware.nix
    ./shell-settings.nix
    hw-tablet
    shell-fish
    type-work
    wm-niri

    # personal
    # type-personal

    # extras
    opt-lix
    opt-rust
    opt-sanity
    # opt-vm
  ];
  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    # getting annoying bugs with unstable
    # and nixpkgs
    niri.wm.pkg = pkgs.niri-unstable;

    bg = {
      # number of workspaces per monitor
      nWS = 2;
      monitors = [
        "DP-1"
        "HDMI-A-1"
        "DP-3"
      ];
      resolutions = [
        "1680 1050"
        "1920 1080"
        "1366 768"
      ];
      xy = [
        [0 0]
        [1680 0]
        [0 1050]
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
      syncthing.enable = true;
      user.enable = true;
    };

    adminUser = "wael";
    userNames = [adminUser "thaos"];

    wlrBR = "vulkan";
  };
}
