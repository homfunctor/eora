{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    ./hw-minimal.nix
    fsys-vytmadh
    type-minimal-tty

    # nicer tty
    ./stylix.nix
    type-nicer-tty

    # work
    # ./hw-more.nix
    # ./sops.nix
    # type-work

    # testing purposes only
    # type-personal

    # extras
    # app-nix-ld
    # opt-rust
  ];

  config = {
    nixos.opts = {
      dewm.de-cosmic.enable = true;

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
