# extra aliases for Revelations
{
  nixos.opts.shellAliases = {
    # sometimes you wanna game on the side
    "m1" = "xrandr --output DP-1 --primary";
    "m2" = "xrandr --output HDMI-A-1 --primary";
    chwine = "LANG=zh_CN.UTF-8 wine";
    jpwine = "LANG=ja_JP.utf8 wine";
    # useful when making mods
    modsums = "hashdeep -l -r -c md5 */ | awk -F, 'NR>4 {print $2 \"  \" $3}'";
  };
}
