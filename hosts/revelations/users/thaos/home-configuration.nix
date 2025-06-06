# home-manager user settings
{flake, ...}: {
  imports = with flake.modules.home; [
    # stage 1: bare minimum tty
    app-fish
    app-git
    app-minimal
    opt-minimal
    opts

    # stage 2: almost ready for wm
    ./apps.nix
    ./neovim.nix
    app-neovim

    # stage 3: wm and apps
    ./hyprland.nix
    ./mime.nix
    app-syncthing
    opt-keyring
    opt-mime
    opt-stylix
    wm-hyprland

    # stage 4: panel
    ./hyprpanel.nix
    app-hyprpanel
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
