{
  nixos.opts.fishAliases = {
    # don't want to rely on zoxide for these
    eora = "z ~/eora";
    revelations = "z ~/eora/hosts/revelations";
    rymrgand = "z ~/eora/hosts/vytmadh/users/rymrgand";
    sapadal = "z ~/sapadal";
    thaos = "z ~/eora/hosts/revelations/users/thaos";
    vytmadh = "z ~/eora/hosts/vytmadh";
    wael = "z ~/eora/hosts/revelations/users/wael";

    # i'm lazy
    hfhs = "z /etc/profiles/per-user";
    nfhs = "z /run/current-system";
    ns = "z /nix/store";

    # nix
    ni = "nix-instantiate";
    nl = "nix-locate --minimal";

    # sometimes you wanna game on the side
    "m1" = "xrandr --output DP-1 --primary";
    "m2" = "xrandr --output DP-2 --primary";

    # ...
    ".." = "z ../";
    "..." = "z ../../";
    "...." = " z ../../../";
    "....." = "z ../../../../";

    cat = "bat";
    cd = "z";
    chwine = "LANG=zh_CN.UTF-8 wine";
    cl = "clear";
    erd = "erd -I --suppress-size";
    eza = "eza -G -x --color=always --icons=always";
    gita = "git add .";
    gitc = "git commit -m";
    gitlol = "gita && gitc \"ok\" && gitps";
    gitpl = "git pull";
    gitps = "git push";
    grep = "rg";
    jpwine = "LANG=ja_JP.utf8 wine";
    ls = "eza -G -x --color=always --icons=always";
    n = "neovide";
    yz = "yazi .";

    # useful when making mods
    modsums = "hashdeep -l -r -c md5 */ | awk -F, 'NR>4 {print $2 \"  \" $3}'";
  };
}
