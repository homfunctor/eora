{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [precognition-nvim];

    extraConfigLua = ''
      require('precognition').setup({})
    '';
  };
}
