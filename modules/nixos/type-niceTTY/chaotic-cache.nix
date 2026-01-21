# todo: make sure everything works
# need to import this for the cache
# otherwise we rebuild a kernel on the first switch
{inputs, ...}: {imports = [inputs.chaotic.nixosModules.default];}
