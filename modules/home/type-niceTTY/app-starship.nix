{config, ...}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = false;
      right_format = "$time";
      time.disabled = false;

      format =
        "[](${colors.base02} bg:none)"
        + "[](${colors.base03} bg:${colors.base02})"
        + "[](${colors.base04} bg:${colors.base03})"
        + "(bg:${colors.base04} fg:${colors.base00})$directory$read_only"
        + "[](fg:${colors.base04} bg:${colors.base05})$git_branch$git_status"
        + "[](fg:${colors.base05} bg:${colors.base0D})$nix_shell"
        + "[](fg:${colors.base0D} bg:none)$character";

      character = {
        error_symbol = "[❯](bold ${colors.base08})";
        success_symbol = "[❯](bold ${colors.base07})";
      };

      directory = {
        format = "[ $path ]($style)";
        read_only = " [󰌾](${colors.base08})";
        style = "fg:${colors.base00} bg:${colors.base04}";
        substitutions = {
          "Config" = " ";
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Git" = "󰊢 ";
          "Music" = "󰝚 ";
          "Pictures" = "󰉏 ";
          "Projects" = "󰚯 ";
          "Videos" = "󰕧 ";
          "dotfiles" = "󰟐 ";
          "github" = " ";
        };
        home_symbol = "🏠 ";
      };

      git_branch = {
        format = "[ $symbol$branch ]($style)";
        style = "fg:${colors.base00} bg:${colors.base05}";
        symbol = " ";
      };

      git_status = {
        ahead = "↑";
        behind = "↓";
        deleted = "✘";
        diverged = "↕";
        format = "([$all_status$ahead_behind]($style))";
        renamed = "→";
        style = "fg:${colors.base00} bg:${colors.base05}";
      };

      nix_shell = {
        format = "[ $symbol$state ]($style)";
        style = "fg:${colors.base00} bg:${colors.base0D}";
        symbol = " ";
      };

      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      nodejs.symbol = " ";
      package.symbol = "󰏗 ";
      python.symbol = " ";
      rlang.symbol = "󰟔 ";
      rust.symbol = " ";
    };
  };
}
