# back to the original setup
# todo: support for logging out
#   or consider switching to another tty for logging in to work account
{config, ...}: {
  programs.fish.loginShellInit = ''
    if uwsm check may-start
    exec uwsm start hyprland-uwsm.desktop
    end
  '';

  services.getty = {
    autologinOnce = true;
    autologinUser = config.nixos.opts.adminuser;
  };
}
