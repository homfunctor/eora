{osConfig, ...}: {
  programs.wlogout = {
    enable = true;
    package = osConfig.nixos.opts.niri.logout.pkg;

    layout = [
      {
        label = "lock";
        action = "swaylock-cmd";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "niri msg action quit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
  };
}
