{config, ...}: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  config.stylix = {
    enable = true;
    enableReleaseChecks = false;

    autoEnable = true;
  };
}
