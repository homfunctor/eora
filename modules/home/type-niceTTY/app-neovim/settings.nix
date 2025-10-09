{pkgs, ...}: {
  programs.nixvim = {
    defaultEditor = true;
    viAlias = true;
    vimdiffAlias = true;

    clipboard = {
      register = "unnamedplus";

      providers = {
        wl-copy = {
          enable = true;
          package = pkgs.wl-clipboard;
        };
      };
    };

    diagnostic.settings.config = {
      float = {
        border = "none";
        focusable = false;
        source = "always";
      };
      jump.severity.__raw = "vim.diagnostic.severity.WARN";
      severity_sort = true;
      signs = true;
      underline = true;
      update_in_insert = true;
      virtual_text = false;
    };

    globals.floating_window_options.border = "none";

    opts = {
      # relative line numbers
      number = true;
      relativenumber = true;

      # 2 space tabs
      expandtab = true;
      showtabline = 0;
      softtabstop = 2;
      tabstop = 2;

      # auto-indent with spaces
      shiftwidth = 2;
      smartindent = true;

      # smart indenting
      breakindent = true;

      # incremental searching
      hlsearch = true;
      incsearch = true;

      # text wrap
      wrap = true;

      # split below and right
      splitbelow = true;
      splitright = true;

      # mouse mode
      mouse = "a";

      # ignorecase and smartcase for searching
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      ignorecase = true;
      smartcase = true;

      # faster completion
      updatetime = 50;

      # completion settings
      completeopt = [
        "menuone"
        "noinsert"
        "noselect"
      ];

      # persistent undo
      autoread = true;
      backup = false;
      swapfile = false;
      undofile = true;

      # colors
      termguicolors = true;

      # aesthetics
      cmdheight = 1;
      cursorline = false;
      cursorlineopt = "number";
      foldcolumn = "1";
      foldenable = true;
      foldlevel = 99;
      foldlevelstart = -1;
      foldmethod = "indent";
      pumblend = 100;
      pumheight = 10;
      ruler = false;
      scrolloff = 2;
      showmode = false;
      signcolumn = "yes";
      winblend = 100;

      # which-key timeout
      timeoutlen = 10;

      # encoding
      encoding = "utf-8";
      fileencoding = "utf-8";
    };

    performance.byteCompileLua = {
      configs = true;
      enable = true;
      nvimRuntime = true;
      plugins = true;
    };
  };
}
