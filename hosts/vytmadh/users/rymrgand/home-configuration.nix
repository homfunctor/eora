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
    ../../../revelations/users/wael/apps.nix
    ./niri-settings.nix
    app-nix-tools
    app-vivaldi
    app-workStuff
    type-work
    wm-niri
  ];

  home.opts = {
    inherit (osConfig.nixos.opts) hostName mainMonitor;
    userName = osConfig.nixos.opts.adminUser;

    app-math.latex.enable = true;

    bg = {
      inherit (osConfig.nixos.opts.bg) extMonitors monitors nWS resolutions xy;
      files = ["${inputs.sapadal}/assets/winter2.png"];
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
