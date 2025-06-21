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

    interactiveShellInit = "starship init fish | source";

    promptInit = ''
      set fish_greeting
    '';

    shellInit = ''
      zoxide init fish | source
    '';

    shellAliases = {
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
      nl = "nix-locate --minimal --top-level";

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
      rm = "rip";
    };
  };
}
