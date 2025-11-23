{
  config,
  inputs,
  ...
}: {
  imports = [inputs.nix-index-database.homeModules.nix-index];

  programs.nix-index =
    {
      enable = true;
    }
    // config.home.opts.apps.shell.shellIntegration;
}
