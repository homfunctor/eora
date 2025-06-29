{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
  args = "--remember --time --cmd";
  initial_session = {
    command = "${getExe pkgs.uwsm} start hyprland-uwsm.desktop";
    user = config.nixos.opts.adminuser;
  };
in {
  services.greetd = {
    enable = true;
    settings = {
      inherit initial_session;
      default_session = {
        command = ''
          ${getExe pkgs.greetd.tuigreet} ${args} ${initial_session.command}
        '';
        user = "greeter";
      };
    };
  };

  # for autologin to work properly
  users = {
    groups.greeter = {};
    users.greeter = {
      createHome = true;
      group = "greeter";
      home = "/var/lib/greeter";
      isNormalUser = false;
      isSystemUser = true;
      shell = "${pkgs.bash}/bin/bash";
    };
  };
}
