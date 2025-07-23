{pkgs, ...}: {
  environment.systemPackages = [pkgs.patchelf];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
    # ok settle down and just fill it in when needed
    libraries = with pkgs; [
      stdenv.cc.cc
    ];
  };
}
