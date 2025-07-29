{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--flag-switches-begin"
      "--enable-webrtc-pipewire-capturer"
      "--ozone-platform-hint=auto"
      "--ozone-platform-hint=wayland"
      "--flag-switches-end"
    ];
  };
}
