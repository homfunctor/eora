{pkgs, ...}: {
  # daemon launched when hyprland starts
  # Button 1: Control+Shift+R
  # Button 2: Control+Shift+P
  # Button 3: Control+Shift+O
  # Button 4: Control+Z (Undo)
  # Button 5: Left arrow key
  # Button 6: Down arrow key
  # Button 7: Up arrow key
  # Button 8: Right arrow key
  # Button 9: Control+Shift+Application+C (calculator)
  # Button 10: Control+Shift+Application+W (yazi work directory)
  # Button 11:
  # Button 12:
  hardware.opentabletdriver.enable = true;
  environment.systemPackages = with pkgs; [
    evtest
    libinput
    usbutils
  ];
}
