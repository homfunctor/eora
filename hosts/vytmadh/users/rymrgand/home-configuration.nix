{flake, ...}: {
  imports = with flake.modules.home; [
    # minimal tty
    type-minimal-tty

    # nicer tty
    ./mime.nix
    ./neovim.nix
    type-nicer-tty

    # work
    ./hyprland.nix
    ./hyprpanel.nix
    type-work
  ];

  config = {
    home.opts = {
      hostname = "vytmadh";

      sync.folder = {
        Books.enable = true;
        Fish.enable = true;
        Math.enable = true;
        Nix.enable = true;
        Rust.enable = true;
        Work.enable = true;
      };

      username = "rymrgand";
    };
  };
}
