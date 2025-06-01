# most of the theming settings
{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;

    autoEnable = true;
    image = "${inputs.sapadal}/assets/base.png";

    opacity = {
      desktop = 1.0;
      popups = 0.90;
      terminal = 0.8;
    };

    fonts.sizes = config.nixos.opts.fontSizes;

    polarity = "dark";
  };
}
