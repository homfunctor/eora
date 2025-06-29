# it's nice
{
  config,
  pkgs,
  ...
}: {
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

    interactiveShellInit = ''
      starship init fish | source
      zoxide init fish | source
    '';

    promptInit = "set fish_greeting";

    shellAliases = config.nixos.opts.fishAliases;
  };
}
