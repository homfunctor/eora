{pkgs}: let
  immApp = pkgs.stdenv.mkDerivation rec {
    pname = "irony-mod-manager";
    version = "1.26.247";

    src = pkgs.fetchzip {
      url = "https://github.com/bcssov/IronyModManager/releases/download/v${version}/linux-x64.zip";
      hash = "sha256-KkEPlOyEt3QV6dAVj71X8oKl4UB4qduyOpOIiJe8tAM=";
      stripRoot = false;
    };

    installPhase = ''
      # it's flat
      mkdir -p $out/opt/IronyModManager
      cp -r $src/* $out/opt/IronyModManager
      chmod +x $out/opt/IronyModManager/IronyModManager

      mkdir -p $out/bin
      ln -s $out/opt/IronyModManager/IronyModManager $out/bin/IronyModManager
    '';
  };
in
  # it's delicate
  pkgs.buildFHSEnv {
    name = "IronyModManager";

    targetPkgs = pkgs:
      with pkgs; [
        # audio
        alsa-lib

        # dotnet
        dotnetCorePackages.runtime_8_0
        icu
        libunwind
        openssl
        zlib

        # fonts
        fontconfig
        freetype

        # gui
        atk
        cairo
        gdk-pixbuf
        glib
        gtk3
        pango

        # libs
        glibc
        libnotify
        lttng-ust_2_12
        nspr
        nss
        udev

        # x11
        xorg.libICE
        xorg.libSM
        xorg.libX11
        xorg.libXScrnSaver
        xorg.libXcomposite
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXi
        xorg.libXrandr
        xorg.libXrender
        xorg.libXtst
        xorg.libxcb
      ];

    # it lives in its own fantasy world
    runScript = "${immApp}/bin/IronyModManager";

    extraInstallCommands = ''
      mkdir -p $out/share/applications
      cp ${pkgs.makeDesktopItem {
        categories = ["Game" "Utility"];
        comment = "A mod manager for Paradox games";
        desktopName = "Irony Mod Manager";
        exec = "IronyModManager";
        icon = "stellaris";
        name = "irony-mod-manager";
      }}/share/applications/* $out/share/applications
    '';

    meta = with pkgs.lib; {
      description = "Mod Manager for Paradox Games";
      homepage = "https://github.com/bcssov/IronyModManager";
      license = licenses.mit;
      platforms = platforms.all;
    };
  }
