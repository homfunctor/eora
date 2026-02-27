# todo: check for other settings: https://docs.noctalia.dev/getting-started/nixos/
# todo: button that launches launcher, button that opens overview
{
  config,
  flake,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) userName;
  nExe = cmd:
    [(lib.getExe config.programs.noctalia-shell.package) "ipc" "call"]
    ++ (flake.lib.splitArg cmd);
in {
  imports = [
    ./bar.nix
    ./bg.nix
    ./launcher.nix
    ./nc.nix
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    bluez
    # don't know if package option exists
    # osConfig.nixos.opts.noct.pkg
  ];
  programs = {
    niri.settings.spawn-at-startup = [
      {
        command = nExe "volume muteInput";
      }
    ];

    noctalia-shell = {
      enable = true;
      package = osConfig.nixos.opts.noct.pkg;
      systemd.enable = true;

      settings =
        {
          general = {
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
          };

          audio = {
            externalMixer = "${lib.getExe pkgs.pwvucontrol}";
            preferredPlayer = config.home.opts.apps.audio.exe;
          };

          dock.enabled = false;

          sessionMenu.showHeader = false;

          ui = with config.stylix; {
            boxBorderEnabled = true;
            fontDefault = fonts.sansSerif.name;
            fontDefaultScale = 1.25;
            fontFixed = fonts.monospace.name;
            fontFixedScale = 1.25;
            panelBackgroundOpacity = opacity.desktop;
            panelsAttachedToBar = true;
            settingsPanelAttachToBar = true;
            tooltipsEnabled = true;
          };
        }
        // osConfig.nixos.opts.noct.misc;
    };
  };
}
