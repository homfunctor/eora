{config, ...}: {
  config.stylix.targets.librewolf = {
    profileNames = [config.home.opts.userName];
  };
}
