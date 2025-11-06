{inputs, ...}: {
  imports = [inputs.hyprshell.homeModules.hyprshell];

  programs.hyprshell = {
    enable = true;
    systemd.args = "-v";
    settings = {
      windows = {
        enable = true;
        overview.enable = false;
        switch.enable = true;
      };
    };
  };
}
