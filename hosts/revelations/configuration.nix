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
    ./hyprlock.nix
    type-work

    # personal
    type-personal

    # extras
    app-nix-ld
    opt-lix
    opt-rust
    opt-vm
  ];

  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    # background/monitor settings i don't want to do per user
    bg = {
      monitors = ["DP-1" "DP-2" "DP-3"];
      resolutions = ["1680x1050" "1920x1080" "1366x768"];
      xy = ["0x0" "1680x0" "3600x0"];
    };

    fontSizes = {
      applications = 12;
      desktop = 12;
      popups = 12;
      terminal = 14;
    };

    hostName = "revelations";

    lanzaboote.enable = true;

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
