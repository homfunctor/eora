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
        ''
          [](bg:${colors.base05} ''
        + ''
          fg:${colors.base00})$directory$read_only[]''
        + ''(bg:${colors.base06} fg:${colors.base00})''
        + ''
          $git_branch$git_status[](bg:${colors.base07} ''
        + ''
          fg:${colors.base00})$nix_shell[](fg:${colors.base05})$character
        '';

      character = {
        error_symbol = "[❯](bold ${colors.base04})";
        success_symbol = "[❯](bold ${colors.base05})";
      };

      directory = {
        format = "[ $path ]($style)";
        read_only = " [󰌾](${colors.base06})";
        style = "fg:${colors.base00} bg:${colors.base05}";

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
        style = "fg:${colors.base05} bg:${colors.base01}";
        symbol = " ";
      };

      git_status = {
        ahead = "↑";
        behind = "↓";
        deleted = "✘";
        diverged = "↕";
        format = "([$all_status$ahead_behind]($style))";
        renamed = "→";
        style = "fg:${colors.base05}";
      };

      nix_shell = {
        format = "[ $symbol$state ]($style)";
        style = "fg:${colors.base07} bg:${colors.base04}";
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
