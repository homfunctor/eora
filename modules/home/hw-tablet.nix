{pkgs, ...}: {
  home.packages = with pkgs; [
    opentabletdriver
  ];

  systemd.user.services.opentabletdriver = {
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
}
