{config, ...}: let
  inherit (config.home.opts) apps;
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
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
      "float, class:^(xdg-desktop-portal-hyprland)"
      "stayfocused, class:^(xdg-desktop-portal-hyprland)"

      "float, class:^(xdg-desktop-portal-gtk)"
      "stayfocused, class:^(xdg-desktop-portal-gtk)"

      # winetricks
      "float,class:^(zenity)"

      # archiver
      "float,class:^(${apps.archive.desktop})"
    ];
  };
}
