{pkgs, ...}: {
  # already installed: alejandra
  home.packages = with pkgs; [
    black
    jq
    shfmt
    stylua
  ];

  programs = {
    nixvim.plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };

        notify_on_error = true;

        formatters_by_ft = {
          bash = ["shfmt"];
          fish = ["fish_indent"];
          json = ["jq"];
          lua = ["stylua"];
          # markdown = ["deno_fmt"];
          nix = ["alejandra"];
          python = ["black"];
          rust = ["rustaceanvim"];
          tex = ["tex-fmt"];
        };
      };
    };

    tex-fmt = {
      enable = true;
      settings = {
        check = false;
        lists = [];
        print = false;
        stdin = false;
        tabchar = "space";
        tabsize = 2;
        verbosity = "warn";
        wrap = true;
        wraplen = 80;
      };
    };
  };
}
