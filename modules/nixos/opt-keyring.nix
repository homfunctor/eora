{
  inputs,
  perSystem,
  pkgs,
  ...
}: {
  imports = [
    "${inputs.nixpkgs-gcr}/nixos/modules/services/desktops/gnome/gcr-ssh-agent.nix"
  ];

  config = {
    services = {
      # dbus = {
      #   enable = true;
      #   implementation = "broker";
      #   packages = [
      #     perSystem.nixpkgs-gcr.gcr_4
      #     pkgs.libsecret
      #   ];
      # };

      gnome = {
        gnome-keyring.enable = true;

        gcr-ssh-agent = {
          enable = true;
          package = perSystem.nixpkgs-gcr.gcr_4;
        };
      };
    };

    programs = {
      seahorse.enable = true;
      ssh.enableAskPassword = true;
    };
  };
}
