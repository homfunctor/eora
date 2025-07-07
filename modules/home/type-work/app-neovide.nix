# todo: configure further
# todo: hyprland swallow + alacritty sometimes causes inaccessable
# "ghost" terminals that must be pkill'd. why?
{
  programs = {
    neovide.enable = true;

    nixvim.extraConfigLua = ''
      if vim.g.neovide then
        vim.opt.mouse = 'a'

        vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true })
        vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>"+p', { noremap = true })
        vim.api.nvim_set_keymap("n", "<sc-v>", '"+p', { noremap = true })
      end
    '';
  };
}
