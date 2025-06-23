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

    # personal
    type-personal
  ];

  config = {
    home.opts = {
      app-math = {
        latex.enable = true;
      };

      customUserDirs = {
        music = "/vault/Music";
        pictures = "/vault/Pictures";
        videos = "/vault/Videos";
      };

      hostname = "revelations";

      rofi.columns = 10;

      sync.folder = {
        Books.enable = true;
        Fish.enable = true;
        Life.enable = true;
        Math.enable = true;
        Misc.enable = true;
        Nix.enable = true;
        Rust.enable = true;
        Work.enable = true;
      };

      username = "wael";
    };
  };
}
