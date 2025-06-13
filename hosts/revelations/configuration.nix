# nixos configuration
{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    ./hw-minimal.nix
    fsys-revelations
    type-minimal-tty

    # nicer tty
    ./sops.nix
    ./stylix.nix
    type-nicer-tty

    # work
    ./hw-more.nix
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

      # false until after installation is done
      lanzaboote.enable = false;

      sops.user.enable = true;

      adminuser = "wael";
      usernames = ["wael" "thaos"];
    };
  };
}
