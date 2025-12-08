{
  config,
  inputs,
  lib,
  ...
}: {
  programs.swaylock = {
    enable = true;
    settings = {
      image = lib.mkForce "${inputs.sapadal}/assets/durinsgate.jpg";
      scaling = "fill";
      font = config.stylix.fonts.sansSerif.name;
    };
  };
}
