# sops settings
{
  config,
  inputs,
  pkgs,
  ...
}: let
  inherit (config.nixos.opts) adminuser;
in {
  imports = [
    inputs.sops-nix.nixosModules.default
    ./sops-users.nix
  ];

  environment.systemPackages = with pkgs; [
    age
    sops
    ssh-to-age
  ];

  sops = {
    age = {
      generateKey = true;
      keyFile = "/home/${adminuser}/.config/sops/age/keys.txt";
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    };
    defaultSopsFile = "${inputs.sapadal}/secrets/secrets.yaml";
  };
}
