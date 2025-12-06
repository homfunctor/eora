{
  config,
  osConfig,
  ...
}: let
  inherit (config.home.opts) apps;
in {
  programs.niri.settings.environment = {
    BROWSER = apps.browser.exe;
    CLUTTER_BACKEND = "wayland";
    # DIRENV_LOG_FORMAT = "1";
    # DISABLE_QT5_COMPAT = "0";
    # DISABLE_QT_COMPAT = "0";
    EDITOR = apps.text.exe;
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    GDK_BACKEND = "wayland,x11";
    # GDK_SCALE = "1";
    GNOME_KEYRING_CONTROL = "$XDG_RUNTIME_DIR/keyring";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    # QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_IM_MODULE = "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    # QT_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
    SHELL = apps.shell.exe;
    TERMINAL = apps.terminal.exe;
    VISUAL = apps.text.exe;
    WLR_BACKEND = osConfig.nixos.opts.wlrBR;
    WLR_RENDERER = osConfig.nixos.opts.wlrBR;
    # XDG_SESSION_TYPE = "wayland";
    # _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  xdg.configFile = {
    "electron-flags.conf".text = ''
      --enable-features=UseOzonePlatform,WaylandWindowDecorations
      --ozone-platform-hint=wayland
      --ozone-platform=wayland
    '';
  };
}
