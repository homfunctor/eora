# todo
_: {
  programs.noctalia-shell.settings.wallpaper = {
    enabled = true;
  };

  # programs.niri.settings.spawn-at-startup =
  #   lib.zipListsWith (m: b: {
  #     command = ["${lib.getExe swaybgPkg}" "--image" b "-o" m];
  #   })
  #   monitors
  #   files;
}
