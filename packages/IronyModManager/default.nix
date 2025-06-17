{pkgs}: let
  immApp = pkgs.stdenv.mkDerivation rec {
    pname = "irony-mod-manager";
    version = "1.26.246";

    src = pkgs.fetchzip {
      url = "https://github.com/bcssov/IronyModManager/releases/download/v${version}/linux-x64.zip";
      hash = "sha256-KkEPlOyEt3QV6dAVj71X8oKl4UB4qduyOpOIiJe8tAM=";
      stripRoot = false;
    };

    installPhase = ''
      mkdir -p $out/opt/IronyModManager
      cp -r $src/* $out/opt/IronyModManager
      chmod +x $out/opt/IronyModManager/IronyModManager

      mkdir -p $out/bin
      ln -s $out/opt/IronyModManager/IronyModManager $out/bin/IronyModManager
    '';
  };
in
  pkgs.buildFHSEnv {
    name = "IronyModManager";

    targetPkgs = pkgs:
      with pkgs; [
        # .net
        dotnetCorePackages.runtime_9_0
        icu
        libunwind
        openssl
        zlib

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

        # gui
        atk
        cairo
        gdk-pixbuf
        glib
        gtk3
        pango

        # audio
        alsa-lib

        # fonts
        fontconfig
        freetype

        # libs
        glibc
        libnotify
        lttng-ust_2_12
        nspr
        nss
        udev
      ];

    runScript = "${immApp}/bin/IronyModManager";

    extraInstallCommands = ''
      mkdir -p $out/share/applications
      cp ${pkgs.makeDesktopItem {
        categories = ["Game" "Utility"];
        comment = "A mod manager for Paradox games";
        desktopName = "Irony Mod Manager";
        exec = "IronyModManager";
        icon = "stellaris";
        name = "IronyModManager";
      }}/share/applications/* $out/share/applications
    '';

    meta = with pkgs.lib; {
      description = "Mod Manager for Paradox Games";
      homepage = "https://github.com/bcssov/IronyModManager";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  }
