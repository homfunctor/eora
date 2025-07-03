{
  config,
  inputs,
  pkgs,
  ...
}: let
  inherit (config.nixos.opts) adminUser;
in {
  imports = [inputs.sops-nix.nixosModules.default];

  environment.systemPackages = with pkgs; [
    age
    sops
    ssh-to-age
  ];

  sops = {
    age = {
      keyFile = "/home/${adminUser}/.config/sops/age/keys.txt";
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    };

    # .sops.yaml, secrets/secrets.yaml
    defaultSopsFile = "${inputs.sapadal}/secrets/secrets.yaml";
  };
}
