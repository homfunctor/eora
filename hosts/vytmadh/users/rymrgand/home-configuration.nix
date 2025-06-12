{flake, ...}: {
  imports = with flake.modules.home; [
    # minimal tty
    # ./mime.nix
    # ./neovim.nix
    type-minimal-tty

    # work
    # ./dewm
    # type-work

    # for testing purposes only
    # type-personal
  ];

  config = {
    home.opts = {
      dewm.de-cosmic.enable = true;

      hostname = "vytmadh";

      # sync.folder = {
      #   Books.enable = true;
      #   Fish.enable = true;
      #   Math.enable = true;
      #   Nix.enable = true;
      #   Rust.enable = true;
      #   Work.enable = true;
      # };

      username = "rymrgand";
    };
  };
}
