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
    type-work
  ];

  home.opts = {
    app-math = {
      latex.enable = true;
    };

    cosmic-greeter = {
      bgs = [
        "${inputs.sapadal}/assets/base2.png"
        "${inputs.sapadal}/assets/base.png"
        "${inputs.sapadal}/assets/base3.png"
      ];
      monitors = ["DP-1" "DP-2" "DP-3"];
    };

    launcherColumns = 10;
    hostName = "revelations";

    sync.folder = {
      Books.enable = true;
      Math.enable = true;
      Work.enable = true;
    };

    userName = "thaos";
  };
}
