# so cutting edge it bleeds
# but this just gently enables the module and binary cache
{inputs, ...}: {
  imports = [
    inputs.chaotic.nixosModules.default
  ];
}
