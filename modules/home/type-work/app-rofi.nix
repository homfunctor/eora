# todo: make it fit monitor size better
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.home.opts.rofi) columns;
  inherit (config.lib.formats.rasi) mkLiteral;
  inherit (config.stylix.fonts) monospace;

  colors = config.lib.stylix.colors.withHashtag;
  terminalPkg = "${pkgs.alacritty}/bin/alacritty";
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
      font = monospace.name;
      hover-select = true;
      kb-cancel = "Escape,MouseMiddle";
      me-accept-entry = "MousePrimary";
      me-select-entry = "";
      modi = "drun";
      show-icons = true;
      terminal = terminalPkg;
    };

    theme = lib.mkForce {
      "*" = {
        background-color = mkLiteral "transparent";
        font = monospace.name;
        foreground = mkLiteral "${colors.base06}";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        text-color = mkLiteral "${colors.base06}";
      };

      window = {
        background-color = mkLiteral "${colors.base00}dd";
        fullscreen = true;
        padding = mkLiteral "1em";
      };

      mainbox.padding = mkLiteral "8px";

      inputbar = {
        background-color = mkLiteral "${colors.base00}20";

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
        inherit columns;
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
