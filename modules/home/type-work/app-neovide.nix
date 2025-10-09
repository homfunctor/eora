{config, ...}: {
  programs = {
    neovide = {
      enable = true;

      settings = {
        fork = false;
        frame = "full";
        idle = true;
        no-multigrid = false;
        srgb = false;
        theme = "dark";
        vsync = true;
      };
    };

    nixvim = {
      globals = {
        neovide_cursor_animate_command_line = true;
        neovide_cursor_animate_in_insert_mode = true;
        neovide_cursor_animation_length = 0.15;
        neovide_cursor_smooth_blink = true;

        neovide_floating_corner_radius = 0.0;
        neovide_floating_shadow = false;
        neovide_hide_mouse_when_typing = true;

        neovide_floating_blur_amount_x = 0;
        neovide_floating_blur_amount_y = 0;
        neovide_floating_opacity = 0.20;
        neovide_normal_opacity = config.stylix.opacity.terminal;
        neovide_opacity = config.stylix.opacity.terminal;
        neovide_transparency_point = 0;

        neovide_position_animation_length = 0.15;
        neovide_scroll_animation_length = 0.3;
      };

      extraConfigLua = ''
        if vim.g.neovide then
          vim.opt.mouse = 'a'

          vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true })
          vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>"+p', { noremap = true })
          vim.api.nvim_set_keymap("n", "<sc-v>", '"+p', { noremap = true })
        end
      '';
    };
  };
}
