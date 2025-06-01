{
  programs.nixvim.plugins.lint = {
    enable = true;

    lintersByFt = {
      bash = ["shellcheck"];
      fish = ["fish"];
      json = ["jsonlint"];
      lua = ["luacheck"];
      markdown = ["markdownlint"];
      nix = [
        "deadnix"
        "nix"
      ];
      python = ["basedpyright"];
      sh = ["shellcheck"];
    };
  };
}
