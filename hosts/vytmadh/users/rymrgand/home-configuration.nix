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
    ./apps.nix
    ./neovim.nix
    type-niceTTY

    # work
    ./hyprland.nix
    ./hyprpanel.nix
    app-zoom
    type-work
  ];

  home.opts = {
    inherit (osConfig.nixos.opts) hostName;
    userName = osConfig.nixos.opts.adminUser;

    app-math.latex.enable = true;

    cosmic-greeter = {
      bgs = ["${inputs.sapadal}/assets/whitemarch.png"];
      monitors = ["eDP-1"];
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
