# it's nice
{pkgs, ...}: {
  environment.systemPackages = with pkgs.fishPlugins;
    [
      colored-man-pages
      fzf
      grc
    ]
    ++ (with pkgs; [
      fzf
      grc
    ]);

  programs.fish = {
    enable = true;

    promptInit = ''
      set fish_greeting
    '';

    shellInit = ''
      zoxide init fish | source
    '';

    shellAliases = {
      # don't want to rely on zoxide for these
      "eora" = "z ~/eora";
      "sapadal" = "z ~/sapadal";
      "revelations" = "z ~/eora/hosts/revelations";
      "wael" = "z ~/eora/hosts/revelations/users/wael";
      "thaos" = "z ~/eora/hosts/revelations/users/thaos";
      "vytmadh" = "z ~/eora/hosts/vytmadh";
      "rymrgand" = "z ~/eora/hosts/vytmadh/users/rymrgand";

      # i'm lazy
      "nfhs" = "z /run/current-system/";
      "hfhs" = "z /etc/profiles/per-user/";

      # nix
      "ni" = "nix-instantiate";

      # sometimes you wanna game on the side
      "m1" = "xrandr --output DP-1 --primary";
      "m2" = "xrandr --output DP-2 --primary";

      # ...
      ".." = "z ../";
      "..." = "z ../../";
      "...." = " z ../../../";
      "....." = "z ../../../../";

      cat = "bat";
      cl = "clear";
      cd = "z";
      eza = "eza -G -x --color=always --icons=always";
      erd = "erd -I --suppress-size";
      gita = "git add .";
      gitc = "git commit -m";
      gitlol = "gita && gitc \".\" && gitps";
      gitpl = "git pull";
      gitps = "git push";
      grep = "rg";
      ls = "eza -G -x --color=always --icons=always";
      n = "nvim";
    };
  };
}
