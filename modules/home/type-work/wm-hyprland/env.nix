# already set:
#   XDG_RUNTIME_DIR = "/run/user/$UID";
#   DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$UID/bus";
{
  config,
  osConfig,
  ...
}: let
  inherit (config.home.opts) apps;
in {
  xdg.configFile = {
    "electron-flags.conf".text = ''
      --enable-features=UseOzonePlatform,WaylandWindowDecorations
      --ozone-platform-hint=wayland
      --ozone-platform=wayland
    '';

    "uwsm/env".text = ''
      export BROWSER=${apps.browser.exe}
      export CLUTTER_BACKEND=wayland
      export DIRENV_LOG_FORMAT=1
      export DISABLE_QT5_COMPAT=0
      export DISABLE_QT_COMPAT=0
      export EDITOR=${apps.text.exe}
      export ELECTRON_OZONE_PLATFORM_HINT="wayland";
      export GDK_BACKEND=wayland,x11
      export GDK_SCALE=1
      export GNOME_KEYRING_CONTROL="$XDG_RUNTIME_DIR/keyring"
      export HYPRCURSOR_SIZE=${toString config.stylix.cursor.size}
      export HYPRCURSOR_THEME=${config.stylix.cursor.name}
      export HYPRLAND_NO_RT=1
      export MOZ_ENABLE_WAYLAND=1
      export NIXOS_OZONE_WL=1
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_IM_MODULE=wayland
      export QT_QPA_PLATFORM=wayland;xcb
      export QT_QPA_PLATFORMTHEME=qt5ct
      export QT_SCALE_FACTOR=1
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export SDL_VIDEODRIVER=wayland,x11
      export SHELL=${apps.shell.exe}
      export TERMINAL=${apps.terminal.exe}
      export VISUAL=${apps.text.exe}
      export WLR_BACKEND=${osConfig.nixos.opts.wlrBR}
      export WLR_RENDERER=${osConfig.nixos.opts.wlrBR}
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
