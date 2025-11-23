# it's nice
{
  config,
  flake,
  pkgs,
  ...
}: {
  imports = [flake.modules.nixos.opt-fish];
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
    inherit (config.nixos.opts) shellAliases;

    interactiveShellInit = ''
      starship init fish | source
      zoxide init fish | source
    '';

    promptInit = "set fish_greeting";
  };
}
