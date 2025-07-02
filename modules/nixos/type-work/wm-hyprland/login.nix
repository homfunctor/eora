# uses cosmic-greeter to automatically login to uwsm-managed hyprland
# on logout, enters cosmic-greeter
# thanks to the magick of nixos, already picks up the hyprland-uwsm.desktop
# and makes it default_session
# default_session should be left alone as cosmic-greeter handles it along with
# user selection
{
  config,
  lib,
  pkgs,
  ...
}: {
  services = {
    displayManager.cosmic-greeter.enable = true;
    greetd.settings.initial_session = {
      command = "${lib.getExe pkgs.uwsm} start hyprland-uwsm.desktop";
      user = config.nixos.opts.adminUser;
    };
  };

  # todo: configure greeter background
}
