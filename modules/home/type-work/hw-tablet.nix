{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    opentabletdriver
  ];

  systemd.user.services = {
    opentabletdriver = {
      Unit = {
        Description = "OpenTabletDriver Daemon";
        PartOf = "graphical-session.target";
        After = "graphical-session.target";
      };
      Service = {
        ExecStart = "${pkgs.opentabletdriver}/bin/otd-daemon";
        Restart = "on-failure";
      };
      Install.WantedBy = ["graphical-session.target"];
    };

    # hack to get rid of troublesome files while switching users
    # assumes wheel does not need pwd for root
    clean-tmp-otd = {
      Unit = {
        Description = "Cleans up temporary files from otd-daemon";
        PartOf = ["graphical-session.target"];
        After = ["graphical-session.target"];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${lib.getExe pkgs.bash} -c 'sudo rm -f /tmp/CoreFxPipe_OpenTabletDriver.*'";
        RemainAfterExit = false;
      };
      Install.wantedBy = ["default.target"];
    };
  };
}
