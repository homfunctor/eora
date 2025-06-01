{
  config,
  pkgs,
  ...
}: {
  config.stylix.cursor = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    size = 24;
  };
}
