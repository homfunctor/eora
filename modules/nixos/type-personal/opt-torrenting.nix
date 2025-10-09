{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # provides open ports
    inputs.sapadal.modules.nixos.opt-torrenting
  ];

  environment.systemPackages = with pkgs; [
    protonvpn-gui
    qbittorrent
    wireguard-tools
  ];
}
