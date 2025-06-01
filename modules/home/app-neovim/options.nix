{pkgs, ...}: {
  programs.nixvim = {
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
      update_in_insert = true;
      severity_sort = true;
      jump.severity.__raw = "vim.diagnostic.severity.WARN";
    };

    highlightOverride = {
      LineNr.bg = "none";
      NormalFloat.bg = "none";
      NotifyBackground.bg = "#000000";
    };

    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };

    opts = {
      # relative line numbers
      number = true;
      relativenumber = true;

      # 2 space tabs
      tabstop = 2;
      softtabstop = 2;
      # 0 or 2? I had 2.
      showtabline = 0;
      expandtab = true;

      # auto-indent with spaces
      smartindent = true;
      shiftwidth = 2;

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
      ignorecase = true;
      smartcase = true;
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";

      # faster completion
      updatetime = 50;

      # completion settings
      completeopt = [
        "menuone"
        "noselect"
        "noinsert"
      ];

      # persistent undo
      swapfile = false;
      autoread = true;
      backup = false;
      undofile = true;

      # colors
      termguicolors = true;

      # aesthetics
      signcolumn = "yes";
      cursorline = true;
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      foldmethod = "indent";
      scrolloff = 2;
      cmdheight = 0;
      showmode = false;
      pumblend = 0;
      pumheight = 10;
      ruler = false;

      # which-key timeout
      timeoutlen = 10;

      # encoding
      encoding = "utf-8";
      fileencoding = "utf-8";
    };
  };
}
