# todo: modularize once the hm module is better
{
  config,
  inputs,
  lib,
  perSystem,
  ...
}: let
  inherit (config.home.opts) hyprpanelLayout;
  inherit (config.stylix) fonts;
  inherit (lib) mkDefault;

  colors = config.lib.stylix.colors.withHashtag;

  accent = colors.base08;
  accent-alt = colors.base0B;
  background = colors.base00;
  background-alt = colors.base01;
  foreground = colors.base05;

  font = "${fonts.serif.name}";
  fontSize = "${toString fonts.sizes.desktop}";
in {
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  programs.hyprpanel = {
    enable = true;
    overwrite.enable = true;

    settings.layout."bar.layouts" = hyprpanelLayout;

    override = mkDefault {
      # panel settings
      "bar.autoHide" = "never";

      "bar.battery.hideLabelWhenFull" = false;
      "bar.battery.label" = true;
      "bar.battery.middleClick" = "";
      "bar.battery.rightClick" = "";
      "bar.battery.scrollDown" = "";
      "bar.battery.scrollUp" = "";

      "bar.bluetooth.label" = false;

      "bar.clock.format" = "%a %b %d  %I:%M %p";
      "bar.clock.icon" = "󰸗";
      "bar.clock.middleClick" = "";
      "bar.clock.rightClick" = "";
      "bar.clock.scrollDown" = "";
      "bar.clock.scrollUp" = "";
      "bar.clock.showIcon" = true;
      "bar.clock.showTime" = true;

      "bar.customModules.cpu.icon" = "";
      "bar.customModules.cpu.label" = true;
      "bar.customModules.cpu.leftClick" = "";
      "bar.customModules.cpu.middleClick" = "";
      "bar.customModules.cpu.pollingInterval" = "2000";
      "bar.customModules.cpu.rightClick" = "";
      "bar.customModules.cpu.round" = true;
      "bar.customModules.cpu.scrollDown" = "";
      "bar.customModules.cpu.scrollUp" = "";

      "bar.customModules.cpuTemp.icon" = "";
      "bar.customModules.cpuTemp.label" = true;
      "bar.customModules.cpuTemp.leftClick" = "";
      "bar.customModules.cpuTemp.middleClick" = "";
      "bar.customModules.cpuTemp.pollingInterval" = "2000";
      "bar.customModules.cpuTemp.rightClick" = "";
      "bar.customModules.cpuTemp.round" = true;
      "bar.customModules.cpuTemp.scrollDown" = "";
      "bar.customModules.cpuTemp.scrollUp" = "";
      "bar.customModules.cpuTemp.sensor" = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon3/temp1_input";
      "bar.customModules.cpuTemp.showUnit" = true;
      "bar.customModules.cpuTemp.unit" = "metric";

      "bar.customModules.microphone.label" = true;
      "bar.customModules.microphone.leftClick" = "menu:audio";
      "bar.customModules.microphone.middleClick" = "";
      "bar.customModules.microphone.mutedIcon" = "󰍭";
      "bar.customModules.microphone.rightClick" = "";
      "bar.customModules.microphone.scrollDown" = "";
      "bar.customModules.microphone.scrollUp" = "";
      "bar.customModules.microphone.unmutedIcon" = "󰍬";

      "bar.customModules.power.icon" = "";
      "bar.customModules.power.leftClick" = "menu:powerdropdown";
      "bar.customModules.power.middleClick" = "";
      "bar.customModules.power.rightClick" = "";
      "bar.customModules.power.scrollDown" = "";
      "bar.customModules.power.scrollUp" = "";
      "bar.customModules.power.showLabel" = true;

      "bar.customModules.ram.icon" = "";
      "bar.customModules.ram.label" = true;
      "bar.customModules.ram.labelType" = "percentage";
      "bar.customModules.ram.leftClick" = "";
      "bar.customModules.ram.middleClick" = "";
      "bar.customModules.ram.pollingInterval" = "2000";
      "bar.customModules.ram.rightClick" = "";
      "bar.customModules.ram.round" = true;

      "bar.customModules.storage.icon" = "󰋊";
      "bar.customModules.storage.label" = true;
      "bar.customModules.storage.labelType" = "percentage";
      "bar.customModules.storage.leftClick" = "";
      "bar.customModules.storage.middleClick" = "";
      "bar.customModules.storage.pollingInterval" = "2000";
      "bar.customModules.storage.rightClick" = "";
      "bar.customModules.storage.round" = false;

      "bar.launcher.icon" = "";

      "bar.media.show_label" = false;

      "bar.network.label" = false;

      "bar.notifications.show_total" = true;

      "bar.windowtitle.label" = true;

      "bar.workspaces.applicationIconEmptyWorkspace" = "";
      "bar.workspaces.applicationIconFallback" = "󰣆";
      "bar.workspaces.applicationIconOncePerWorkspace" = true;
      "bar.workspaces.hideUnoccupied" = false;
      "bar.workspaces.numbered_active_indicator" = "underline";
      "bar.workspaces.monitorSpecific" = true;
      "bar.workspaces.reverse_scroll" = false;
      "bar.workspaces.showAllActive" = true;
      "bar.workspaces.show_icons" = true;
      "bar.workspaces.show_numbered" = true;
      "bar.workspaces.showApplicationIcons" = true;
      "bar.workspaces.showWsIcons" = true;
      "bar.workspaces.spacing" = "1";
      "bar.workspaces.workspaces" = "6";

      "bar.volume.label" = true;
      "bar.volume.middleClick" = "";
      "bar.volume.rightClick" = "";
      "bar.volume.scrollDown" = "${perSystem.hyprpanel.wrapper}/bin/hyprpanel 'vol -5'";
      "bar.volume.scrollUp" = "${perSystem.hyprpanel.wrapper}/bin/hyprpanel 'vol +5'";

      "menus.clock.time.hideSeconds" = true;
      "menus.clock.time.military" = false;

      "menus.clock.weather.enabled" = false;

      "menus.media.noMediaText" = "";

      "menus.power.confirmation" = false;
      "menus.power.logout" = "uwsm stop";
      "menus.power.lowBatteryNotification" = true;
      "menus.power.reboot" = "systemctl reboot";
      "menus.power.showLabel" = true;
      "menus.power.shutdown" = "systemctl poweroff";
      "menus.power.sleep" = "systemctl suspend";

      "menus.transition" = "crossfade";

      "notifications.active_monitor" = true;
      "notifications.cache_actions" = true;
      "notifications.clearDelay" = "100";
      "notifications.displayedTotal" = "10";
      "notifications.monitor" = "0";
      "notifications.position" = "top right";
      "notifications.showActionsOnHover" = false;
      "notifications.timeout" = "7000";
      "scalingPriority" = "both";
      "tear" = false;

      # theme settings
      "theme.font.name" = "${font}";
      "theme.font.size" = "${fontSize}px";

      "theme.bar.background" = "${background}";

      "theme.bar.border_radius" = "0px";

      "theme.bar.buttons.background" = "${background-alt}";
      "theme.bar.buttons.borderSize" = "0.08em";
      "theme.bar.buttons.borderColor" = "${accent}";
      "theme.bar.buttons.border.radius" = "0px";
      "theme.bar.buttons.enableBorders" = true;
      "theme.bar.buttons.hover" = "${background}";
      "theme.bar.buttons.icon" = "${accent}";
      "theme.bar.buttons.monochrome" = true;
      "theme.bar.buttons.notifications.background" = "${background-alt}";
      "theme.bar.buttons.notifications.hover" = "${background}";
      "theme.bar.buttons.notifications.icon" = "${accent}";
      "theme.bar.buttons.notifications.total" = "${accent}";
      "theme.bar.buttons.padding_x" = "0.8rem";
      "theme.bar.buttons.padding_y" = "0.4rem";
      "theme.bar.buttons.radius" = "0px";
      "theme.bar.buttons.style" = "default";
      "theme.bar.buttons.text" = "${foreground}";
      "theme.bar.buttons.workspaces.active" = "${accent}";
      "theme.bar.buttons.workspaces.available" = "${accent-alt}";
      "theme.bar.buttons.workspaces.hover" = "${accent-alt}";
      "theme.bar.buttons.workspaces.numbered_active_underline_color" = "${accent-alt}";
      "theme.bar.buttons.workspaces.occupied" = "${accent-alt}";
      "theme.bar.buttons.workspaces.smartHighlight" = true;

      "theme.bar.dropdownGap" = "4.5em";
      "theme.bar.floating" = false;
      "theme.bar.location" = "top";
      "theme.bar.margin_top" = "0.5em";

      "theme.bar.menus.background" = "${background}";
      "theme.bar.menus.cards" = "${background-alt}";
      "theme.bar.menus.card_radius" = "0px";
      "theme.bar.menus.check_radio_button.active" = "${accent}";
      "theme.bar.menus.border.color" = "${accent}";
      "theme.bar.menus.buttons.active" = "${accent}";
      "theme.bar.menus.buttons.default" = "${accent}";
      "theme.bar.menus.dropdownmenu.background" = "${background-alt}";
      "theme.bar.menus.dropdownmenu.text" = "${foreground}";
      "theme.bar.menus.iconbuttons.active" = "${accent}";
      "theme.bar.menus.icons.active" = "${accent}";
      "theme.bar.menus.label" = "${foreground}";
      "theme.bar.menus.listitems.active" = "${accent}";
      "theme.bar.menus.menu.media.background.color" = "${background-alt}";
      "theme.bar.menus.menu.media.card.color" = "${background-alt}";
      "theme.bar.menus.menu.media.card.tint" = "90";
      "theme.bar.menus.monochrome" = true;
      "theme.bar.menus.popover.text" = "${foreground}";
      "theme.bar.menus.popover.background" = "${background-alt}";
      "theme.bar.menus.progressbar.foreground" = "${accent}";
      "theme.bar.menus.slider.primary" = "${accent}";
      "theme.bar.menus.switch.enabled" = "${accent}";
      "theme.bar.menus.text" = "${foreground}";
      "theme.bar.menus.tooltip.background" = "${background-alt}";
      "theme.bar.menus.tooltip.text" = "${foreground}";

      "theme.bar.transparent" = false;

      "theme.notification.actions.background" = "${accent}";
      "theme.notification.actions.text" = "${foreground}";
      "theme.notification.background" = "${background-alt}";
      "theme.notification.border" = "${background-alt}";
      "theme.notification.border_radius" = "0px";
      "theme.notification.close_button.background" = "${accent}";
      "theme.notification.label" = "${accent}";
      "theme.notification.labelicon" = "${accent}";
      "theme.notification.text" = "${foreground}";

      "theme.osd.enable" = true;
      "theme.osd.bar_color" = "${accent}";
      "theme.osd.bar_container" = "${background-alt}";
      "theme.osd.bar_overflow_color" = "${accent-alt}";
      "theme.osd.icon" = "${background}";
      "theme.osd.icon_container" = "${accent}";
      "theme.osd.label" = "${accent}";
      "theme.osd.location" = "left";
      "theme.osd.margins" = "0px 0px 0px 10px";
      "theme.osd.muted_zero" = true;
      "theme.osd.orientation" = "vertical";
      "theme.osd.radius" = "0px";

      "wallpaper.pywal" = false;
      "wallpaper.enable" = false;
    };
  };
}
