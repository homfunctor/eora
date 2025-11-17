{
  config,
  lib,
  osConfig,
  perSystem,
  pkgs,
  ...
}: let
  inherit (config.home.opts) apps;
  inherit (config.lib.formats.rasi) mkLiteral;
  inherit (config.lib.stylix) colors;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    extraConfig = {
      bw = 0;
      case-sensitive = false;
      cycle = true;
      disable-history = true;
      display-drun = "";
      drun-display-format = "{name}";
      # font handled by stylix
      icon-theme = osConfig.nixos.opts.iconTheme.name;
      kb-cancel = "Escape,MouseMiddle";
      matching = "fuzzy";
      me-accept-entry = "MousePrimary";
      me-select-entry = "";
      modi = "drun";
      run-command = "${lib.getExe perSystem.self.runapp} {cmd}";
      show-icons = true;
      sort = true;
      sorting-method = "fzf";
      terminal = apps.terminal.exe;
    };

    theme = lib.mkForce {
      "*" = {
        accent-color = mkLiteral "#${colors.base08}";
        background-color = mkLiteral "rgba(${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b}, 0.8)";
        text-color = mkLiteral "#${colors.base08}";
      };

      window = {
        background-color = mkLiteral "rgba(${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b}, 0.8)";
        border = 0;
        padding = mkLiteral "1em";
      };

      mainbox.background-color = mkLiteral "transparent";

      message = {
        background-color = mkLiteral "transparent";
        margin = mkLiteral "2px";
      };

      textbox.text-color = mkLiteral "#${colors.base08}";

      listview = {
        background-color = mkLiteral "#${colors.base00}";
        border = 1;
        columns = lib.mkDefault 10;
        dynamic = true;
        fixed-columns = false;
        lines = lib.mkDefault 10;
        padding = mkLiteral "2px 0px 0px 0px";
      };

      element = {
        background-color = mkLiteral "transparent";
        border = 0;
        orientation = mkLiteral "vertical";
        padding = mkLiteral "1px";
        text-color = mkLiteral "#${colors.base08}";
      };

      "element normal.normal".background-color = mkLiteral "transparent";

      "element normal.active" = {
        background-color = mkLiteral "rgba(${colors.base03-rgb-r}, ${colors.base03-rgb-g}, ${colors.base03-rgb-b}, 0.2)";
        text-color = mkLiteral "#${colors.base08}";
      };

      "element selected.normal" = {
        background-color = mkLiteral "rgba(${colors.base03-rgb-r}, ${colors.base03-rgb-g}, ${colors.base03-rgb-b}, 0.2)";
        text-color = mkLiteral "#${colors.base08}";
      };

      "element selected.active" = {
        background-color = mkLiteral "rgba(${colors.base03-rgb-r}, ${colors.base03-rgb-g}, ${colors.base03-rgb-b}, 0.3)";
        text-color = mkLiteral "#${colors.base08}";
      };

      "element-icon" = {
        size = mkLiteral "3em";
        horizontal-align = mkLiteral "0.5";
      };

      "element-text".horizontal-align = mkLiteral "0.5";

      inputbar = {
        background-color = mkLiteral "rgba(${colors.base02-rgb-r}, ${colors.base02-rgb-g}, ${colors.base02-rgb-b}, 0.8)";
        children = map mkLiteral ["prompt" "textbox-prompt-colon" "entry" "case-indicator"];
        margin = mkLiteral "0px 0px 5px 0px";
        padding = mkLiteral "5px";
        text-color = mkLiteral "#${colors.base08}";
      };

      case-indicator = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "#${colors.base08}";
      };

      entry = {
        background-color = mkLiteral "transparent";
        placeholder = "Search...";
        placeholder-color = mkLiteral "rgba(${colors.base08-rgb-r}, ${colors.base08-rgb-g}, ${colors.base08-rgb-b}, 0.6)";
        text-color = mkLiteral "#${colors.base08}";
      };

      prompt = {
        background-color = mkLiteral "transparent";
        margin = mkLiteral "0px 0.3em 0em 0em";
        text-color = mkLiteral "#${colors.base08}";
      };

      "textbox-prompt-colon" = {
        expand = false;
        margin = mkLiteral "0px 0.3em 0em 0em";
        str = ":";
        text-color = mkLiteral "inherit";
      };
    };
  };
}
