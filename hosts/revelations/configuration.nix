# nixos configuration
{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    fsys-revelations
    type-minimal-tty

    # nicer tty
    ./hardware.nix
    ./sops.nix
    ./stylix.nix
    type-nicer-tty

    # work
    type-work

    # personal
    type-personal

    # extras
    app-nix-ld
    opt-rust
  ];

  config = {
    nixos.opts = {
      dewm.wm-hyprland.enable = true;

      fontSizes = {
        applications = 12;
        terminal = 14;
        desktop = 12;
        popups = 12;
      };

      hostname = "revelations";

      lanzaboote.enable = true;

      sops.user.enable = true;

      adminuser = "wael";
      usernames = ["wael" "thaos"];
    };
  };
}
