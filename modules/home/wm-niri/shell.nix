{
  config,
  inputs,
  lib,
  osConfig,
  pkgs,
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
          iRadiusRatio = 0;
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

        audio = {
          externalMixer = "${lib.getExe pkgs.pwvucontrol}";
          preferredPlayer = config.home.opts.apps.audio.exe;
        };

        sessionMenu.showHeader = false;

        ui = {
          fontDefault = config.stylix.fonts.sansSerif.name;
          fontDefaultScale = 1.25;
          fontFixed = config.stylix.fonts.monospace.name;
          fontFixedScale = 1.25;
          tooltipsEnabled = true;
          panelBackgroundOpacity = 1;
          panelsAttachedToBar = true;
          settingsPanelAttachToBar = true;
        };
      }
      // osConfig.nixos.opts.niri.misc;
  };
}
