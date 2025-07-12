{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--enable-webrtc-pipewire-capturer"
      "--flag-switches-begin"
      "--flag-switches-end"
      "--ozone-platform-hint=auto"
      "--ozone-platform-hint=wayland"
    ];
  };
}
