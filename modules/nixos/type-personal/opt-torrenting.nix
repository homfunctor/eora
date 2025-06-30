{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    protonvpn-gui
    qbittorrent
    wireguard-tools
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [11639];
      allowedUDPPorts = [11639];
      checkReversePath = false;
    };
    nameservers = ["1.1.1.1" "8.8.8.8"];
  };
}
