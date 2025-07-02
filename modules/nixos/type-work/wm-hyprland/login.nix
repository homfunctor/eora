# uses cosmic-greeter to automatically login to uwsm-managed hyprland
# on logout, enters cosmic-greeter
# thanks to the magick of nixos, already picks up the hyprland-uwsm.desktop
# and makes it default_session
# todo: check user switching
# todo: configure greeter background
{
  config,
  lib,
  pkgs,
  ...
}: {
  # quick test if cosmic-settings works
  environment.systemPackages = [pkgs.cosmic-settings];
  services = {
    displayManager.cosmic-greeter.enable = true;
    greetd.settings.initial_session = {
      command = "${lib.getExe pkgs.uwsm} start hyprland-uwsm.desktop";
      user = config.nixos.opts.adminUser;
    };
  };
}
