{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    ./hw-minimal.nix
    fsys-vytmadh
    type-minimal-tty

    # nicer tty
    ./sops.nix
    ./stylix.nix
    type-nicer-tty

    # work
    ./hw-more.nix
    type-work

    # extras
    app-nix-ld
    opt-rust
  ];

  config = {
    nixos.opts = {
      fontSizes = {
        applications = 14;
        terminal = 14;
        desktop = 14;
        popups = 14;
      };

      hostname = "vytmadh";

      lanzaboote.enable = true;

      sops.user.enable = true;

      adminuser = "rymrgand";
      usernames = ["rymrgand"];
    };
  };
}
