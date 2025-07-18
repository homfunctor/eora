# todo: re-organize
{config, ...}: let
  inherit (config.home.opts) apps;
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # smart gaps
      "bordersize 0, floating:0, onworkspace:f[1]"
      "bordersize 0, floating:0, onworkspace:w[t1]"
      "bordersize 0, floating:0, onworkspace:w[tg1]"
      "rounding 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:w[t1]"
      "rounding 0, floating:0, onworkspace:w[tg1]"

      # no maximize requests
      "suppressevent maximize, class:.*"

      # networkmanager applet
      "center, class:^(nm-connection-editor)$"
      "float, class:^(nm-connection-editor)$"
      "size $floatingSize, class:^(nm-connection-editor)$"

      # blueman
      "center, class:^(.blueman-manager-wrapped)$"
      "float, class:^(.blueman-manager-wrapped)$"
      "size $floatingSize, class:^(.blueman-manager-wrapped)$"

      # audio control
      "center, class:^(com.saivert.pwvucontrol)$"
      "float, class:^(com.saivert.pwvucontrol)$"
      "size $floatingSize, class:^(com.saivert.pwvucontrol)$"

      # udiskie
      "center, class:^(udiskie)$"
      "float, class:^(udiskie)$"

      # calculator
      "float, class:^(org.gnome.Calculator)$"
      "size > >, class:^(org.gnome.Calculator)$"

      # password focus
      "stayfocused, class:(gcr-prompter)"
      "stayfocused, class:^(polkit-), title:(Authenticate)"

      # file picker
      "float, class:^(xdg-desktop-portal-hyprland), title:(All Files)"
      "stayfocused, class:^(xdg-desktop-portal-hyprland), title:(All Files)"

      "float, class:^(xdg-desktop-portal-gtk), title:(All Files)"
      "stayfocused, class:^(xdg-desktop-portal-gtk), title:(All Files)"

      # protonplus
      "float,class:^(com.vysp3r.ProtonPlus), title:(ProtonPlus)"

      # winetricks
      "float,class:^(zenity)"

      # archiver
      "float,class:^(${apps.archive.desktop})"
    ];
  };
}
