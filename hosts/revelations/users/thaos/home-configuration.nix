{flake, ...}: {
  imports = with flake.modules.home; [
    # minimal tty
    ./mime.nix
    ./neovim.nix
    type-minimal-tty

    # work
    ./dewm
    type-work

    # extras
    app-rofi # not needed on cosmic?
  ];

  config = {
    home.opts = {
      hostname = "revelations";

      rofi.columns = 10;

      sync.folder = {
        Books.enable = true;
        Math.enable = true;
        Work.enable = true;
      };

      username = "thaos";
    };
  };
}
