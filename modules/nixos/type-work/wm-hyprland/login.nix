# todo: can this be made to display only on one specific monitor?
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;

  args =
    ''--asterisks  --remember-session --time --time-format "${timeFmt}"''
    + ''
      --theme "${tgTheme}" --user-menu --cmd'';
  tgPkg = getExe pkgs.greetd.tuigreet;
  tgTheme =
    ''border=gray;text=cyan;prompt=white;time=cyan;action=blue;''
    + ''button=white;container=black;input=cyan'';
  timeFmt = "%a %b %d  %I:%M %p";

  # log back in after logging out
  default_session = {
    command = "${tgPkg}  ${args} ${initial_session.command}";
    user = "greeter";
  };

  # autologin to Hyprland with uwsm
  initial_session = {
    command = "${getExe pkgs.uwsm} start hyprland-uwsm.desktop";
    user = config.nixos.opts.adminUser;
  };
in {
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
