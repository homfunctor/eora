# family PC environment that is layered over type-minTTY and type-niceTTY.
# is disjoint from type-work and type-personal
{
  imports = [
    ../type-work/app-firefox.nix
    ../type-work/app-kitty.nix
    ../type-work/app-neovide.nix
    ../type-work/opt-gtk.nix
    ../type-work/opt-qt.nix
    ../type-work/opt-starship.nix
    ../type-work/opt-stylix
    ../type-work/opt-xdg.
  ];
}
