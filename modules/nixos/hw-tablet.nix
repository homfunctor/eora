{pkgs, ...}: {
  # daemon launched when hyprland starts
  # Button 1: Control+D7 (toggle lines)
  # Button 2: Control+Shift+P (write)
  # Button 3: Control+Z (Undo)
  # Button 4: Control+Y (Redo)
  # Button 5: Down arrow key
  # Button 6: Up arrow key
  # Button 7: Control+Shift+O (select object)
  # Button 8: Control+Shift+R (select region)
  # Button 9: Control+Shift+Application+C (calculator)
  # Button 10: Control+Shift+Application+W (yazi work directory)
  # do NOT confuse these two
  # Button 11: Kill
  # Button 12: Fullscreen
  hardware.opentabletdriver.enable = true;
  environment.systemPackages = with pkgs; [
    evtest
    libinput
    usbutils
  ];
}
