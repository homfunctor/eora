{
  pkgs,
  ...
}: {
  # daemon launched when hyprland starts
  # Button 1: Control+D7 (toggle lines)
  # Button 2: Control+Shift+P (write)
  # Button 3: Control+Z (Undo)
  # Button 4: Control+Y (Redo)
  # Button 5: Down arrow key
  # Button 6: Up arrow key
  # Button 7: Delete
  # Button 8: Control+Shift+R (select region)
  # Button 9: Control+Shift+Application+C (calculator)
  # Button 10: Control+Shift+Application+W (yazi work directory)
  # do NOT confuse these two
  # Button 11: Application+Q (Kill)
  # Button 12: Application+F (Fullscreen)

  home.packages = with pkgs; [
    evtest
    libinput
    usbutils
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    # ugly hack will replace with something else later
    "sudo rm /tmp/CoreFxPipe_OpenTabletDriver*"
    "${pkgs.opentabletdriver}/bin/otd-daemon"
  ];

  # todo: manage settings declaratively
}
