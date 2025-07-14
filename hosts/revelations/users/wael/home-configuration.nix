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
    type-work

    # personal
    type-personal

    # extra
    app-pithos
  ];

  home.opts = {
    inherit (osConfig.nixos.opts) hostName;
    userName = builtins.elemAt osConfig.nixos.opts.userNames 0;

    app-math = {
      geogebra.enable = true;
      latex.enable = true;
      octave.enable = true;
      rstudio.enable = true;
    };

    cosmic-greeter = {
      bgs = [
        "${inputs.sapadal}/assets/winter1.png"
        "${inputs.sapadal}/assets/winter2.png"
        "${inputs.sapadal}/assets/winter3.png"
      ];
      monitors = ["DP-1" "DP-2" "DP-3"];
    };

    customUserDirs = {
      music = "/vault/Music";
      pictures = "/vault/Pictures";
      videos = "/vault/Videos";
    };

    sync.folder = {
      Books.enable = true;
      Fish.enable = true;
      Life.enable = true;
      Math.enable = true;
      Misc.enable = true;
      Nix.enable = true;
      Rust.enable = true;
      Work.enable = true;
    };
  };
}
