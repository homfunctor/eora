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
    opt-keyring
    opt-mime

    # hyprland
    ./hyprland.nix
    ./hyprpanel.nix
    app-hyprpanel
    wm-hyprland
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
