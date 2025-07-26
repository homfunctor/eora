{pkgs, ...}: {
  gtk = {
    iconTheme = {
      name = "Flat-Remix-Black-Dark";
      package = pkgs.flat-remix-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-recent-files-enabled = false;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-recent-files-enabled = false;
    };
  };

  stylix.targets.gtk = {
    enable = true;
    # disable rounded corners where possible
    extraCss = ''
      * { border-radius: 0; }
    '';
  };
}
