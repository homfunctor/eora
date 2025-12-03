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
    ../wael/neovim.nix
    type-niceTTY

    # work

    ../wael/apps.nix
    # ./hypr-panel.nix
    app-hypridle
    app-hyprlock
    type-work
    # wm-hyprland
    wm-niri
  ];

  home.opts = {
    inherit (osConfig.nixos.opts) hostName mainMonitor;
    userName = builtins.elemAt osConfig.nixos.opts.userNames 1;

    app-math = {
      geogebra.enable = true;
      latex.enable = true;
      octave.enable = true;
      rstudio.enable = true;
    };

    bg = {
      inherit (osConfig.nixos.opts.bg) monitors nWS resolutions xy;
      files = [
        "${inputs.sapadal}/assets/base2.png"
        "${inputs.sapadal}/assets/base.png"
        "${inputs.sapadal}/assets/base3.png"
      ];
    };

    sync.folder = {
      Books.enable = true;
      Math.enable = true;
      Work.enable = true;
    };
  };
}
