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
    type-work
  ];

  config = {
    home.opts = {
      app-math = {
        latex.enable = true;
      };

      hostName = "revelations";

      rofi.columns = 10;

      sync.folder = {
        Books.enable = true;
        Math.enable = true;
        Work.enable = true;
      };

      userName = "thaos";
    };
  };
}
