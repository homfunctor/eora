{
  lib,
  config,
  ...
}: let
  inherit (lib) mkForce;
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.zathura = {
    enable = true;

    options = with colors; {
      adjust-open = "width";
      guioptions = "v";
      pages-per-row = "1";
      scroll-full-overlap = "0.01";
      scroll-page-aware = "true";
      scroll-step = "100";
      selection-clipboard = "clipboard";
      selection-notification = true;
      statusbar-basename = true;
      zoom-min = "10";

      recolor-darkcolor = mkForce base05;
      recolor-lightcolor = mkForce base00;
    };
  };
}
