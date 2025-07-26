{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.default];

  environment.systemPackages = with pkgs; [
    age
    sops
    ssh-to-age
  ];

  sops = {
    age = {
      keyFile = "/home/${config.nixos.opts.adminUser}/.config/sops/age/keys.txt";
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    };

    defaultSopsFile = "${inputs.sapadal}/secrets/secrets.yaml";
  };
}
