{
  config,
  inputs,
  osConfig,
  ...
}: let
  inherit (config.home.opts) userName;
in {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;

    settings =
      {
        general = {
          dock.enabled = false;
          allowPanelsOnScreenWithoutBar = true;
          avatarImage = "${inputs.sapadal}/assets/${userName}.png";
          forceBlackScreenCorners = false;
          showScreenCorners = false;

          boxRadiusRatio = 0;
          iRadiusRatio = 1;
          radiusRatio = 0;
          scaleRatio = 1;
          screenRadiusRatio = 0;

          animationDisabled = false;
          animationSpeed = 1;
          enableShadows = true;
          shadowDirection = "bottom_left";
          shadowOffsetX = 2;
          shadowOffsetY = 3;

          compactLockScreen = true;
          lockOnSuspend = true;
          showHibernateOnLockScreen = true;
        };

        sessionMenu.showHeader = false;

        ui = {
          fontDefault = config.stylix.fonts.sansSerif.name;
          fontDefaultScale = 1;
          fontFixed = config.stylix.fonts.monospace.name;
          fontFixedScale = 1;
          tooltipsEnabled = true;
          panelBackgroundOpacity = 1;
          panelsAttachedToBar = true;
          settingsPanelAttachToBar = true;
        };
      }
      // osConfig.nixos.opts.niri.misc;
  };
}
