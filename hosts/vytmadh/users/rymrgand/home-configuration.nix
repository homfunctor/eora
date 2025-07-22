{
  flake,
  inputs,
  osConfig,
  ...
}: {
  imports = with flake.modules.home; [
    # minimal tty
    opts
    type-minTTY

    # nicer tty
    ../../../revelations/users/wael/apps.nix # temp
    ../../../revelations/users/wael/neovim.nix # temp
    type-niceTTY

    # work
    ./hyprland.nix
    ../../../revelations/users/wael/hyprpanel.nix # temp
    app-zoom
    type-work
  ];

  home.opts = {
    inherit (osConfig.nixos.opts) hostName;
    userName = osConfig.nixos.opts.adminUser;

    app-math.latex.enable = true;

    bg = {
      inherit (osConfig.nixos.opts.bg) monitors resolutions xy;
      files = ["${inputs.sapadal}/assets/whitemarch.png"];
    };

    sync.folder = {
      Books.enable = true;
      Fish.enable = true;
      Math.enable = true;
      Nix.enable = true;
      Rust.enable = true;
      Work.enable = true;
    };
  };
}
