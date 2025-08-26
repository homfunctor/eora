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
    ../wael/neovim.nix # temp
    type-niceTTY

    # work
    ./hyprland.nix
    ../wael/hyprpanel.nix # temp
    app-zoom
    type-work
  ];

  home.opts = {
    inherit (osConfig.nixos.opts) hostName;
    userName = builtins.elemAt osConfig.nixos.opts.userNames 1;

    app-math = {
      geogebra.enable = true;
      latex.enable = true;
      octave.enable = true;
      rstudio.enable = true;
    };

    bg = {
      inherit (osConfig.nixos.opts.bg) monitors resolutions xy;
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
