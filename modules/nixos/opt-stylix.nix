{
  config,
  inputs,
  ...
}: let
  inherit (config.nixos.opts) fontSizes;
in {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;

    autoEnable = true;
    fonts.sizes = fontSizes;
    image = "${inputs.sapadal}/assets/base.png";
    opacity = {
      desktop = 1.0;
      popups = 0.9;
      terminal = 0.8;
    };
    polarity = "dark";
  };
}
