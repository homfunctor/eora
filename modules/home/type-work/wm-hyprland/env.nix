# todo: look for redundancies
# already set:
#   XDG_RUNTIME_DIR = "/run/user/$UID";
#   DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$UID/bus";
{config, ...}: let
  inherit (config.home.opts) apps;
in {
  xdg.configFile = {
    "electron-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';

    "uwsm/env".text = ''
      export BROWSER=${toString apps.browser.exe}
      export CLUTTER_BACKEND=wayland
      export DIRENV_LOG_FORMAT=1
      export DISABLE_QT5_COMPAT=0
      export DISABLE_QT_COMPAT=0
      export EDITOR=${toString apps.text.exe}
      export GDK_BACKEND=wayland,x11
      export GDK_SCALE=1
      export GNOME_KEYRING_CONTROL="$XDG_RUNTIME_DIR/keyring"
      export HYPRCURSOR_SIZE=${toString config.stylix.cursor.size}
      export HYPRCURSOR_THEME=${config.stylix.cursor.name}
      export HYPRLAND_NO_RT=1
      export MOZ_DISABLE_RDD_SANDBOW=1
      export MOZ_ENABLE_WAYLAND=1
      export NIXOS_OZONE_WL=1
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_IM_MODULE=wayland
      export QT_QPA_PLATFORM=wayland;xcb
      export QT_QPA_PLATFORMTHEME=qt5ct
      export QT_SCALE_FACTOR=1
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export SDL_VIDEODRIVER=wayland,x11
      export SHELL=${toString apps.shell.exe}
      export TERMINAL=${toString apps.terminal.exe}
      export VISUAL=${toString apps.text.exe}
      export WLR_BACKEND=wayland
      export WLR_DRM_NO_ATOMIC=1
      export WLR_NO_HARDWARE_CURSORS=1
      export WLR_RENDERER=wayland
      export XDG_CURRENT_DESKTOP=Hyprland
      export XDG_SESSION_DESKTOP=Hyprland
      export XDG_SESSION_TYPE=wayland
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';

    "uwsm/env-hyprland".text = ''
      export XDG_CURRENT_DESKTOP=Hyprland
      export XDG_SESSION_DESKTOP=Hyprland
    '';
  };
}
