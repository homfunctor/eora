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
    ./settings.nix
    type-work

    # personal
    type-personal
  ];

  config = {
    home.opts = {
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
