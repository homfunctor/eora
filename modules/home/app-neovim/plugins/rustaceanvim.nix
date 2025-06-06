{
  programs.nixvim.plugins.rustaceanvim = {
    enable = true;
    settings.server = {
      default_settings.rust-analyzer = {
        check = {
          command = "clippy";
          allTargets = true;
        };
        inlayHints = {
          maxLength = 99;
          lifetimeElisionHints.enable = "always";
        };
      };
    };
  };
}
