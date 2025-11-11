# already set:
# XDG_RUNTIME_DIR = "/run/user/$UID";
# DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$UID/bus";
# XDG_CURRENT_DESKTOP = "Hyprland";
# XDG_SESSION_TYPE = "wayland";
# _JAVA_AWT_WM_NONREPARENTING = "1";
{
  config,
  osConfig,
  ...
}: {
  xdg.configFile = {
    "electron-flags.conf".text = ''
      --enable-features=UseOzonePlatform,WaylandWindowDecorations
      --ozone-platform-hint=wayland
      --ozone-platform=wayland
    '';
  };

  home.sessionVariables = with config.home.opts; {
    BROWSER = apps.browser.exe;
    CLUTTER_BACKEND = "wayland";
    DIRENV_LOG_FORMAT = "1";
    DISABLE_QT5_COMPAT = "0";
    DISABLE_QT_COMPAT = "0";
    EDITOR = apps.text.exe;
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    GDK_BACKEND = "wayland";
    GDK_SCALE = "1";
    GNOME_KEYRING_CONTROL = "$XDG_RUNTIME_DIR/keyring";
    HYPRCURSOR_SIZE = toString config.stylix.cursor.size;
    HYPRCURSOR_THEME = config.stylix.cursor.name;
    HYPRLAND_NO_RT = "1";
    MOZ_DBUS_REMOTE = 1;
    MOZ_DISABLE_RDD_SANDBOW = "1";
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_WAYLAND_USE_VAAPI = 1;
    NIXOS_OZONE_WL = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_IM_MODULE = "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland,x11";
    SHELL = apps.shell.exe;
    TERMINAL = apps.terminal.exe;
    VISUAL = apps.text.exe;
    WLR_BACKEND = osConfig.nixos.opts.wlrBR;
    WLR_RENDERER = osConfig.nixos.opts.wlrBR;
    XDG_SESSION_DESKTOP = "Hyprland";
  };
}
