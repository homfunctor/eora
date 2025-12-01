{config, ...}: {
  xdg.configFile."uwsm/env-hyprland".text = ''
    export XDG_CURRENT_DESKTOP=Hyprland
    export XDG_SESSION_DESKTOP=Hyprland
    export HYPRCURSOR_SIZE=${toString config.stylix.cursor.size}
    export HYPRCURSOR_THEME=${config.stylix.cursor.name}
    export HYPRLAND_NO_RT=1
  '';
}
