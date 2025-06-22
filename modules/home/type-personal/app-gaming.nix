{pkgs, ...}: {
  home.packages = with pkgs; [
    ludusavi
    umu-launcher
    wineWowPackages.fonts
    (wineWowPackages.waylandFull.override {
      alsaSupport = true;
      fontconfigSupport = true;
      gettextSupport = true;
      gstreamerSupport = true;
      gtkSupport = true;
      mingwSupport = true;
      openclSupport = true;
      openglSupport = true;
      pulseaudioSupport = true;
      tlsSupport = true;
      udevSupport = true;
      vulkanSupport = true;
      wineRelease = "staging";
    })
    winetricks
  ];
}
