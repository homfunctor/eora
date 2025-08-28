{pkgs, ...}: {
  hardware.opentabletdriver.enable = true;

  systemd.user.services = {
    opentabletdriver = {
      description = "Open source, cross-platform, user-mode tablet driver";
      partOf = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];

      serviceConfig = {
        ExecStart = "${pkgs.opentabletdriver}/bin/otd-daemon";
        Restart = "on-failure";
        Type = "simple";
      };
    };
  };
}
