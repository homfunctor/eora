# CAUTION: fuck this up and you'll need to defile /nix/store
# vytmadh
{inputs, ...}: {
  # not really secret i just like privacy
  imports = [
    inputs.sapadal.modules.nixos.fsys-vytmadh
  ];
}
