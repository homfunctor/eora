{
  config,
  lib,
  ...
}: let
  # main monitor is the 2nd
  monitor = lib.elemAt config.nixos.opts.bg.monitors 1;
  hlOpts = ["clockLabel" "dateLabel" "inputLabel"];
in {
  nixos.opts.hyprlockOpts = lib.genAttrs hlOpts (_: {inherit monitor;});
}
