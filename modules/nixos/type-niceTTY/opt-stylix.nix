{
  config,
  inputs,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

  stylix = {
    enable = true;

    autoEnable = true;
    fonts.sizes = config.nixos.opts.fontSizes;
    image = "${inputs.sapadal}/assets/base.png";
    opacity = {
      desktop = 1.0;
      popups = 0.90;
      terminal = 0.80;
    };
    polarity = "dark";

    # causes issues for me
    targets.chromium.enable = false;
  };
}
