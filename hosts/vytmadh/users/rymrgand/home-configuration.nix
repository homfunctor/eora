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
    ../../../revelations/users/wael/neovim.nix
    type-niceTTY

    # work
    ./apps.nix
    ./wm-settings.nix
    ./wm-panel.nix
    app-nix-tools
    app-vivaldi
    hw-tablet
    type-work
    wm-hyprland
    # wm-niri
  ];

  home.opts = {
    inherit (osConfig.nixos.opts) hostName mainMonitor;
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
}
