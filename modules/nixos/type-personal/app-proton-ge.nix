{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # good enough compromise between strictly declarative and imperative
    protonplus
  ];
}
