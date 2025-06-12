{config, ...}: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  config.stylix = {
    enable = true;
    enableReleaseChecks = false;

    autoEnable = true;
    targets = {
      nixvim = {
        enable = true;
        plugin = "base16-nvim";
        transparentBackground = {
          main = true;
          signColumn = true;
        };
      };
    };
  };
}
