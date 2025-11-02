{
  flake,
  inputs,
  osConfig,
  ...
}: {
  imports = with flake.modules.home; [
    # minimal tty
    opts
    type-minTTY

    # nicer tty
    ./apps.nix
    ./neovim.nix
    type-niceTTY

    # family PC
    type-familyPC
  ];

  home.opts = {
    inherit (osConfig.nixos.opts) hostName mainMonitor;
    userName = builtins.elemAt osConfig.nixos.opts.userNames 0;
    bg = {
      inherit (osConfig.nixos.opts.bg) monitors nWS resolutions xy;
      files = [
        "${inputs.sapadal}/assets/winter1.png"
      ];
    };
  };
}
