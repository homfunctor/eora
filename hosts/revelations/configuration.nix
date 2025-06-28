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
    ./sops.nix
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
    opt-rust
  ];

  config = {
    nixos.opts = {
      fontSizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 14;
      };

      hostName = "revelations";

      lanzaboote.enable = true;

      sops.user.enable = true;

      adminuser = "wael";
      usernames = ["wael" "thaos"];
    };
  };
}
