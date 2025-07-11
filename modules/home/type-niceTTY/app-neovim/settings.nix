{
  config,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
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
      jump.severity.__raw = "vim.diagnostic.severity.WARN";
      severity_sort = true;
      update_in_insert = true;
    };

    highlightOverride = with colors; {
      Boolean.fg = "#5A6B9C";
      Comment = {
        fg = "#8B7AA3";
        italic = true;
      };
      Keyword.fg = "#7ABF9E";
      LineNr.bg = "none";
      Normal.bg = "none";
      NormalFloat.bg = "none";
      NotifyBackground.bg = "none";
      Number.fg = "#4A6B8A";
      StatusLine.bg = base00;
      String.italic = true;
      TSBoolean.link = "Boolean";
      TSComment.link = "Comment";
      TSKeyword.link = "Keyword";
      TSNumber.link = "Number";
    };

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
      cmdheight = 0;
      cursorline = true;
      foldcolumn = "0";
      foldenable = true;
      foldlevel = 99;
      foldlevelstart = 99;
      foldmethod = "indent";
      pumblend = 0;
      pumheight = 10;
      ruler = false;
      scrolloff = 2;
      showmode = false;
      signcolumn = "yes";
      winblend = 0;

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
