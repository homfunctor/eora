# personal fun stuff layered on the tippy top
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-proton-ge
    app-steam
    chaotic-ananicy
    # chaotic-mesa
  ];
}
