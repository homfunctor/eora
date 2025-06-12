{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    ./hardware.nix
    ./sops.nix
    ./stylix.nix
    fsys-vytmadh
    type-minimal-tty

    # work
    # type-work

    # testing purposes only
    # type-personal

    # extras
    app-nix-ld
    opt-rust
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

      lanzaboote.enable = false;

      sops.user.enable = true;

      adminuser = "rymrgand";
      usernames = ["rymrgand"];
    };
  };
}
