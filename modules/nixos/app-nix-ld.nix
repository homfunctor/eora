{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    patchelf
  ];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
    libraries = with pkgs; [
      acl
      alsa-lib
      at-spi2-atk
      at-spi2-core
      atk
      attr
      bzip2
      cairo
      cups
      dbus
      expat
      fontconfig
      freetype
      fuse3
      gdk-pixbuf
      glib
      gtk3
      icu
      libappindicator-gtk3
      libdrm
      libgbm
      libGL
      libglvnd
      libnotify
      libpulseaudio
      libsodium
      libssh
      libunwind
      libusb1
      libuuid
      libxkbcommon
      mesa
      mesa_i686
      nspr
      nss
      nwjs-sdk
      pango
      pipewire
      stdenv.cc.cc
      util-linux
      vulkan-loader
      xorg.libX11
      xorg.libxcb
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libxkbfile
      xorg.libXrandr
      xorg.libXrender
      xorg.libXScrnSaver
      xorg.libxshmfence
      xorg.libXtst
      zlib
      zstd
    ];
  };
}
