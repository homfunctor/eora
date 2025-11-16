{
  osConfig,
  ...
}: {
  gtk = {
    inherit (osConfig.nixos.opts) iconTheme;

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
