{
  flake,
  inputs,
  ...
}: {
  imports = with flake.modules.home; [
    # minimal tty
    opts
    type-minTTY

    # nicer tty
    ./mime.nix
    ./neovim.nix
    type-niceTTY

    # work
    ./hyprland.nix
    ./hyprpanel.nix
    ./settings.nix
    type-work

    # personal
    type-personal
  ];

  home.opts = {
    app-math = {
      geogebra.enable = true;
      latex.enable = true;
      octave.enable = true;
      rstudio.enable = true;
    };

    cosmic-greeter = {
      bg = "${inputs.sapadal}/assets/base.png";
      monitor = "DP-2";
    };

    customUserDirs = {
      music = "/vault/Music";
      pictures = "/vault/Pictures";
      videos = "/vault/Videos";
    };

    hostName = "revelations";

    rofi.columns = 10;

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

    userName = "wael";
  };
}
