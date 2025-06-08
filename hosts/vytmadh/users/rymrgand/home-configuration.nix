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
    opt-mime
    app-syncthing

    # hyprland
    ./hyprland.nix
    ./hyprpanel.nix

    app-hyprpanel
    opt-keyring
    wm-hyprland
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
