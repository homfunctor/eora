# todo: check how stylix applies here
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
in {
  programs.regreet = {
    enable = true;
  };

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${getExe pkgs.regreet}";
          user = "greeter";
        };
      };
    };
  };
}
