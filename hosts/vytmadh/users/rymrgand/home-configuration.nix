{flake, ...}: {
  imports = with flake.modules.home; [
    # minimal tty
    opts
    type-minTTY

    # nicer tty
    ./mime.nix
    ./neovim.nix
    type-niceTTY

    # work
    ./hyprland.nix
    ./hyprpanel.nix
    ./settings.nix
    type-work
  ];

  config = {
    home.opts = {
      app-math = {
        latex.enable = true;
      };

      hostName = "vytmadh";

      sync.folder = {
        Books.enable = true;
        Fish.enable = true;
        Math.enable = true;
        Nix.enable = true;
        Rust.enable = true;
        Work.enable = true;
      };

      userName = "rymrgand";
    };
  };
}
