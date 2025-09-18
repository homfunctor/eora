{
  flake,
  inputs,
  osConfig,
  pkgs,
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
    ./hyprpanel.nix
    ./hyprland.nix
    app-civ5-map-image
    app-nix-tools
    app-vivaldi
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
      Misc.enable = true;
      Nix.enable = true;
      Rust.enable = true;
      Work.enable = true;
    };
  };

  # temp to deal with external monitor issue will
  # implement whatever works in modules/home/type-work/
  home.packages = with pkgs; [
    nwg-displays
    way-displays
    wdisplays
  ];
}
