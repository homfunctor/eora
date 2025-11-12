# depends on opts.hypr settings
{
  osConfig,
  ...
}: {
  home.packages = with osConfig.nixos.opts.hypr; [
    grimblast.pkg
    hyprcursor.pkg
    hyprpicker.pkg
    qtutils.pkg
  ];
}
