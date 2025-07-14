{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # provides open ports
    inputs.sapadal.modules.home.opt-torrenting
  ];

  environment.systemPackages = with pkgs; [
    protonvpn-gui
    qbittorrent
    wireguard-tools
  ];
}
