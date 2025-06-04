{
  inputs,
  perSystem,
  ...
}: {
  imports = [
    "${inputs.nixpkgs-gcr}/nixos/modules/services/desktops/gnome/gcr-ssh-agent.nix"
  ];

  config = {
    services.gnome.gcr-ssh-agent = {
      enable = true;
      package = perSystem.nixpkgs-gcr.gcr_4;
    };

    programs = {
      seahorse.enable = true;
      ssh.enableAskPassword = true;
    };
  };
}
