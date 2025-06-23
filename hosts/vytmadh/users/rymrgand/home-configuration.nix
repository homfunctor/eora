{flake, ...}: {
  imports = with flake.modules.home; [
    # minimal tty
    opts
    type-minTTY

    # nicer tty
    ./mime.nix
    # ./neovim.nix
    type-niceTTY

    # work
    ./hyprland.nix
    ./hyprpanel.nix
    type-work
  ];

  config = {
    home.opts = {
      hostName = "vytmadh";

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
