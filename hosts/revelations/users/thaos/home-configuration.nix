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
      hostname = "revelations";

      rofi.columns = 10;

      sync.folder = {
        Books.enable = true;
        Math.enable = true;
        Work.enable = true;
      };

      username = "thaos";
    };
  };
}
