# todo: re-organize
{
  config,
  ...
}: let
  inherit (config.home.opts) apps;
in {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
    ];

    windowrulev2 = [
      # smart gaps
      "bordersize 0, floating:0, onworkspace:w[t1]"
      "bordersize 0, floating:0, onworkspace:w[tg1]"
      "bordersize 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:w[t1]"
      "rounding 0, floating:0, onworkspace:w[tg1]"
      "rounding 0, floating:0, onworkspace:f[1]"

      # no maximize requests
      "suppressevent maximize, class:.*"

      # fix some dragging issues with XWayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

      # networkManager applet
      "float, class:^(nm-connection-editor)$"
      "size $floatingSize, class:^(nm-connection-editor)$"
      "center, class:^(nm-connection-editor)$"

      # blueman
      "float, class:^(.blueman-manager-wrapped)$"
      "size $floatingSize, class:^(.blueman-manager-wrapped)$"
      "center, class:^(.blueman-manager-wrapped)$"

      # audio control
      "float, class:^($com.saivert.pwvucontrol)$"
      "size $floatingSize, class:^($com.saivert.pwvucontrol)$"
      "center, class:^($com.saivert.pwvucontrol)$"

      # udiskie
      "float, class:^(udiskie)$"
      "center, class:^(udiskie)$"

      # make PiP window floating and sticky
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      # calculator
      "float, class:^(org.gnome.Calculator)$"
      "size > >, class:^(org.gnome.Calculator)$"

      # steam
      "immediate, class:^(steam_app_*)$"
      "float, class:steam"
      "tile, class:steam, title:Steam"

      # password focus
      "stayfocused, class:^(pinentry-)"
      "stayfocused, class:^(polkit-), title:(Authenticate)"
      "stayfocused, class:(gcr-prompter)"

      # file picker
      "float, class:^(xdg-desktop-portal-hyprland), title:(All Files)"
      "stayfocused, class:^(xdg-desktop-portal-hyprland), title:(All Files)"

      "float, class:^(xdg-desktop-portal-gtk), title:(All Files)"
      "stayfocused, class:^(xdg-desktop-portal-gtk), title:(All Files)"

      # protonplus
      "float,class:^(com.vysp3r.ProtonPlus), title:(ProtonPlus)"

      # winetricks
      "float,class:^(zenity)"

      "float,class:^(${apps.archive.desktop})"
    ];
  };
}
