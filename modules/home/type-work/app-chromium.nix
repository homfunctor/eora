{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform-hint=auto"
      "--flag-switches-begin"
      "--enable-webrtc-pipewire-capturer"
      "--ozone-platform-hint=wayland"
      "--flag-switches-end"
    ];
  };
}
