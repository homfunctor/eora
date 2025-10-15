{
  flake,
  inputs,
  lib,
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
    ./hyprpanel.nix
    ./hyprland.nix
    app-civ5-map-image
    app-nix-tools
    app-vivaldi
    type-work
  ];

  home.opts = {
    inherit (osConfig.nixos.opts) hostName;
    userName = osConfig.nixos.opts.adminUser;

    app-math.latex.enable = true;

    bg = {
      inherit (osConfig.nixos.opts.bg) monitors nWS resolutions xy;
      files = ["${inputs.sapadal}/assets/durinsgate.jpg"];
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

  # todo: add option to opts
  programs.hyprlock.settings.background.path = lib.mkForce "${inputs.sapadal}/assets/durinsgate.jpg";
}
