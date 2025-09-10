{...}: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  config.stylix = {
    enable = true;
    autoEnable = true;
  };
}
