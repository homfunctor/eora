# home-manager user settings
{flake, ...}: {
  imports = with flake.modules.home; [
    # core
    app-fish
    app-git
    app-minimal
    opt-minimal
    opts

    # neovim
    ./neovim.nix
    app-neovim

    # visuals
    opt-stylix

    # apps
    ./apps.nix
    ./mime.nix
    app-syncthing
    opt-mime

    # hyprland
    ./hyprland.nix
    ./hyprpanel.nix
    app-hyprpanel
    opt-keyring
    wm-hyprland
  ];

  config = {
    home.opts = {
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
