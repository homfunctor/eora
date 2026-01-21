{
  nixos.opts.shellAliases = {
    # don't want to rely on zoxide for these
    eora = "z ~/eora";
    sapadal = "z ~/sapadal";

    revelations = "z ~/eora/hosts/revelations";
    thaos = "z ~/eora/hosts/revelations/users/thaos";
    wael = "z ~/eora/hosts/revelations/users/wael";

    rymrgand = "z ~/eora/hosts/vytmadh/users/rymrgand";
    vytmadh = "z ~/eora/hosts/vytmadh";

    inferno = "z ~/eora/hosts/inferno";
    magran = "z ~/eora/hosts/inferno/users/magran";

    # i'm lazy
    hfhs = "z /etc/profiles/per-user";
    nfhs = "z /run/current-system";
    ns = "z /nix/store";

    # nix
    ni = "nix-instantiate";
    nl = "nix-locate --minimal";

    # ...
    ".." = "z ../";
    "..." = "z ../../";
    "...." = " z ../../../";
    "....." = "z ../../../../";

    cat = "bat";
    cd = "z";
    cl = "clear";
    erd = "erd -I --suppress-size";
    eza = "eza -G -x --color=always --icons=always";
    gita = "git add .";
    gitc = "git commit -m";
    gitlol = "gita && gitc \"ok\" && gitps";
    gitpl = "git pull";
    gitps = "git push";
    grep = "rg";
    ls = "eza -G -x --color=always --icons=always";
    n = "nvim";
    yz = "yazi .";
  };
}
