# todo: make it fit monitor size better
{
  config,
  flake,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;
  inherit (config.lib.formats.rasi) mkLiteral;
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.rofi = {
    enable = true;
    cycle = false;

    package = pkgs.rofi-wayland;

    extraConfig = {
      bw = 0;

      display-combi = "";
      display-drun = "";
      disable-history = true;
      display-window = "";
      drun-display-format = "{name}";
      drun-match-fields = "name";
      font = config.stylix.fonts.monospace.name;
      hover-select = true;
      kb-cancel = "Escape,MouseMiddle";
      me-accept-entry = "MousePrimary";
      me-select-entry = "";
      modi = "drun";
      show-icons = true;
      terminal = "${pkgs.kitty}/bin/kitty";
    };

    theme = mkForce {
      "*" = {
        background-color = mkLiteral "transparent";
        font = config.stylix.fonts.monospace.name;
        foreground = mkLiteral "${colors.base06}";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        text-color = mkLiteral "${colors.base06}";
      };

      window = {
        background-color = mkLiteral "${colors.base02}dd";
        fullscreen = true;
        padding = mkLiteral "1em";
      };

      mainbox.padding = mkLiteral "8px";

      inputbar = {
        background-color = mkLiteral "${colors.base04}20";

        border = mkLiteral "1px";
        border-radius = mkLiteral "2px";
        border-color = mkLiteral "${colors.base09}40";

        children = map mkLiteral [
          "icon-search"
          "entry"
        ];

        margin = mkLiteral "0px calc( 50% - 230px )";
        padding = mkLiteral "2px 4px";
        spacing = mkLiteral "4px";
      };

      prompt.enabled = false;

      icon-search = {
        expand = false;
        filename = "search";
        vertical-align = mkLiteral "0.5";
      };

      entry = {
        placeholder = "Search";
        placeholder-color = mkLiteral "${colors.base02}20";
      };

      listview = {
        inherit (config.home.opts.rofi) columns;
        fixed-columns = true;
        margin = mkLiteral "24px calc( 50% - 720px )";
        margin-bottom = mkLiteral "0px";
        spacing = mkLiteral "24px";
      };

      "element, element-text, element-icon" = {
        cursor = mkLiteral "pointer";
      };

      element = {
        padding = mkLiteral "4px";
        spacing = mkLiteral "2px";

        orientation = mkLiteral "vertical";
        border-radius = mkLiteral "6px";
      };

      "element selected" = {
        background-color = mkLiteral "${colors.base00}33";
      };

      element-icon = {
        size = mkLiteral "5.75em";
        horizontal-align = mkLiteral "0.5";
      };

      element-text = {
        horizontal-align = mkLiteral "0.5";
      };
    };
  };
}
