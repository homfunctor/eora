{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;

  # let's me autologin to adminUser, logout then login to workuser
  # args = "--asterisks --remember --remember-user-session --time --user-menu --cmd";
  args = "--asterisks  --time --user-menu --cmd";
  tgPkg = getExe pkgs.greetd.tuigreet;

  default_session = {
    command = "${tgPkg}  ${args} ${initial_session.command}";
    user = "greeter";
  };

  initial_session = {
    command = "${getExe pkgs.uwsm} start hyprland-uwsm.desktop";
    user = config.nixos.opts.adminUser;
  };
in {
  # auto-logins to Hyprland on boot (passwd used to decrypt at boot)
  # if logged out, then run tuigreet (for switching to work account)
  services.greetd = {
    enable = true;
    settings = {
      inherit default_session initial_session;
      terminal.vt = 1;
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
