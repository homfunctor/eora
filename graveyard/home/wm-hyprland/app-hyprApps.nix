# depends on opts.hypr settings
{
  osConfig,
  pkgs,
  ...
}: {
  home.packages = with osConfig.nixos.opts.hypr;
    [grimblast.pkg hyprcursor.pkg qtutils.pkg]
    ++ (with pkgs; [grim slurp]);
}
