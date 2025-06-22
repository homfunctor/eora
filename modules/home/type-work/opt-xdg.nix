{
  config,
  pkgs,
  ...
}: let
  inherit (config.home.opts) customUserDirs;
in {
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg = {
    enable = true;
    userDirs =
      {
        enable = true;
        createDirectories = true;
      }
      // customUserDirs;
  };
}
