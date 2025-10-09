# end4
{
  wayland.windowManager.hyprland.settings.animations = {
    enabled = "yes, please :)";

    animation = [
      "border, 1, 10, emphasizedDecel"
      "fadeLayersIn, 1, 0.5, menu_decel"
      "fadeLayersOut, 1, 2.7, menu_accel"
      "layersIn, 1, 2.7, emphasizedDecel, popin 93%"
      "layersOut, 1, 2.4, menu_accel, popin 94%"
      "specialWorkspaceIn, 1, 2.8, emphasizedDecel, slidevert"
      "specialWorkspaceOut, 1, 1.2, emphasizedAccel, slidevert"
      "windowsIn, 1, 3, emphasizedDecel, popin 80%"
      "windowsMove, 1, 3, emphasizedDecel, slide"
      "windowsOut, 1, 2, emphasizedDecel, popin 90%"
      "workspaces, 1, 7, menu_decel, slide"
    ];

    bezier = [
      "emphasizedAccel, 0.3, 0, 0.8, 0.15"
      "emphasizedDecel, 0.05, 0.7, 0.1, 1"
      "expressiveDefaultSpatial, 0.38, 1.21, 0.22, 1.00"
      "expressiveFastSpatial, 0.42, 1.67, 0.21, 0.90"
      "expressiveSlowSpatial, 0.39, 1.29, 0.35, 0.98"
      "menu_accel, 0.52, 0.03, 0.72, 0.08"
      "menu_decel, 0.1, 1, 0, 1"
      "standardDecel, 0, 0, 0, 1"
    ];
  };
}
