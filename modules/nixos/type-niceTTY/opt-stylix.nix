{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

  stylix = {
    enable = true;

    inherit (config.nixos.opts) opacity;
    autoEnable = true;
    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };
      sizes = config.nixos.opts.fontSizes;
    };
    image = "${inputs.sapadal}/assets/base.png";
    polarity = "dark";

    # causes issues for me
    targets.chromium.enable = false;
  };
}
